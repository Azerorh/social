class UsersController < ApplicationController
  def show
    if params[:id].blank?
      @user = current_user
      @post = Post.new
      @comment = Comment.new
    else
      @comment = Comment.new
      @user = User.find(params[:id])
    end

    @posts = @user.posts.order(created_at: :desc)
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @friend = Friend.new
      @parameter = params[:search].downcase
      @results = User.all.where('lower(name) LIKE :search', search: "%#{@parameter}%")
    end
  end
end