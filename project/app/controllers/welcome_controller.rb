class WelcomeController < ApplicationController
  def index

    @posts = Post.all.order! 'created_at DESC'
    @userposts = Post.where(user_id: current_user.id)
    @comments = Comment.all.order! 'created_at DESC'
    @votes = Vote.all.order! 'created_at DESC'
  end
end
