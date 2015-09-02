class Hand
  def initialize(deck)
    @deck = deck
    @player_cards = []

    5.times {@player_cards << @deck.give_card}
  end





end
