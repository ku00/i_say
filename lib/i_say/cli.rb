require "i_say"
require "thor"
require 'open3'

module ISay
  class CLI < Thor
    default_command :say

    desc "say", "say word"
    def say(word)
      config = ISay::Config.new

      sound = ISay.fetch_sound(word, config)
      Open3.capture3("/usr/local/bin/play -", :stdin_data => sound)
    end

    desc "START:DASH!!", "sing START:DASH"
    def sing
      config = ISay::Config.new
      lyric = ISay.get_song_lyric

      sound = ISay.fetch_sound(lyric, config)
      Open3.capture3("/usr/local/bin/play -", :stdin_data => sound)
    end
  end
end
