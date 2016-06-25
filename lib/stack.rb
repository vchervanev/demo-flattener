# classic Stack (push/pop/any?/empty?)
class Stack
  # data container
  class Element
    attr_reader :data, :prev

    def initialize(data, prev)
      @data = data
      @prev = prev
    end
  end

  def initialize
    @head = nil
  end

  def pop
    raise 'Stack is empty' if @head.nil?

    result = @head.data
    @head = @head.prev

    result
  end

  def push(*data)
    data.each do |item|
      @head = Element.new(item, @head)
    end
  end

  def empty?
    @head.nil?
  end

  def any?
    !empty?
  end
end
