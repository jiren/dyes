module Dyes
  module Document

    def self.included(base)
      base.extend ClassMethods
      base.send :include, InstanceMethods
    end

    module ClassMethods
      attr_accessor :dyes_opts

      def dyes(opts = {})
        self.dyes_opts = opts
      end

      def dyes_doc_type
        @dyes_doc_type ||= self.name.downcase
      end
    end

    module InstanceMethods

      def dyes_index
        self.send(self.class.dyes_opts[:index])
      end

      def dyes_save(data)
        Dyes.client.index(index: dyes_index, type: self.class.dyes_doc_type , id: id,  body: data)
      end

      def dyes_destroy(opts = {})
        Dyes.client.delete({ index: dyes_index, type: self.class.dyes_doc_type, id: id }.merge(opts))
      end

      def es_json
        self.to_json
      end

    end
  end
end
