module Core
  class ShareActions
  # share_obj attributes
  # content
  # created_at
  # view_count
  # share_key

    def self.save(content)
      share_key = create_key(content)
      # TODO save share_obj
      share_key
    end

    def self.get(share_key)
      # TODO inc view_count of share_obj
      { content: share_key }
    end

    def self.verify(share_obj)
      # TODO verify view_count
      # TODO verify expire
      # TODO if verify failed destroy msg
      true
    end

    def self.create_key(content)
      # TODO check key in exist in redis
      "some_key"
    end
  end
end
