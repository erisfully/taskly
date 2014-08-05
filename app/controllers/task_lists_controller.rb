class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.all
  end

  def new
    @task_list = TaskList.new
  end

  def create
    @task_list = TaskList.new(task_list_params)

    if @task_list.save
      flash[:notice] = "Task List was created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @task_list = TaskList.find(params[:id])
  end

  def update
    @task_list = TaskList.find(params[:id])

    if @task_list.update(task_list_params)
      flash[:notice] = "Task List was updated successfully!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
    def task_list_params
      params.require(:task_list).permit(:name)
    end

end