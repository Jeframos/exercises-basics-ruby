require 'minitest/autorun'
require 'list_with_commas'


class TestListWithCommas < Minitest::Test

    def setup
        @list = ListWithCommas.new
    end

    def test_it_joins_two_words_with_and
        @list.items = ['pear','apple']
        assert_equal('pear and apple', @list.join)
    end

    def test_it_joins_three_words_with_commas
        @list.items = ['pear', 'orange','apple']
        assert_equal('pear, orange, and apple', @list.join)
    end

    def test_it_prints_one_word_alone
        @list.items = ['apple']
        assert_equal('apple', @list.join)
    end
end