Rails.application.routes.draw do
  get 'welcome/index'

  resources :images
  resources :image_galleries

  root  'welcome#index'
end
