# frozen_string_literal: true

Rails.application.routes.draw do
  resources :uses
  resources :ingredients
  resources :supplies
  resources :recipes
  resources :tools
  resources :how_tos
  devise_for :users

  root 'recipes#index'
end
