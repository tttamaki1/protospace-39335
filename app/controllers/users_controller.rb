class UsersController < ApplicationController
  def show
    @user = User.find(params[:id].to_i)
    @prototypes = Prototype.where(user_id: @user.id)
  end
  
end

