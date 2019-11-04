class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
    @users = User.all
    authorize @task
  end

  # GET /tasks/1/edit
  def edit
    @users = User.all
    authorize @task
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @users = User.all

    respond_to do |format|
      if @task.save
        UserMailer.with(user: @task.user, task: @task).task_email.deliver_now
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    task_before_update = @task
    respond_to do |format|
      if @task.update(task_params)
        if (@task.status != task_before_update.status) && (@task.status != 'To Do')
          user = User.find_by username: @task.created_by
          UserMailer.with(user: user, task: @task).task_email.deliver_now
        end
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    authorize @task
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:subject, :assignee, :status, :description, :created_by)
  end
end
