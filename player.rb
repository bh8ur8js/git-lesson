class Player
  attr_accessor :name, :chips, :cards

  def initialize(name, chips)
    @name = name
    @chips = chips
    @cards = []
  end

  def dealt_card(card)
    @cards << card
  end

  def show_hand
    cards = ''
    @cards.each do |card|
      cards = "#{cards}#{card[:value]}#{card[:suit]} "
    end
    puts "#{@name} has cards #{cards}"
    cards
  end

  def muck_cards
    @cards = []
  end
end
