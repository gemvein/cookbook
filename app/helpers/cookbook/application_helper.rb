# frozen_string_literal: true

module Cookbook
  # Application Helper
  module ApplicationHelper
    def cookbook_uses_of(usable)
      render 'cookbook/uses_of', uses: usable.uses
    end

    def cookbook_used_in(using)
      usables = using.class.used_in.map do |usable_table_sym|
        plural = usable_table_sym.to_s
        singular = plural.singularize
        uses = using.send("#{singular}_uses".to_sym)
        usable_model = plural.classify.constantize
        title = usable_model.model_name.human.pluralize
        OpenStruct.new(title: title, uses: uses, plural_class: plural, singular_class: singular)
      end

      render 'cookbook/used_in', usables: usables
    end
  end
end
