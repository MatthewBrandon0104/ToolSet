module Enumerable
    
  def my_each
    new = []
    i = 0
    while i < self.length
        new << yield(self[i])
        i += 1
    end
  p new
  end


end

array = [1,2,3,4,5]
changed = array.my_each { |item| "#{item}" + "x"}
puts array
puts changed
