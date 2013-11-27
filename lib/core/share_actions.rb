module Core
  class ShareActions
    def self.save(content)
      "some_key"
    end

    def self.get(share_key)
      { content: share_key }
    end

    def self.verify(share_obj)
      true
    end
  end
end
