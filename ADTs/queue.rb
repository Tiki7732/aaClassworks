class Queue

    private 
    attr_reader :que_arr
    public

    def initialize
        @que_arr = []
    end

    def enqueue(el)
        que_arr.unshift(el)
        el
    end

    def dequeue
        que_arr.pop
    end

    def peek
        que_arr.last
    end
end

quimb = Queue.new
quimb.enqueue("Banana")
quimb.enqueue("claire")
quimb.enqueue("dog")
p quimb
quimb.dequeue
p quimb
p quimb.peek