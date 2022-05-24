class Hand

    attr_accessor :deck, :players, :status 

   def initialize(players, deck)
    @deck = deck
    @players = players
    @status = players.map {|c| 'playing'}
    @pot = 0
    @current_round = 0
    @current_player = 2
    @players.map {|p| p.dealt_card(deck.deal_card)}
    @players.map {|p| p.dealt_card(deck.deal_card)}
   end
   
   def display_all_hands
    @players.each do |player|
        puts "#{player.name} has a #{player.cards[0][:value]}#{player.cards[0][:suit]} and a #{player.cards[1][:value]}#{player.cards[1][:suit]}"
    end
    return nil
   end
end