require 'httparty'

module Trustvox
  # Base class for all api request
  class Base
    include HTTParty

    headers 'Accept' => 'application/vnd.trustvox.com; version=1',
            'Content-Type' => 'application/json'

    def initialize
      if Config.is_on_staging?
        self.class.base_uri 'http://staging.trustvox.com.br/api'
        seld.class.debug_output $stdout
      else
        self.class.base_uri 'http://trustvox.com.br/api'
      end
    end

    def auth_by_platform_token!
      self.class.headers 'Authorization' => "token #{Config.token}"
    end

    def auth_by_store_token!
      self.class.headers 'Authorization' => "token #{Config.store_token}"
    end
  end
end
