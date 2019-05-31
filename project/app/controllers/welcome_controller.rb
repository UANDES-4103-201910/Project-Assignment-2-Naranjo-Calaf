class WelcomeController < ApplicationController
  def index

    @posts = Post.all
    @userposts = Post.where(user_id: current_user.id)
  end
end
