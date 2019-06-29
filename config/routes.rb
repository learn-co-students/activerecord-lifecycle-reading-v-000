Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :posts, only: [:index, :show, :new, :create, :edit, :update]
#get '/posts', to: 'posts#index'
#get '/posts/new', to: 'posts#new'
#get '/posts/:id', to: 'posts#show'
#get '/posts/:id/edit', to: 'posts#edit', as: 'edit_post'
#post '/posts/', to: 'posts#create'
#patch '/posts/:id', to: 'posts#update'
end
