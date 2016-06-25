# ArrayQueueAdapter partly implements Queue based on input array
# does not modify underlying array to avoid memory re-allocation
# implements:
# * Array#shift - wraps returning object into ArrayQueueAdapter if it's an Array
# * Array#any?
class ArrayQueueAdapter
  ERR_INIT = 'Array is expected'.freeze
  ERR_RESIZE = 'Invalid usage, array length must not be changed'.freeze
  ERR_EOF = 'Invalid operation, EOF is reached'.freeze

  def initialize(array)
    raise ERR_INIT unless array.is_a? Array
    @array = array
    @index = 0
    @size = array.length
  end

  def shift
    check_resize
    raise ERR_EOF unless any?

    result = @array[@index]
    @index += 1
    result.is_a?(Array) ? ArrayQueueAdapter.new(result) : result
  end

  def any?
    check_resize
    @index < @array.length
  end

  private

  def check_resize
    raise ERR_RESIZE if @size != @array.length
  end
end
