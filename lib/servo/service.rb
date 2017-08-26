module Servo
  class Service
    def self.call(params = {})
      context = Servo::Context.new(params)
      context.define_accessors(@context_accessors)

      new(context).call
      context
    rescue Failure
      context
    end

    def initialize(context)
      @context = context
    end

    # TODO: private?
    attr_reader :context

    def call
    end

    def self.context_accessors(accessors)
      @context_accessors = accessors
    end
  end
end
