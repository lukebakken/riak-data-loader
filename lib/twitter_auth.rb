require 'yaml'

class TwitterAuth
  attr_accessor :consumer_key, :consumer_secret,
    :access_token, :access_token_secret

  def initialize
    config = YAML.load_file(File.join(ENV['HOME'], '.twauth'))
    @consumer_key        = config['consumer_key']
    @consumer_secret     = config['consumer_secret']
    @access_token        = config['access_token']
    @access_token_secret = config['access_token_secret']
  end

end
