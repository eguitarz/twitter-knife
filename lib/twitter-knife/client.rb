require 'json'

module TwitterKnife
  API_VERSION = '1.1'
  TWITTER_API_HOST = 'api.twitter.com'
  TWITTER_SEARCH_HOST = 'search.twitter.com'

  class Client
    def initialize(options)
      @options = options

      # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
      @access_token = prepare_access_token()
    end

    def get(api, options={})
      args = options.map{|k,v| "#{k}=#{v}" }.join('&')
      response = @access_token.request(:get, "/#{API_VERSION}/#{api}?#{args}")
      response.body
    end

    def post(api, body='')
      response = @access_token.request(:post, "/#{API_VERSION}/#{api}", body)
      response.body
    end

    # Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
    def prepare_access_token
      consumer = OAuth::Consumer.new(@options[:consumer_key], @options[:consumer_secret],
        { :site => "https://#{TWITTER_API_HOST}",
          :scheme => :header
        })
      # now create the access token object from passed values
      token_hash = { :oauth_token => @options[:oauth_token],
                     :oauth_token_secret => @options[:oauth_token_secret]
                   }
      access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
    end
  end
end