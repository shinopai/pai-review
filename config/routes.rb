Rails.application.routes.draw do
  # devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  # redirects
  get '/users' => redirect('/users/sign_up')

  # root
  root 'home#index'

  # about page
  get '/about', to: 'home#about'

  # contact page
  get '/contact', to: 'home#contact'

  # search form page
  get '/search-form', to: 'home#search_form'

  # items
  resources :items do
    collection do
      get :search
    end
  end

  # likes
   # like and unlike
   resources :users do
     resources :items do
       resources :likes, only: %i(create) do
       collection do
        delete :unlike
       end
     end
   end
  end
   # show items current user liked
   get '/users/:id/likes', to: 'likes#show', as: :user_like_items

  # reviews
  resources :users do
    resources :items do
      resources :reviews, only: %i(create) do
        collection do
          delete :delete_review
        end
      end
    end
  end
end
