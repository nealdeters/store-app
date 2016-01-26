Rails.application.routes.draw do
  get '/' => 'products#home'
  get '/products' => 'products#index'
  get '/suppliers' => 'suppliers#index'
  get '/inventory' => 'products#inventory'

  get '/products/new' => 'products#new'
  get '/suppliers/new' => 'suppliers#new'
  post '/products' => 'products#create'
  post '/suppliers' => 'suppliers#create'

  get '/products/:id' => 'products#show'
  get '/suppliers/:id' => 'suppliers#show'

  get '/products/:id/edit' => 'products#edit'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch '/products/:id' => 'products#update'
  patch '/suppliers/:id' => 'suppliers#update'

  delete '/products/:id' => 'products#destroy'
  delete '/suppliers/:id' => 'suppliers#destroy'

  post '/search' => 'products#search'

end
