class TasksController < ApplicationController


  def new
    @task = Task.new
    @task_list_id = params[:id]
    @user = User.all
  end

  def create

      if params[:task][:date] == ""
        params[:task][:date] = "2014-8-15"
      end
    @task = Task.new(
      task: params[:task][:task],
      task_list_id: params[:task][:task_list_id],
      date: Date.parse(params[:task][:date]),
      user_id: params[:task][:user_id]
    )
    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task was deleted successfully!"
    redirect_to :back
  end


  def complete
    @task = Task.find(params[:id])
    @task.completed = true
    @task.save
    flash[:notice] = "Task complete!"
    redirect_to :back
  end

end

