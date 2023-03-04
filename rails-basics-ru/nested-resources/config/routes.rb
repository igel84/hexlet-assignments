# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts
  scope module: :posts do
    resources :post_comments, except: [:index]
  end
  # END
end
