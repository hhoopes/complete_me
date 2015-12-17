require 'pry'
require 'minitest'
require_relative 'test_helper'
require_relative '../lib/complete_me'
require_relative '../lib/node'

class CompleteMeTest <Minitest::Test
  attr_reader :complete

  def setup
    @complete = CompleteMe.new
  end

  def test_completeme_starts_with_an_empty_hash_at_its_root
    binding.pry
    assert_instance_of Hash, @root.children
  end

  def test_inserting_single_word_generates_a_listing_in_the_trie
    complete.insert("difficult")
    assert_equal 1, complete.count
  end

  def test_populate_dictionary_uses_default_dictionary_if_no_list_provided
    complete.populate
    assert_equal 235886, complete.count

  end

  def test_populate_dictionary_loads_both_a_file_and_word_list
    list = complete.populate("siesta\nslumber\ncatnap")
    file = complete.populate('sleep.txt')
    assert_equal list.count, file.count
  end

  def test_suggest_returns_nested_suggestions
    complete.populate("pizza\npizzeria\npizzicato\npizzazz\napple")
    assert_equal ["pizza", "pizzazz", "pizzeria", "pizzicato"], complete.suggest("piz")
  end

  def test_suggest_returns_many_suggestions_but_not_incomplete_matches
    complete.populate("hooped\nho\nhooping\nhoopla\nhoople\n hoopless\nhoopoe\nhoopstick\nhoopwood\nahoope\nhoopesheidi\nhoo")
    assert_equal ["hooped", "hoopesheidi", "hooping", "hoopla", "hoople", "hoopoe", "hoopstick", "hoopwood"], complete.suggest("hoop")

  end
end
