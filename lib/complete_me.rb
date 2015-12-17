require 'pry'
require_relative 'node'
require_relative 'trie'

class CompleteMe
  attr_accessor :wordcount, :root
  attr_reader :trie

  def initialize
    @trie = Trie.new
    @wordcount = 0
  end

  def populate(list = "./words.txt")
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
      prev_node = node
      node = node.children[char]
    end
    node.isword = true
    @wordcount += 1 unless prev_node = node
  end

  def suggest(prefix)
    node = trie.find_node(prefix)
    suggestions =[]
    if trie.weighted[prefix] != nil
      suggestions << trie.weighted[prefix]
    end
    if node.isword == true
      suggestions << prefix
    end
    trie.search(node, prefix, suggestions)
    suggestions.uniq
  end

  def select(prefix, word)
    trie.weighted[prefix] = word
  end

  def count
    @wordcount
  end
end
