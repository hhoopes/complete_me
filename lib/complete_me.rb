require 'pry'
require_relative 'node'
require_relative 'trie'


class CompleteMe
  attr_accessor :wordcount, :root
  attr_reader

  def initialize
    @trie = Trie.new
    @wordcount = 0
  end

  def populate(list = "words.txt")
    if File.file?(list)
      list = File.read(list)
    end
    list.split("\n").each do | word |
      insert(word)
    end
  end

  def insert(string)
    node = @trie.root
    string.chars.each do | char |
      node.children[char] ||= Node.new
      node = node.children[char]
    end
    node.isword = true
    @wordcount += 1
  end

  def suggest(prefix)
    node = @trie.root
    prefix.chars.each do |char|
      node = node.children[char]
    end
    suggestions =[]
    if node.isword
      suggestions << prefix
    end
    @trie.search(node, prefix, suggestions)
    suggestions
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
