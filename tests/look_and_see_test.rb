require "test_helper"
require_relative "../lib/look_and_see.rb"

class LookAndSeeTest < Minitest::Test

  # tests the look_and_see method with only one number as input
  def test_single_number_start
    result = look_and_see(3)
    assert_equal("13",result)
  end

  # tests the look_and_see method with a two diferent digits
  def test_two_different_number_start
    result = look_and_see(23)
    assert_equal("1213",result)
  end

  # tests the look_and_see method with two same digits
  def test_two_the_same_numbers
    result = look_and_see(44)
    assert_equal("24",result)
  end

  # tests the look_and_see method with a long integer and multiple occurances
  def test_long_string_with_multiple_occurances
    result = look_and_see(1134555)
    assert_equal("21131435",result)
  end

  # tests count_consecutive_occurances method with only one digit
  def test_counter_of_consecutive_occurances_only_one
    result = count_consecutive_occurances(["3"],0)
    assert_equal(1,result)
  end

  # tests count_consecutive_occurances method with two same digits
  def test_counter_of_consecutive_occurances_two
    result = count_consecutive_occurances(["4","4"],0)
    assert_equal(2,result)
  end

  # test count_consecutive_occurances method with long integer and longer
  # => consecutive occurance
  def test_counter_of_consecutive_occurances_three_at_end
    result = count_consecutive_occurances(["5","2","2","2"],1)
    assert_equal(3,result)
  end

  # test push_new_numbers method with two occurances at begining
  def test_push_new_numbers_at_begining
    result = push_new_numbers([],["4","4","5"], 0, 2)
    assert_equal(["2","4"],result)
  end

  # test loop_each_number method with only one digit input
  def test_loop_each_number_with_only_one_number
    result = loop_each_number(["3"])
    assert_equal(["1","3"],result)
  end

  # test loop_each_number method with two same digits input
  def test_loop_each_number_with_two_same_numbers
    result = loop_each_number(["4","4"])
    assert_equal(["2","4"],result)
  end

  # test 5 rounds_of_look_and_see with only only one digit input
  def test_execute_ten_rounds_with_one_number
    result = rounds_of_look_and_see(5,3)
    assert_equal("1113122113",result)
  end

end
