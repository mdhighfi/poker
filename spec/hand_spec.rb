require "rspec"
require "hand"

describe Hand do

  subject(:hand) {Hand.new}

  describe "#initialize" do
    context "when creating a new hand" do
        it "should take 5 cards from the deck" do
          expect(hand.player_card.length).to eq(5)
        end
    end
  end

  describe "#return_card" do

    context "the hand should be giving cards back to the deck" do
      before do
        hand.return_card([1])
      end
      it "takes one card from the hand and puts it back into the deck" do
        expect(hand.player_card.length).to eq(4)
      end
    end
  end

  describe "#receive_card" do

    context "the hand should receive a card from the deck" do
      before do
        hand.return_card([1])
        hand.receive_card(1)
      end

    end
  end
end
