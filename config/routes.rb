Rails.application.routes.draw do
  get 'welcome/index'

  resources :image_galleries do
    resources :images
  end

  root  'welcome#index'
end
