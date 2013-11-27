require "dalli"

module Core
  class ShareActions
  # share_obj attributes
  # content
  # created_at
  # view_count
  # share_key
    
    @@dc = nil

    def self.save(content)
      share_key = create_key
      dc = get_dc
      share_obj = { content: content, created_at: DateTime.now.to_i, view_count: 0}
      dc.set(share_key, share_obj)
      share_key
    end

    def self.get(share_key, ignore_view = false)
      dc = get_dc
      share_obj = dc.get(share_key)

      if !ignore_view and share_obj
        new_share_obj = { content: share_obj[:content], created_at: share_obj[:created_at], view_count: share_obj[:view_count] + 1 }
        dc.replace(share_key, new_share_obj)
      end

      share_obj
    end

    def self.verify(share_key)
      result = false
      dc = get_dc
      share_obj = dc.get(share_key, true)

      if share_obj and share_obj[:view_count] < Settings.message.max_view_count 
        if share_obj[:created_at] + Settings.message.expire > DateTime.now.to_i
          result = true
        end
      end
      dc.delete(share_key) unless result
      result
    end

    def self.create_key
      dc = get_dc
      share_key = create_rand_string
      while dc.get(share_key) do
        share_key = create_rand_string
      end
      share_key
    end

    def self.get_dc
      options = {
        namesapce: Settings.site.name,
        expires_in: Settings.message.expire,
        compress: true }
      @@dc = Dalli::Client.new("localhost:11211", options) if @@dc == nil
      @@dc
    end

    def self.create_rand_string(length = 6)
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
      result = ""
      length.times { result << chars[rand(chars.size - 1)] }
      result
    end
  end
end
