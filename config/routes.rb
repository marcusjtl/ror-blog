Rails.application.routes.draw do
  # fix for devise to disable sign up page

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, :skip => [:registrations] 
  as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :articles
  
  # Defines the root path route ("/")
  root "articles#index"
end
