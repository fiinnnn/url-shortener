# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/:source', to: 'redirect#show'
  post '/', to: 'redirect#new'
end
