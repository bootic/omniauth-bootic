require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bootic < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "Bootic"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: "https://api.bootic.net",
        authorize_url: 'https://api.bootic.net/oauth/authorize',
        token_url: 'https://api.bootic.net/oauth/token'
      }
      
      def request_phase
        super
      end
      
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
      uid{ raw_info['id'].to_s }

      info do
        {
          name: raw_info['user_info']['user_name'],
          email: raw_info['user_info']['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/me').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'bootic', 'Bootic'