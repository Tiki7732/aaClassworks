class Stack
    private
    attr_reader :stack_arr
    public
    def initialize
        @stack_arr = []
    end

    def push(el)
        stack_arr.push(el)
    end

    def pop
        stack_arr.pop
    end

    def peek
        stack_arr.last
    end
end

# sam = Stack.new
# sam.push("cat")
# sam.push("dog")
# sam.push("house")
# p sam
# sam.pop
# p sam
# p sam.peek