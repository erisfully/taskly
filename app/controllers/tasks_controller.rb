class TasksController < ApplicationController


  def new
    @task = Task.new
    @task_list_id = params[:id]
  end

  def create
    Date.new(params[:date][:year])

    @task = Task.new(
      task: params[:task][:task],
      task_list_id: params[:task][:task_list_id],
      date: params[:task][:date]
    )

    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

end