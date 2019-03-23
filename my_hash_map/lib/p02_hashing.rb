class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    new_arr = ""
    self.each do |el|
      new_arr += el.to_s.to_sym.object_id.to_s
    end
    new_arr.to_i
  end
end

class String
  def hash
    a = ["l", "j", "f", "m", "i", "s", "k", "n", "b", "a", "y", "t", "v", "d", "h", "u", "g", "e", "c", "o", "z", "x", "p", "r", "w", "q"]
    new_arr = []
    self.each_char do |char|
      a.each_with_index do |ele, i|
        new_arr << i.hash if ele == char 
      end
    end
    new_arr.join.to_i
  end


end




class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    letters = self.values.sort
    i = letters.hash
    symbols = self.keys.sort
    sym_string = ''

    symbols.each do |sym|
      sym_string += sym.object_id.to_s
    end

    code = i.to_s + sym_string
    code.to_i
  end
end
