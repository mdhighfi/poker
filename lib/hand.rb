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


  def compare_with(opponent_hand)
    if self.royal_flush? || opponent_hand.royal_flush?
      if self.royal_flush? && opponent_hand.royal_flush?
        return :tie
      else
        self.royal_flush? ? return :player : return :opponent
      end
    elsif self.straight_flush? || opponent_hand.straight_flush?
      if self.straight_flush? && opponent_hand.straight_flush?
        return :tie
      else
        self.straight_flush? ? return :player : return :opponent
      end
    elsif self.four_of_a_kind? || opponent_hand.four_of_a_kind?
      if self.four_of_a_kind? && opponent_hand.four_of_a_kind?
        return :tie
      else
        self.four_of_a_kind? ? return :player : return :opponent
      end
    elsif self.full_house? || opponent_hand.full_house?
      if self.full_house? && opponent_hand.full_house?
        return :tie
      else
        self.full_house? ? return :player : return :opponent
      end
    elsif self.flush? || opponent_hand.flush?
      if self.flush? && opponent_hand.flush?
        return :tie
      else
        self.flush? ? return :player : return :opponent
      end
    elsif self.straight? || opponent_hand.straight?
      if self.straight? && opponent_hand.straight?
        return :tie
      else
        self.straight? ? return :player : return :opponent
      end
    elsif self.three_of_a_kind? || opponent_hand.three_of_a_kind?
      if self.three_of_a_kind? && opponent_hand.three_of_a_kind?
        return :tie
      else
        self.three_of_a_kind? ? return :player : return :opponent
      end
    elsif self.two_pair? || opponent_hand.two_pair?
      if self.two_pair? && opponent_hand.two_pair?
        return :tie
      else
        self.two_pair? ? return :player : return :opponent
      end
    elsif self.pair? || opponent_hand.pair?
      if self.pair? && opponent_hand.pair?
        return :tie
      else
        self.pair? ? return :player : return :opponent
      end
    else #High Card
      

  end



  def four_of_a_kind?
    card_values.select{|card| card_values.count(card)==4}.any?
  end

  def three_of_a_kind?
    card_values.select{|card| card_values.count(card)==3}.any?
  end

  def full_house?
    three_of_a_kind? && pair?
  end

  def pair?
    card_values.select{|card| card_values.count(card)==2}.count == 2
  end

  def two_pair?
    card_values.select{|card| card_values.count(card)==2}.count == 4
  end

  def royal_flush?
    flush? && royal_straight?
  end

  def flush?
    card_suit = @player_cards.first.suit
    @player_cards.all?{ |card| card.suit == card_suit}
  end

  def royal_straight?
    straight? && card_values.include?("A")
  end

  def straight_flush?
    straight? && flush?
  end

  def straight?
    (VALUES.length-5).times do |val|
      return true if VALUES[val..val+5].all? {|el| card_values.include?(el)}
    end
    false
  end

  def card_values
     @player_cards.map { |card| card.value }
  end



  # def straight

end
