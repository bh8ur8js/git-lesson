# frozen_string_literal: true

# PokerHand Inherits from Player

class PokerHand < Player
  attr_accessor :diamonds, :hearts, :spades, :clubs, :counts, :suits

  def init
    @pairs = []
    @set = []
    @quads = []
    super
  end

  def sets
    @counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @diamonds = 0
    @hearts = 0
    @clubs = 0
    @spades = 0

    @cards.each do |card|
      @counts[card[:value] - 2] = @counts[card[:value] - 2] + 1
      case card[:suit]
      when 'H'
        @hearts += 1
      when 'S'
        @spades += 1
      when 'C'
        @clubs += 1
      when 'D'
        @diamonds += 1
      end
    end
    @suits = [@diamonds, @hearts, @spades, @clubs]
    @pairs = counts.map.with_index { |v, i| { value: i } if v == 2 }.compact.reverse
    @set = counts.map.with_index { |v, i| { value: i } if v == 3 }.compact
    @quads = counts.map.with_index { |v, i| { value: i } if v == 4 }.compact

    return "You have a #{@cards.map { |h| h[:value] }.max} high flush." if @suits.max == 5

    if !@quads.empty?
      "quads (3) #{@quads[0][:value] + 2}"
    elsif @pairs.count == 1 && @set.count == 1
      "full house #{@set[0][:value] + 2}'s full of #{@pairs[0][:value] + 2}'s"
    elsif @set.size > 0
      "Set of #{@set[0][:value] + 2}'s"
    elsif @pairs.size > 0
      "Pair of #{@pairs[0][:value] + 2}'s #{"and a pair of #{@pairs[1][:value] + 2}" if @pairs.size == 2}"
    else
      "high card #{@cards.map { |h| h[:value] }.max + 2}"
    end
  end
end
