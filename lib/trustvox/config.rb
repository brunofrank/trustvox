module Trustvox
  # Responsible to hold api's access token
  class Config
    @store_id = nil
    @token = nil
    @staging = false

    def self.store_id=(value)
      @store_id = value
    end

    def self.store_id
      @store_id || ENV['TRUSTVOX_STORE_ID']
    end

    def self.token=(value)
      @token = value
    end

    def self.token
      @token || ENV['TRUSTVOX_ACCESS_TOKEN']
    end

    def self.store_token=(value)
      @store_token = value
    end

    def self.store_token
      @store_token || ENV['TRUSTVOX_STORE_TOKEN']
    end

    def self.is_on_staging?
      @staging
    end

    def self.staging!
      @staging = true
    end

    def self.production!
      @staging = false
    end
  end
end
