require '/Users/deep/git-lesson/therm.rb'
class FarenheitThermometer < Thermometer
    def initialize(temp)
        @scale = 'F'
        @temp = temp
    end

    def temperature_in_celsius
        return "The temperature is #{(@temp.to_f-32)*5/9} C"
    end

end