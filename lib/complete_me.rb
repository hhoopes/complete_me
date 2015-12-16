require 'pry'
require_relative 'trie'
require_relative 'node'


class CompleteMe
  attr_accessor :wordcount
  attr_reader :trie

  def initialize
    @trie = Trie.new
    @wordcount = 0
  end

  def populate(list = "/usr/share/dict/words")
    if File.file?(list)
      list = File.read(list)
    end
    list.split("\n").each do | word |
      insert(word)
    end
  end

  def insert(string)
    current = @trie.root
    string.chars.each do | char |
      current.children[char] ||= Node.new
      current = current.children[char]
    end
    current.isword = true
    @wordcount += 1
  end

  def suggest(prefix)
    current = @trie.root
    prefix.chars.map do | char |
      
  end

  def select(prefix, word)
  end

  def count
    @wordcount
  end


end
complete =CompleteMe.new
complete.insert("dog")
complete.populate
