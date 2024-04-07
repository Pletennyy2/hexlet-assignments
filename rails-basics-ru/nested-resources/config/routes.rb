# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  # BEGIN
  resources :posts, shallow: true do
    scope module: :posts do
      resources :post_comments
    end
  end
  # END
end
