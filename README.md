# Simple Twitter Client

## install
gem install 'twitter-knife'

## use
```ruby
require 'twitter-knife'

client = TwitterKnife::Client.new({
  :consumer_key => CONSUMER_KEY,
  :consumer_secret => CONSUMER_SECRET,
  :oauth_token => OAUTH_TOKEN,
  :oauth_token_secret => OAUTH_SECRET
})

client.get('users/show', {:screen_name => 'eguitarz'})
```