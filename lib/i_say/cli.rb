require "i_say"
require "thor"
require 'open3'

module ISay
  class CLI < Thor
    default_command :say

    desc "say", "say word"
    def say(word)
      sound = ISay.fetch_sound(word)

      Open3.capture3("/usr/local/bin/play -", :stdin_data => sound)
    end

    desc "START:DASH!!", "sing START:DASH"
    def sing
      lyric = ISay.get_song_lyric

      sound = ISay.fetch_sound(lyric)
      Open3.capture3("/usr/local/bin/play -", :stdin_data => sound)
    end
  end
end
