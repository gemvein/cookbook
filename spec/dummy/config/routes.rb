# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :ingredients
  resources :supplies
  resources :recipes
  resources :tools
  resources :how_tos

  root 'recipes#index'
end
