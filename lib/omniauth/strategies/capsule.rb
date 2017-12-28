require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Capsule < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.capsulecrm.com/api/v2',
        authorize_url: 'https://api.capsulecrm.com/oauth/authorise',
        token_url: 'https://api.capsulecrm.com/oauth/token'
      }

      def request_phase
        super
      end

      def callback_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/users/current").parsed["data"]
      end
    end
  end
end
