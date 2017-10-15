Rails.application.routes.draw do
  

 # namespace :admin do
 #   get 'uchet/index'
 # end

  devise_for :users,
              controllers: {
                sessions: 'users/sessions' 
                           }
 root to: "home#index"
 
 namespace :admin do

    
    resources :info, only: [:index,:show,:edit, :update] do  
    end    

    resources :users , only: [:index,:show,:edit, :update] do
      resources :books , only: [:index] do   
      end 
      get 'list_wait', on: :collection  #
      get 'wait',  on: :member
      post 'confirm', on: :member # совпадает с именем def..end в контроллере
      
      get 'list_fines',on: :collection


      get 'person', on: :member
      post 'save_person', on: :member
    
    
    end  
    resources :book_types , only: [:index] do   
    end 
    
    resources :uchet  do
      post 'create', on: :member
    end

 end

 namespace :reader do
    resources :users , only: [:show,:edit, :update] do 
      resources :books , only: [:index] do   
      end   
    end  
    
    resources :book_types , only: [:index] do   
    end 

 end 




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
