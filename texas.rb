load '/Users/deep/git-lesson/game.rb'
load '/Users/deep/git-lesson/hand.rb'
load '/Users/deep/git-lesson/deck.rb'
load '/Users/deep/git-lesson/player.rb'
load '/Users/deep/git-lesson/poker_hand.rb'


players = [PokerHand.new('Tyler',100)]
players << PokerHand.new('Max',100)
players << PokerHand.new('Harvey',100)
players << PokerHand.new('Manny',100)
players << PokerHand.new('James',100)
players << PokerHand.new('Nathan',100)

players.map {|p| p.muck_cards}
d = Deck.new

5.times do 
    players.each do |player|
        player.dealt_card(d.deal_card)
    end
end

players.map {|p| p.show_hand}
players.map {|p| p.sets}

