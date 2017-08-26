module Servo
  class Context
    def initialize(params = {})
      params.each_pair do |key, value|
        singleton_class.class_eval {attr_accessor key}
        instance_variable_set("@#{key}", value)
      end
    end

    def fail!
      @failure = true
      raise Failure
    end

    def failure?
      @failure || false
    end

    def success?
      !failure?
    end

    def define_accessors(accessors)
      return if accessors.nil?

      singleton_class.class_eval {attr_accessor accessors}
    end
  end
end
