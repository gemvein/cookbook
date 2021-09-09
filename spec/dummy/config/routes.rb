# frozen_string_literal: true

Rails.application.routes.draw do
  resources :things
  devise_for :users
  mount Cookbook::Engine => '/cookbook'
  resources :doodads
  root 'doodads#index'
end
