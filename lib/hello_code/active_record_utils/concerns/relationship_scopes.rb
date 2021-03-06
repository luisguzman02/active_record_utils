module HelloCode
  module ActiveRecordUtils
    module Concerns
      module RelationshipScopes
        extend ActiveSupport::Concern

        module ClassMethods
          def relationship_scopes(relationship, suffix = nil)
            suffix ||= relationship

            with_scope_name    = "with_#{ suffix }".to_sym
            include_scope_name = "include_#{ suffix }".to_sym
            and_scope_name     = "and_#{ suffix }".to_sym

            scope with_scope_name,    -> { joins(relationship) }
            scope include_scope_name, -> { preload(relationship) }
            scope and_scope_name,     -> { eager_load(relationship) }

            nil
          end
        end
      end
    end
  end
end
