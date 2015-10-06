require 'active_record'

module Nelly
  module ActsAsCacheable
    def self.included(base)
      base.class_eval do
        def self.acts_as_cacheable
          extend Nelly::ActsAsCacheable::ClassMethods
        end
      end
    end

    module ClassMethods
      def cache_key
        max_updated_at = maximum(:updated_at).try(:utc).try(:to_s, :number)
        "#{name}-#{count}-#{max_updated_at}"
      end
    end
  end
end

ActiveRecord::Base.send :include, Nelly::ActsAsCacheable
