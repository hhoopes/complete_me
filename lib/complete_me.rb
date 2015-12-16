require 'pry'
require_relative 'trie'
require_relative 'node'


class CompleteMe
  attr_accessor :wordcount
  attr_reader :trie

  def initialize
    @root = Node.new
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

    prefix.each do |char|
      node = node[char]
    end

    move_along(node)
  end

    def move_along(node)
    suggestions = []
    suggestions = node.children.each do | key |
      if node.children.nil?
        return node
      elsif node

      move_along(node)

    end


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
