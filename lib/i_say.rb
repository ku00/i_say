require "i_say/version"
require "i_say/cli"
require "i_say/config"
require 'voice_text_api'

module ISay
  class << self
    SPEAKER = %i(haruka hikari takeru)
    VOLUME  = 200

    def fetch_sound(word)
      config = ISay::Config.new
      # return unless word
      raise "ENV['VT_API_KEY'] is required" unless config.api_key

      voice_text = VoiceTextAPI.new(config.api_key)
      speaker = SPEAKER[rand(3)]

      voice_text.tts(word, speaker, volume: VOLUME)
    end

    def get_song_lyric
      "悲しみに閉ざされて 泣くだけの君じゃない 熱い胸 きっと未来を切り開く筈さ 悲しみに閉ざされて 泣くだけじゃつまらない きっと(きっと)君の(夢の) チカラ(いまを)動かすチカラ 信じてるよ…だからSTART!!"
    end
  end
end
