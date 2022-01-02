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

  # search page
  get '/search', to: 'home#search'
end
