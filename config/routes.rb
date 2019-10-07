# frozen_string_literal: true

Rails.application.routes.draw do
  constraints CanAccessFlipperUI do
    mount Flipper::UI.app(Flipper) => '/flipper'
  end

  devise_for :users,
             path: '',
             path_names: { sign_in: 'login', sign_up: 'register' },
             controllers: {
               registrations: 'registrations', sessions: 'sessions'
             }

  namespace :admin do
    root to: 'home#index'
    resources :places, only: %i[index new create edit update] do
      resource :cover_image, only: %i[show update]
      resources :events, only: %i[index new create edit update]
      resource :opening_hours, only: %i[show update]
    end
  end

  resources :events, only: %i[index show], param: :event_slug
  resources :leads, only: :create
  namespace :places do
    resources :bars, only: :index
    resources :shops, only: :index
  end

  resources :places, only: %i[index show] do
    resource :favorite, only: %i[create destroy]
  end

  get '/about', to: 'pages#about', as: :about
  get '/sitemap', to: 'sitemaps#index'

  root to: 'home#index'
end
