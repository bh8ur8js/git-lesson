class Deck
    attr_accessor :cards, :next_card_index

    def initialize
        @suits = ['S', 'H', 'C', 'D']
        @values = [2,3,4,5,6,7,8,9,10,11,12,13,14]
        @cards = []
        @suits.each do |suit|
            @values.each do |value|
                @cards << {suit: suit, value: value}
            end
        end
        @next_card_index = 51
        @cards.shuffle!
    end

    def deal_card
        @next_card_index=@next_card_index-1
        return @cards[@next_card_index+1]
    end

    def next_card
        return @cards[@next_card_index]
    end
    
    def burn_card
        @next_card_index=@next_card_index-1
        puts 'Burn Card'
    end

    def how_many_cards_remaining
        @next_card_index+1
    end
    
    def reshuffle
        initialize
    end

end