class DashboardController < ApplicationController
  def index
    @user = current_user
    tasks = Task.where(created_by: @user.username)
    filter = params[:filter]
    if not filter
      @tasks = tasks
    elsif filter == 'Assigne'
      @tasks = tasks.order(:assigne)
    elsif filter == 'time'
      @tasks = tasks.order(:created_at)
    else
      @tasks = tasks.order(:status)
    end
  end
end
