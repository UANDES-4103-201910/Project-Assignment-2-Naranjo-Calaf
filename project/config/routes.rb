Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users
  resources :comments
  resources :follows
  resources :profiles
  resources :images
  resources :attachments
  resources :links
  resources :votes
  resources :blacklists
  resources :dumpsters
  resources :innapropiates
  resources :posts
  resources :admins
  resources :geofences
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #TODO: IMPLEMENT CORRECTLY DEVICES  (NARANJO) //DONE
  #TODO: Implement CANCANCAN (NARANJO) //Penita
  #  authenticated :users do
  #    root to: 'session#create'
  #  end
  #
  #  unauthenticated :users do
  #    root to: 'sessions#new'
  #  end
  #
  #
  #
  # #TODO: Implement authentication with google  (NARANJO)
  #
  # post '/login' => 'sessions#create', as: :log_in
  # delete '/log_out' => 'sessions#destroy', as: :log_out


  devise_scope :user do
    authenticated :user do
      root 'welcome#index', as: :authenticated_root #TODO: move it to the homepage (CALAF)
    end

    unauthenticated do
      root 'devise/sessions#new', as: :root_path
    end
  end




  # TODO; REGISTRATION; Password Recovery( Show in Registration Pass Recovery, link to User/edit, and show only password) //como devices esta implementado se usa edit_user_password
  # TODO: USER ADMINISTRATION: LAST ACCESS (No se como hacerlo)
  # TODO: USER ADMINISTRATION: User Role (Query Find id User in Admin Table , if Admin.Super = True SHow SUPER USER, Else: Admin, DEFAULT: User
  # TODO: SYSTEM ADMIN: View Post: Link to : Show posts where the id of the posts = id user logged in
  # TODO: SYSTEM ADMINISTRATION: Change password ( EDIT User where user is logged)
  # TODO: USER PROFILE: SHOW POSTS where (user id = post.userid)
  # TODO: POSTS: Up/down Votes Show Posts where Votes.post.id = @post.id)
  # TODO: POSTS: Follow Show Posts where Follow.post.id = @post.id)
  # TODO: POSTS: Inappropiate Show Posts where Inapropiate.post.id = @post.id)
  # TODO: CREAR EDITAR Comentarios
  # TODO: (X) Tag User
  # TODO View Author Profile (Show Profile where Post.id = User.id of author)
  # TODO: SEARCH: Nickname (Where User.name = @nickname)
  # TODO: SEARCH: LOCATION (Where User.name = @location)
end
