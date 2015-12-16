require 'pry'
require 'minitest'
require 'test_helper'
require_relative '../lib/trie'


class TrieTest <Minitest::Test

  def setup
    @complete = CompleteMe.new
  end

  def test_completeme_

  end

  def test_initializing_tree_creates_a_root
     assert_equal "c", @tree.root.key
  end

   def test_inserted_2nd_element_is_right_of_first
     @tree.insert("m")
     assert_equal "m", @tree.root.right.key
   end


  def test_

  end

  def test_

  end

  def test_

  end
end
