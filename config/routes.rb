Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#products'
end
