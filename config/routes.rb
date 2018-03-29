Rails.application.routes.draw do
  root "home#index"
  resources :posts
  get "posts/page/(:page(.:format))", to: "posts#index"
end
