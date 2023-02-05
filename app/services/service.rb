# frozen_string_literal: true

# A parent class used to define Services.
class Service
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
