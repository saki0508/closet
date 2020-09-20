class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(8).order("created_at DESC")
  end
end
