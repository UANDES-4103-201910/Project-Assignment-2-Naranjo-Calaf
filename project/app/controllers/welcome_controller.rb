class WelcomeController < ApplicationController
  def index

    if(current_user.profile==nil)
	    redirect_to(new_profile_path)
    end
    @posts = Post.all.order! 'created_at DESC'
    @user_profile = Profile.where(user_id: current_user.id)
    @userposts = Post.where(user_id: current_user.id)
    @comments = Comment.all.order! 'created_at DESC'
    @votes = Vote.all.order! 'created_at DESC'
  end

end
