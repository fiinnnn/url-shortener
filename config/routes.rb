Rails.application.routes.draw do
  root 'home#index'
  get '/:source', to: 'redirect#show', as: :source
end
