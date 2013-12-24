module Dyes
  module Index

    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_accessor :dyes_opts

      def dyes(opts = {})
        self.dyes_opts = opts
      end

      def dyes_index_prefix
        @dyes_prefix ||= self.name.downcase
      end

      def dyes_index(id)
        "#{self.class.dyes_index_prefix}_#{id}"
      end

    end

    module InstanceMethods

      def dyes_mapping
        {}
      end

      def dyes_index
        "#{self.class.dyes_index_prefix}_#{self.id}"
      end

      def dyes_create_index
        Dyes.client.indices.create(index: dyes_index, body: dyes_mapping)
      end

      def dyes_delete_index
        Dyes.client.indices.delete(index: dyes_index)
      end

      def dyes_update_index
      end

      def search(query)
        Dyes.client.search(index: dyes_index, body: query)
      end

    end
  end
end
