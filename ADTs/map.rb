class Map

    private
    attr_reader :map_arr
    public
    def initialize
        @map_arr = []
    end

    def set(key, value)
        pair = [key, value]
        selected = nil
        map_arr.each do |pairs|
            if pairs.first == key
                selected = pairs
                pairs[-1] = value
            end
        end
        map_arr.push(pair) if selected.nil?
    end

    def get(key)
        map_arr.each {|pairs| return pairs.last if pairs.first == key}
        nil
    end

    def delete(key)
        map_arr.reject!{|pair| pair if pair.first == key}
    end

    def show
        print map_arr
        print "\n"
    end

end

m = Map.new
m.set("blah", 5)
m.set("wow", 8)
p m
m.set("blah", 2)
p m
p m.get("blah")
m.set("garg", 10)
m.delete("blah")
p m
m.show