Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :posts
  get "posts/page/(:page(.:format))", to: "posts#index"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
