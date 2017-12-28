# --- Day 4: High-Entropy Passphrases ---

# A new system policy has been put in place that requires all accounts to use a passphrase instead of simply a password. A passphrase consists of a series of words (lowercase letters) separated by spaces.

# To ensure security, a valid passphrase must contain no duplicate words.

# For example:

# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
# The system's full passphrase list is available as your puzzle input. How many passphrases are valid?
#
class PassPhrase
  attr_reader :line

  def initialize(line)
    @line = line
  end

  def valid?
    words.length == words.uniq.length
  end

  def valid_non_anagram?
    sorted_words.length == sorted_words.uniq.length
  end

  private

  def words
    @words ||= line.split(" ")
  end

  def sorted_words
    @sorted_words ||= words.map { |word| word.split("").sort!.join }
  end
end

input = File.read("./lib/day04/input.txt")
lines = input.split("\n")

valid = lines.select { |l| PassPhrase.new(l).valid? }.count
sorted_valid = lines.select { |l| PassPhrase.new(l).valid_non_anagram? }.count

require 'pry'; binding.pry

