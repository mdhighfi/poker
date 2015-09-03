class Hand
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  attr_reader :player_cards
  def initialize(deck)
    @deck = deck
    @player_cards = []

    5.times {@player_cards << @deck.give_card}
  end

  def return_card(arr_of_cards)
    arr_of_cards.map! do |idx|
      @player_cards[idx]
    end

    arr_of_cards.each do |card|
      @deck.receive_card(card)
      @player_cards.delete(card)
    end
  end

  def receive_card(num_to_receive)
    num_to_receive.times { @player_cards << @deck.give_card}
  end

  def sort_cards

  def find_value
    # @player_cards.sort! { |x,y| x.value <=> y.value }
    three_of_a_kind?
  end

  def royal_flush?
    card_suit = @player_cards.first.suit
    return false unless @player_cards.all? { |card| card.suit == card_suit }
    royal_straight?
  end

  def royal_straight?
    card_values = @player_cards.map { |card| card.value }
    VALUES[-5..-1].each do |value|
      return false unless card_values.include?(value)
    end
    true
  end


  # def straight

end
