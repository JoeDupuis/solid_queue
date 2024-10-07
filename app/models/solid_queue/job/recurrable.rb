# frozen_string_literal: true

module SolidQueue
  class Job
    module Recurrable
      extend ActiveSupport::Concern

      included do
        has_one :recurring_execution, dependent: :destroy
      end

      class_methods do
        def execution_associations
          super.to_a.append(:recurring_execution)
        end
      end
    end
  end
end
