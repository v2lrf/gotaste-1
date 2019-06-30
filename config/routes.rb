# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_up: 'register' },
             controllers: { registrations: 'registrations' }

  namespace :admin do
    root to: 'home#index'
    resources :places, only: :index
  end

  resources :places, only: %i[index show]

  root to: 'home#index'
end
