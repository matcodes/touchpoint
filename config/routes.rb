Bootstrap::Application.routes.draw do

  
  resources :authentications, :only => [:index, :destroy]
  devise_for :users, :path_names => { :sign_up => 'register', 
                                      :sign_in => 'login', 
                                      :sign_out => 'logout' },
                     :controllers => {:registrations => "users/registrations",
                                      :omniauth_callbacks => "users/omniauth_callbacks"}
  resources :users, :only => [:show]

  match "/send_quotation" =>"home#send_quotation"

  match "/test" => 'home#index1'
  match "/test_image" => 'home#index2'
  match "/test_hires_image" => 'home#index3'
  match "/test_final" => 'home#index4'
  match ':action' => 'static#:action'
  root :to => "home#index"
end
