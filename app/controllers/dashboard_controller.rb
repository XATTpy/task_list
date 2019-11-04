class DashboardController < ApplicationController
  def index
    @user = current_user
    tasks = Task.where(created_by: @user.username)
    filter = params[:filter]
    @tasks = if !filter
               tasks
             elsif filter == 'Assigne'
               tasks.order(:assigne)
             elsif filter == 'time'
               tasks.order(:created_at)
             else
               tasks.order(:status)
             end
  end
end
