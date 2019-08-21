Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  resources :coins
  get '/:locale' => 'welcome#index'
  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "/:locale" do
    resources :coins
    resources :mining_types
  end
end
