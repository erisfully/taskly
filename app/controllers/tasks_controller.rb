class TasksController < ApplicationController


  def new
    @task = Task.new
    @task_list_id = params[:id]
  end

  def create
    @date = Date.new(params[:task]["date(1i)"].to_i, params[:task]["date(2i)"].to_i, params[:task]["date(3i)"].to_i)

    @task = Task.new(
      task: params[:task][:task],
      task_list_id: params[:task][:task_list_id],
      date: @date
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
    redirect_to root_path
  end

end

