# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/r/:source', to: 'redirect#show'

  resource :links, only: [:create]
end
