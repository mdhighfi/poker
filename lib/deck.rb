require_relative "card"

class Deck

  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = [:hearts, :clubs, :diamonds, :spades]

  attr_reader :stack
  def initialize
    @stack = populate
  end

  def populate
    stack = []
    VALUES.each do |value|
      SUITS.each do |suit|
        stack << Card.new(value, suit)
      end
    end
    stack
  end

  def shuffle!
    @stack.shuffle!
  end

  def give_card
    @stack.shift
  end

end
