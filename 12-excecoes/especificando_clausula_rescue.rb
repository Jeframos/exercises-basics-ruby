class PorridgeError < StandardError
end
class BeddingError < StandardError
end

class TestRescue
    def eat
        raise PorridgeError, "too hot"
    end
    def sleep
        raise BeddingError, "too soft"
    end
end

test = TestRescue.new
begin
    test.sleep
rescue PorridgeError => error 
    puts "This porridge is #{error.message}"
rescue BeddingError => error
    puts "This bed is #{error.message}"
end