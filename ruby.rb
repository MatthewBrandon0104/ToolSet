module Enumerable
    
    def my_each
        new = []
        i = 0
        while i < self.length
            new << yield(self[i])
            i += 1
        end
    end
    
    def my_each_with_index
        new = []
        i = 0
        while i < self.length
            new << yield(self[i], i)
            i += 1
        end
    end


end

array = [1,2,3,4,5]

array.my_each_with_index { |value, index| puts "index: #{index} of #{value}"}
array.my_each { |value| puts "#{value}x"}
