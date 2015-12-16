require 'pry'
require_relative "trie"

class Node
  attr_accessor :isword, :weight, :children
  def initialize
    @isword = false
    @children = Hash.new
    @weight
  end

end
