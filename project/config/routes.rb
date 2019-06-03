Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
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



  #TODO: Implement authentication with google  (NARANJO) //Failed
  #
  # post '/login' => 'sessions#create', as: :log_in
  # delete '/log_out' => 'sessions#destroy', as: :log_out



  devise_scope :user do

    authenticated :user do
      root 'welcome#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :root
    end
  end




  # TODO: USER ADMINISTRATION: LAST ACCESS ()
  # TODO: USER ADMINISTRATION: User Role (Query Find id User in Admin Table , if Admin.Super = True SHow SUPER USER, Else: Admin, DEFAULT: User
  # TODO: SYSTEM ADMIN: View Post: Link to : Show posts where the id of the posts = id user logged in
  # TODO: POSTS: Follow Show Posts where Follow.post.id = @post.id)
  # TODO: POSTS: Inappropiate Show Posts where Inapropiate.post.id = @post.id)
  # TODO: (X) Tag User
  # TODO: SEARCH: Nickname (Where User.name = @nickname)
  # TODO: SEARCH: LOCATION (Where User.name = @location)
end
