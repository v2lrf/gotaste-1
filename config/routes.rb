# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path:        '',
             path_names:  { sign_in: 'login', sign_up: 'register' },
             controllers: { registrations: 'registrations' }

  namespace :admin do
    root to: 'home#index'
    resources :places, only: %i[index edit update] do
      resource :opening_hours, only: %i[show update]
    end
  end

  resources :places, only: %i[index show]

  root to: 'home#index'
end
