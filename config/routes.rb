Rails.application.routes.draw do
  devise_for :users
  
  post '/search' => 'products#search'

  root 'products#home'
  get '/products' => 'products#index'
  get '/suppliers' => 'suppliers#index'
  get '/images' => 'images#index'
  get '/carted_products' => 'carted_products#index'

  get '/inventory' => 'products#inventory'

  get '/products/new' => 'products#new'
  get '/suppliers/new' => 'suppliers#new'
  get '/images/new' => 'images#new'

  post '/products' => 'products#create'
  post '/suppliers' => 'suppliers#create'
  post '/images' => 'images#create'
  post '/orders' => 'orders#create'
  post '/carted_products' => 'carted_products#create'

  get '/products/:id' => 'products#show'
  get '/images/:id' => 'images#show'
  get '/orders/:id' => 'orders#show'

  get '/products/:id/edit' => 'products#edit'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  get '/images/:id/edit' => 'images#edit'
  get '/carted_products/:id/edit' => 'carted_products#edit'

  patch '/products/:id' => 'products#update'
  patch '/suppliers/:id' => 'suppliers#update'
  patch '/images/:id' => 'images#update'
  patch '/carted_products' => 'carted_products#update'

  delete '/products/:id' => 'products#destroy'
  delete '/suppliers/:id' => 'suppliers#destroy'
  delete '/images/:id' => 'images#destroy'

end
