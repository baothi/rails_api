# In Rails, you could put this in config/initializers/koala.rb
Koala.configure do |config|
  # config.access_token = MY_TOKEN
  # config.app_access_token = MY_APP_ACCESS_TOKEN
  config.app_id = "1006500409691141"
  config.app_secret = "e0ab04723a007767be2afa74a2b5c4d3"
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end