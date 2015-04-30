require 'dotenv'

module ISay
  class Config
    attr_reader :api_key

    def initialize
      Dotenv.load
      @api_key = ENV['VT_API_KEY']
    end
  end
end
