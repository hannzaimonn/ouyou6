Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/edit'
  get 'book_comments/update'
  get 'book_comments/destroy'
  devise_for :users
   devise_scope :user do
  	get 'user/sign_up' => 'devise/registrations#new'
  end
  root 'home#top'
  get '/home/about' => "home#about"

  post   '/favorite/:book_id' => 'favorites#like',   as: 'like'
  delete '/favorite/:book_id' => 'favorites#unlike', as: 'unlike'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books, shallow: true do
    resources :book_comments, only: [:create, :destroy]
  end

end