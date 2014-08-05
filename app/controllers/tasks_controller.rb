class TasksController < ApplicationController


  def new
    @task = Task.new
    @task_list_id = params[:id]
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task was created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def task_params
      params.require(:task).permit(:task, :task_list_id)
    end
end