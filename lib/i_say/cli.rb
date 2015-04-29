require "i_say"
require "thor"

module ISay
  class CLI < Thor
    desc "hoge", "print thor test"
    def hoge
      puts "Hello thor..."
    end
  end
end
