require 'pry'
require 'minitest'
require_relative 'test_helper'
require_relative '../lib/complete_me'

class CompleteMeTest <Minitest::Test
  attr_reader :complete

  def setup
    @complete = CompleteMe.new
  end

  def test_inserting_single_word_generates_a_listing_in_the_trie
    complete.insert("difficult")
    assert_equal 1, complete.count
  end

  def test_inserting_duplicate_word_doesnt_create_extra_word
    complete.insert("jinx")
    complete.insert("jinx")
    assert_equal 1, complete.count
  end

  def test_populate_dictionary_uses_default_dictionary_if_no_list_provided
    complete.populate
    assert_equal 235886, complete.count
  end

  def test_populate_dictionary_loads_both_a_file_and_word_list
    list = complete.populate("siesta\nslumber\ncatnap")
    complete2 = CompleteMe.new
    complete2.populate('./sleep.txt')
    assert_equal list.count, complete2.count
  end

  def test_suggest_returns_nested_suggestions
    complete.populate("pizza\npizzeria\npizzicato\npizzazz\napple")
    assert_equal ["pizza", "pizzazz", "pizzeria", "pizzicato"], complete.suggest("piz")
  end

  def test_suggest_returns_many_suggestions_but_not_incomplete_matches
    complete.populate("hooped\nho\nhooping\nhoopla\nhoople\n hoopless\nhoopoe\nhoopstick\nhoopwood\nahoope\nhoopesheidi\nhoo")
    assert_equal ["hooped", "hoopesheidi", "hooping", "hoopla", "hoople", "hoopoe", "hoopstick", "hoopwood"], complete.suggest("hoop")
  end

  def test_select_weights_a_single_suggestion_for_chosen_word
    complete.populate("pizza\npizzeria\npizzicato\npizzazz\napple")
    complete.select("piz", "pizzazz")
    assert_equal ["pizzazz", "pizza", "pizzeria", "pizzicato"], complete.suggest("piz")
  end

  def test_selecting_multiple_words_for_a_single_prefix_returns_all_words_weighted
    complete.populate("pizza\npizzeria\npizzicato\npizzazz")
    complete.select("piz", "pizzazz")
    complete.select("piz", "pizzazz")
    complete.select("piz", "pizzicato")
    assert_equal ["pizzazz", "piccicato", "pizza", "pizzeria"], complete.suggest("piz")
  end
end
