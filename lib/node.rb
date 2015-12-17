require 'pry'
require_relative 'trie'
require_relative 'complete_me'

class Node  #should define as a struct
  attr_accessor :isword, :children
  def initialize
    @isword = false
    @children = Hash.new
  end
end
