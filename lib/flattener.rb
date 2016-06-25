require 'stack'
require 'array_queue_adapter'

# call Flattener.perform(input) to flatten an array
class Flattener
  def self.perform(input)
    flatten(init(input))
  end

  def self.init(input)
    raise 'Array is expected' unless input.is_a? Array

    Stack.new.tap { |result| result.push ArrayQueueAdapter.new(input) }
  end

  def self.flatten(buffer)
    [].tap do |output|
      while buffer.any?
        item = buffer.pop
        if item.is_a? ArrayQueueAdapter
          buffer.push(item, item.shift) if item.any?
        else
          output << item
        end
      end
    end
  end

  private_class_method :init, :flatten
end
