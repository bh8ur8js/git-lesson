class Thermometer  
    def initialize(scale, temp)
        @scale = scale
        @temp = temp
    end

    def scale
        @scale
    end

    def temp
        @temp
    end

    def temp=(temp)
        @temp = temp
    end
  
    def scale=(scale)
        case scale
        when @scale then 
            puts 'No Change'
        when 'K' then 
            @scale = scale
            puts 'Set To Kelvin'
        when 'C' then 
            @scale = scale
            puts 'Set To Kelvin'
        when 'F' then 
            @scale = scale
            puts 'Set To Kelvin'
        else
            puts "That's not a Scale I know"
        end
        
    end

    def current_temperature
        return "The current temperature is #{@temp} degrees #{@scale}"
    end

end