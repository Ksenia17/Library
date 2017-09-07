Rails.application.routes.draw do
  
  get 'books/index'

  devise_for :users,
              controllers: {
                sessions: 'users/sessions' 
                           }
 root to: "home#index"
 get 'home/index'

 namespace :admin do
 
    resources :users , only: [:index, :show] do
          
      get 'list_wait', on: :collection
      get 'list_fines',on: :collection
    end  

 end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
