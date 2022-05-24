class Game
    attr_accessor :players, :button, :hands, :blind

    def initialize(players)
        @players = players
        @button = 0
        @hands = []
        @blind = 5
    end
end