require "i_say/version"
require "i_say/config"
require "i_say/cli"
require 'voice_text_api'

module ISay
  class << self
    SPEAKER = %i(haruka hikari takeru)
    VOLUME  = 200

    def fetch_sound(word, config)
      # return unless word
      raise "ENV['VT_API_KEY'] is required" unless config.api_key

      voice_text = VoiceTextAPI.new(config.api_key)
      speaker = SPEAKER[rand(3)]

      voice_text.tts(word, speaker, volume: VOLUME)
    end
  end
end
