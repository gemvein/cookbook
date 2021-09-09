FactoryBot.define do
  factory :use do
    use_in { pick_from_models(%w[Recipe HowTo]) }
    use_of { pick_from_models(%w[Ingredient Supply Tool]) }
    quantity_minimum { 1.5 }
    quantity_maximum { 3 }
    unit { ['cups', nil, 'grams', 'pinches'].sample }
    sort { 1 }
    note { ['for', %w[health fun wisdom].sample].join(' ') }
    preparation { ['crushed', nil, 'boiled', 'greased'].sample }
  end
end

def pick_from_models(model_names)
  model_name = model_names.sample
  pick_item_from(model_name)
end

def pick_item_from(model_name)
  model = model_name.constantize
  model.find(model.ids.sample)
end