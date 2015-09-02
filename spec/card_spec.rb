require "rspec"
require "card"

describe Card do

  subject(:card) {Card.new(value, suit)}
  subject(:suit) {:spades}
  subject(:value) {"A"}
  #:spades, :clubs, :diamonds, :hearts

  describe "#initialize" do
    context "when passed no arguments" do
        it "should raise an error when no arguments are passed" do
          expect{Card.new}.to raise_error
        end
    end

    context "when passed a value and a suit" do
      it "creates a card of that particular value and suit" do
        expect(card.suit).to be (suit)
        expect(card.value).to be (value)
      end
    end

  end
end
