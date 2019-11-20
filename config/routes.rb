Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   authenticated :user do
    root "courses#index", as: :authenticated_root
   end

   unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
   end
  end

  root :to => "devise/sessions#new"
  resources :contents
  resources :chapters
  resources :courses
  
  get '/download/:id', to: 'contents#download', as: 'download'
end
