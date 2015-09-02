require "rspec"
require "deck"

describe Deck do

  subject(:deck) {Deck.new}

  describe "#initialize" do
    context "when creating a new deck" do
        it "should have a length of 52" do
          expect(deck.stack.length).to eq(52)
        end
    end
  end

  describe "#shuffle!" do
    context "when shuffling" do

      it "is now shuffled, and should have a different order" do
        original_stack = deck.stack.dup
        deck.shuffle!
        expect(deck.stack).not_to eq(original_stack)
      end

    end
  end

  describe "#give_card" do
    context "when giving a card to a player" do
      it "should pick a random card in its stack" do
        expect(deck.give_card).to be_instance_of(Card)
      end

      before do
        deck.give_card
      end
      it "should have a smaller stack after giving the card" do
        expect(deck.stack.length).to eq(51)
      end
    end
  end
end
