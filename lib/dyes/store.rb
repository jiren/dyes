module Dyes
  module Store

    module ClassMethods
      def create(attributes)
        self.new(attributes).save
      end
    end

    module InstanceMethods
      attr_accessor :attributes

      def initialize(attributes = {})
        @attributes = attributes 
      end

      def save
      end

      def destroy
      end

      def id
        self.attributes['id']
      end

    end

  end
end
