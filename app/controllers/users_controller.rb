class UsersController < ApplicationController
  def show
    # binding.pry
    # user = User.find(params[:id]).includes(:user)
    @user = User.find(params[:id])
 
    # @user_name = user.name
    # @@user_profile = user.profile
    # @user_occupation = user.occupation
    # @user_position = user.position
  end
end

