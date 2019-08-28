# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_up: 'register' },
             controllers: { registrations: 'registrations' }

  namespace :admin do
    root to: 'home#index'
    resources :places, only: %i[index new create edit update] do
      resource :cover_image, only: %i[show update]
      resources :events, only: %i[index new create edit update]
      resource :opening_hours, only: %i[show update]
    end
  end

  resources :events, only: %i[index show], param: :event_slug
  resources :places, only: %i[index show]

  get '/about', to: 'pages#about', as: :about
  get '/sitemap', to: 'sitemaps#index'

  root to: 'home#index'
end
