puts "To-level #self"
puts "#{self}"

class C
  puts "C class #self"
  puts "#{self}"

  def self.m 
    puts "C::m #self"
    puts "#{self}"
  end

  def r
    puts "C#r #self"
    puts "#{self}"
  end
end

C::m
c =C.new
c.r