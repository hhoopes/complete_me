require 'pry'
require 'minitest'
require 'test_helper'
require_relative '../lib/complete_me'

class CompleteMeTest <Minitest::Test

  def setup
    attr_reader :complete
    @complete = CompleteMe.new
  end

  def test_completeme_starts_with_an_empty_hash_at_its_root
    assert complete.root.children_instance_of?(Hash)
  end

  def test_inserting_single_word_generates_a_listing_in_the_trie
    complete.insert("difficult")
    assert_equal "1", complete.count
  end

  def test_populate_dictionary_uses_default_dictionary_if_no_list_provided
    complete.populate
    assert_equal 235886, complete.count

  end

  def test_populate_dictionary_uses_both_a_file_and_word_list
    complete.populate("siesta\nslumber\ncatnap")
    complete.populate('sleep.txt')
  end

  def test_

  end

  def test_

  end
end