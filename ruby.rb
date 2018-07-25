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
    
    def my_select
        new = []
        self.my_each do |value|
            if yield(value) == true
                new << value
            end
        end
        p new
    end

    def my_all?
        self.my_each do |value|
            if yield(value) == false
                return false
            end
        end
        return true
    end
    
    def my_any?
        self.my_each do |value|
            if yield(value) == true
                return true
            end
        end
        return false
    end
    
    def my_none?
        self.my_each do |value|
            if yield(value) == true
            return false
            end
        end
        return true
    end

end

array = [1,2,3,4,5]

array.my_each_with_index { |value, index| puts "index: #{index} of #{value}"}
array.my_each { |value| puts "#{value}x"}
array.my_select {|item| item > 2}
p array.my_all? {|item| item > 0}
p array.my_any? {|item| item > 2}
p array.my_none? {|item| item > 4}
