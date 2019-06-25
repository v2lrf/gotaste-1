# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path:        '',
             path_names:  { sign_in: 'login', sign_up: 'register' },
             controllers: { registrations: 'registrations' }

  root to: 'home#index'
end
