Rails.application.routes.draw do
  
  get 'books/index'

  devise_for :users,
              controllers: {
                sessions: 'users/sessions' 
                          }
 namespace :admins do
  get 'index'
 end

#  get 'admins/index' 

  root to: "home#index"
  get 'home/index'

  resources :users do
    resources :books
  end
  resources :books do
    resources :book_items
    resources :book_requests
  end 


#  resources :users do
#    resources :books
#    resources :book_histories
#    resources :fines
#    resources :book_items
#    resources :book_requests
#    resources :users_roles
#    end
#  resources :books do
#    resources :book_items
#    resources :book_requests
#  end 
#  resources :book_items do
#    resources :book_histories
#  end 
#  resources :book_requests do
#    resources :book_histories
#  end 
#  resources :book_types do
#    resources :books
#  end 
   

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
