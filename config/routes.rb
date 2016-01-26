Rails.application.routes.draw do
  get '/' => 'products#home'
  get '/products' => 'products#index'
  get '/suppliers' => 'suppliers#index'
  get '/images' => 'images#index'
  get '/inventory' => 'products#inventory'

  get '/products/new' => 'products#new'
  get '/suppliers/new' => 'suppliers#new'
  get '/images/new' => 'images#new'
  post '/products' => 'products#create'
  post '/suppliers' => 'suppliers#create'
  post '/images' => 'images#create'

  get '/products/:id' => 'products#show'

  get '/products/:id/edit' => 'products#edit'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  get '/images/:id/edit' => 'images#edit'
  patch '/products/:id' => 'products#update'
  patch '/suppliers/:id' => 'suppliers#update'
  patch '/images/:id' => 'images#update'

  delete '/products/:id' => 'products#destroy'
  delete '/suppliers/:id' => 'suppliers#destroy'
  delete '/images/:id' => 'images#destroy'

  post '/search' => 'products#search'

end
