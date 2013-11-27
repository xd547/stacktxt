module Core
  class ShareActions
  # share_obj attributes
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
      "some_key"
    end
  end
end
