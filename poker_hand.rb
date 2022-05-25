class PokerHand < Player
  attr_accessor :diamonds, :hearts, :spades, :clubs, :counts, :suits

  def init
    @pairs = []
    @set = []
    @quads = []
    super
  end

  def dealt_card(card)
    super
    evaluate_hand
  end

  def evaluate_hand
    count_suits
    count_values
  end

  def count_suits
    @diamonds = 0
    @hearts = 0
    @clubs = 0
    @spades = 0
    @cards.each do |card|
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

    def count_values
      @counts = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
      @cards.each do |card|
        @counts[card[:value] - 2] = @counts[card[:value] - 2] + 1
      end
    end

  


    def score
      @pairs = @counts.map.with_index { |v, i| { value: i } if v == 2 }.compact
      @set = @counts.map.with_index { |v, i| { value: i } if v == 3 }.compact
      @quads = @counts.map.with_index { |v, i| { value: i } if v == 4 }.compact
      @suits = [@diamonds, @hearts, @spades, @clubs]

      @score = if @suits.max == 5 && straight?
                 ('9.' + @ordered_values).to_f
               elsif !@quads.empty?
                 ('8.' + @ordered_values).to_f
               elsif @pairs.count == 1 && @set.count == 1
                 ('7.' + @ordered_values).to_f
               elsif @suits.max == 5
                 ('6.' + @ordered_values).to_f
               elsif straight?
                 ('5.' + @ordered_values).to_f
               elsif @set.size > 0
                 ('4.' + @ordered_values).to_f
               elsif @pairs.size == 2
                 ('3.' + @ordered_values).to_f
               elsif @pairs.size == 1
                 ('2.' + @ordered_values).to_f
               else
                 ('1.' + @ordered_values).to_f
               end
    end
  end

  def ordered_values=
     list_of_pairs = @counts.map.with_index { |v, i| {type: v, value: i+2 } if v > 0 }.compact
      sorted =list_of_pairs.sort_by {|h| h[:type]}.reverse
      @ordered_values = sorted.map {|h| ("0"+h[:value].to_s).chars.last(2).join*h[:type] }.join
  end
  
  def straight_value
    result = -1
    if counts.max==1 
      result = 5 if (counts[12]+counts[0,4].sum)==5
      unless result
      for index in 0..8 do
        result = index+6 if (counts[index,5].sum==5)
        return result if result.positive?
      end 
    end
    end
    return result
  end

  def straight?
    straight_value.positive?
  end
end
