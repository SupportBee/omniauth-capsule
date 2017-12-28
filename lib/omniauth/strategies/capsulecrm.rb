require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class CapsuleCrm < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.capsulecrm.com',
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
        binding.pry
        @raw_info ||= access_token.get("/api/v2/users").parsed["data"]
      end
    end
  end
end
