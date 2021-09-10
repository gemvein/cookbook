# frozen_string_literal: true

module Cookbook
  # Concern to allow strong parameters when using accepts_nested_attributes_for to edit Cookbook Uses
  module Params
    extend ActiveSupport::Concern

    included do
      # rescue_from Pundit::NotAuthorizedError, with: :authorization_error
      # include Pundit
    end

    def cookbook_params(model_name)
      model = model_name.constantize

      attributes = {}
      model.used_in.each do |table_sym|
        singular = table_sym.to_s.singularize
        attribute_sym = "#{singular}_uses_attributes".to_sym
        attributes[attribute_sym] = %i[
          id _destroy use_of_type use_of_id quantity_minimum quantity_maximum unit preparation note sort
        ]
      end
      attributes
    end
  end
end
