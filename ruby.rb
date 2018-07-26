module Enumerable
    
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
        self
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
    
    def my_count(arg = "default")
        count = 0
        if arg != "default"
            self.my_each {|value| count += 1 if value == arg}
        elsif block_given? == false
            count = self.length
        else
            self.my_each  {|value| count += 1 if yield(value) == true}
        end
        return count
    end
    
    def my_map(proc=true)
        new = []
        if proc.is_a?(Proc)
            self.my_each do |value|
                new << proc(value)
            end
        else self.my_each do |value|
            new << yield(value)
            end
        end
        return new
    end
    
    def my_inject(result=0)
        self.my_each do |item|
            result = yield(result, item) 
        end
        return result
    end
    
end

array = [1,2,3,4,5]
=begin
array.my_each_with_index { |value, index| puts "index: #{index} of #{value}"}
array.my_each { |value| puts "#{value}x"}
array.my_select {|item| item > 2}
p array.my_all? {|item| item > 0}
p array.my_any? {|item| item > 2}
p array.my_none? {|item| item > 4}
p array.my_count
p array.my_count(3)
p array.my_count {|item| item > 2}
=end
p array.my_map {|item| "#{item}" + "x"}

my_proc = Proc.new {|item| "#{item}" + "z" }
        
p array.my_map(&my_proc)

#p array.my_inject {|sum, number| sum + number}

#def multiply_els(array)
#        array.my_inject(1) {|result, item| result * item}
#    end
#p multiply_els(array)
