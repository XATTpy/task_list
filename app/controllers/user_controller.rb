class UserController < ApplicationController
  before_action :set_user

  def edit
    authorize @user
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_back fallback_location: root_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'User was successfully destroyed.' }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
