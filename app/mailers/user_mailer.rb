class UserMailer < ActionMailer::Base
  default from: 'zoomerrr@mail.ru'

  def task_email
    @user = params[:user]
    @task = params[:task]
    mail(to: @user.email, subject: 'Task status was updated')
  end
end
