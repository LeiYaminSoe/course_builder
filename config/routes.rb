Rails.application.routes.draw do
  root :to => "courses#index"
  resources :contents
  resources :chapters
  resources :courses
  
  get '/download/:id', to: 'contents#download', as: 'download'
end
