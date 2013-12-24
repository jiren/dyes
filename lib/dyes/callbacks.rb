module Dyes
  module Model
    module Callbacks

      def self.included(base)
        if base.respond_to?(:after_save) && base.respond_to?(:after_destroy)
          base.send :after_save,    -> {  dyes_save(self.es_json)  }
          base.send :after_destroy, -> {  dyes_destroy }
        end
      end

    end
  end
end
