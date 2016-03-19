require 'pry'


# Runs one round of Look and See
#
# +num: an integer representing the initial input of a round in the game
#
# Returns a string representing the result of the round of Look and See
def look_and_see(num)
  numbers = num.to_s.split("")
  result = loop_each_number(numbers)
  result.join
end

# Runs a loop through each number calling the methods to produce the result for
# each character
#
# +numbers: an array holding the string representation of each number given as the
# =>        rounds input
#
# Returns an array holding the string representations of each number of the
# result of the round
def loop_each_number(numbers)
  index = 0
  new_numbers = []
  while index <= numbers.length - 1
    counter = count_consecutive_occurances(numbers, index)
    push_new_numbers(new_numbers, numbers, index, counter)
    index += counter
  end
  new_numbers
end

# Counts how many instances of a given number occur in a row
#
# +numbers: an array of strings representing each character of the initial
# =>        input of the round
# +index: an integer representing the index of the array 'numbers' in which we
# =>      are counting
#
# Returns the number times a number consecutively occurs
def count_consecutive_occurances(numbers, index)
  index_move = 1
  next_number = numbers[index + index_move]
  counter = 1
  while numbers[index] == next_number
    index_move += 1
    counter += 1
    next_number = numbers[index + index_move]
  end
  counter
end

# Pushes how many times a number consecutively occurs and what the number is
# => into an array holding the result of the round
#
# +new_numbers: an array representing the result of the round built thus far
# +numbers: an array of strings representing each character of the initial
# =>        input of the round
# +index: an integer representing the index of the array 'numbers' in which we
# =>      are counting
# +counter: an integer represting how many consecutive occurances there are of
# =>        a given number which in the array 'numbers'
#
# Returns an array holding the string representation of the result built thus far
def push_new_numbers(new_numbers, numbers, index, counter)
  new_numbers << counter.to_s
  new_numbers << numbers[index]
end

# Runs a given amount of rounds of Look and See and puts the result of each rounds
#
# +rounds: an integer representing how many rounds of the game to Runs
# +num: an integer representing the intital input of the game
#
# Returns a string representing the result of the given amount of rounds
def rounds_of_look_and_see(rounds, num)
  input = num
  (1..rounds).each do |round|
    input = look_and_see(input)
    puts input
  end
  input
end

rounds_of_look_and_see(10,3)
