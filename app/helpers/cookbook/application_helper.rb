# frozen_string_literal: true

module Cookbook
  # Application Helper
  module ApplicationHelper
    def cookbook_uses_of(usable)
      render 'cookbook/uses_of', uses: usable.uses
    end

    def cookbook_used_in(using)
      render 'cookbook/used_in', usables: build_usables(using)
    end

    def cookbook_fields(form)
      render 'cookbook/fields', form: form, usables: build_usables(form.object)
    end



    private

    def build_usables(object)
      object.class.used_in.map do |usable_table_sym|
        build_usable(object, usable_table_sym)
      end
    end

    def build_usable(object, usable_table_sym)
      plural = usable_table_sym.to_s
      singular = plural.singularize
      uses_sym = "#{singular}_uses".to_sym
      usable_model = plural.classify.constantize
      singular_title = usable_model.model_name.human
      OpenStruct.new(
        title: singular_title.pluralize, singular_title: singular_title, uses: object.send(uses_sym),
        uses_sym: uses_sym, plural_class: plural, singular_class: singular, table_sym: usable_table_sym
      )
    end
  end
end
