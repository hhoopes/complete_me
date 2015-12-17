require_relative 'complete_me'
require_relative 'node'

class Trie
  attr_reader :root
  attr_accessor :weighted

  def initialize
    @root = Node.new
    @weighted = Hash.new
  end

  def find_node(prefix)
    node = root
    prefix.chars.each do |char|
      node = node.children[char]
    end
    return node
  end

  def search(node, prefix, suggestions)
    node.children.each_key do |key|
      suggestion = String.new(prefix)
      suggestion += key
      if node.children[key].isword
        suggestions << suggestion
      end
      if node.children
        search(node.children[key], suggestion, suggestions)
      end
    end
  end

  # def weight(prefix)
  #   if weighted.has_value?("prefix")
  #     return weighted("prefix")
  #   else return false
  #   end
  # end
end
