Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :comments
  resources :follows
  resources :profiles
  # resources :images
  # resources :attachments
  # resources :links
  resources :votes
  resources :blacklists
  resources :dumpsters
  resources :innapropiates
  resources :posts do
    member do
      post 'upvote'
      post 'downvote'
    end
  end
  # resources :admins
  # resources :geofences
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  devise_scope :user do

    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end



  # TODO: SYSTEM ADMIN: View Post: Link to : Show posts where the id of the posts = id user logged in
  # TODO: POSTS: Inappropiate Show Posts where Inapropiate.post.id = @post.id)
  # TODO: (X) Tag User

end
