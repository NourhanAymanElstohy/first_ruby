class Complex_calc
    attr_accessor :real, :img
    @@countAdd = @@countMul = @@countBulkAdd = @@countBulkMul = 0
    def initialize(r,i)
        @real = r
        @img = i
    end

    def +(com)
        r = @real + com.real
        i = @img + com.img
        @@countAdd +=1
        "#{r}+#{i}i" 
    end

    def *(com)
        r = (@real * com.real - @img * com.img)
        i = (@real * com.img + @img * com.real)
        @@countMul +=1
        "#{r}+#{i}i"
    end

    def self.bulkaAdd(coms)
        com = Complex_calc.new(0,0)
        coms.each do |elem| 
            com.real += elem.real
            com.img += elem.img
        end
        @@countBulkAdd +=1
        "#{com.real}+#{com.img}i"
    end

    def self.bulkMulti(com_arr)
        com_mul = Complex_calc.new(1,1)
        com_arr.each{ |com| 
            com_mul.real = com_mul.real * com.real - com_mul.img * com.img
            com_mul.img = com_mul.real * com.img + com_mul.img * com.real
        }
        @@countBulkMul +=1
        "#{com_mul.real}+#{com_mul.img}i"
    end

    def self.get_stats
        "adding: #{@@countAdd} Multiplying: #{@@countMul} BulkAdd: #{@@countBulkAdd} BulkMultiply: #{@@countBulkMul}"
    end
end

c1 = Complex_calc.new(3,2)
c2 = Complex_calc.new(1,7)
c3 = Complex_calc.new(1,1)

puts c1+c2
puts c1*c2
puts c2+c3
puts Complex_calc::bulkaAdd([c1,c2])
puts Complex_calc::bulkMulti([c1,c2])
puts Complex_calc::get_stats