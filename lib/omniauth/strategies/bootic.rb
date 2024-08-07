require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bootic < OmniAuth::Strategies::OAuth2

      BOOTIC_AUTH_URL = (ENV['BOOTIC_AUTH_URL'] || "https://auth.bootic.net")
      BOOTIC_API_URL  = (ENV['BOOTIC_API_URL'] || "https://api.bootic.net/v1")

      option :name, "Bootic"
      option :provider_ignores_state, false

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: BOOTIC_API_URL,
        authorize_url: "#{BOOTIC_AUTH_URL}/oauth/authorize",
        token_url: "#{BOOTIC_AUTH_URL}/oauth/token"
      }

      def authorize_params
        if request.params['scope']
          super.merge({scope: request.params['scope']})
        else
          super
        end
      end

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid { raw_info['uid'].to_s }

      info do
        {
          account_id: raw_info['account_id'],
          name:  raw_info['user_name'],
          email: raw_info['email'],
          shops: raw_info['_embedded']['shops']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v1').parsed
      end

    end
  end
end

OmniAuth.config.add_camelization 'bootic', 'Bootic'
