# frozen_string_literal: true

# Pick a random number and start receiving input
class NumberGuess
  def initialize
    @secret_number = sort

    puts 'Try to find the number between 0 and 100!'
    guess
  end

  def sort
    Random.rand 101
  end

  def guess
    loop do
      guess = gets.chomp

      break if parse?(guess)
    end
  end

  def convert(number)
    converted_number = Integer(number)
    yield converted_number
  rescue ArgumentError
    puts 'Use only numbers'
  end

  def parse?(number)
    convert(number) do |n|
      case
      when n == @secret_number
        puts 'You Won!'
        return true
      when n > @secret_number
        puts 'The number is smaller'
        return false
      when n < @secret_number
        puts 'The number is bigger'
        return false
      end
    end
  end

  false
end

NumberGuess.new if __FILE__ == $PROGRAM_NAME
