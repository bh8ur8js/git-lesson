require '/Users/deep/git-lesson/therm.rb'
class KelvinThermometer < Thermometer
    def initialize(temp)
        @scale = 'K'
        @temp = temp
        this_method_can_only_be_accessed_inside_the_class
    end

    def temperature_in_celsius 
        return "The temperature is #{(@temp.to_f-273.15).round(3)} C"
        
    end

    private

    def this_method_can_only_be_accessed_inside_the_class
        puts "i worked"
    end

end