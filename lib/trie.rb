require_relative 'complete_me'
require_relative 'node'

class Trie
  attr_reader :root
  
  def initialize
    @root = Node.new
  end

  def search(node, prefix, suggestions)
    node.children.each_key do |key|
      suggestion = prefix
      suggestion += key
      if node.children[key].isword
        suggestions << suggestion
      end
      if node.children
        search(node.children[key], suggestion, suggestions)
      end
    end
  end
end
