# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope '/(:locale)', locale: /en|ru/ do
    root 'home#index'
    resources :posts
    scope module: :posts do
      resources :posts, except: [:index] do
        resources :comments
      end
    end
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
