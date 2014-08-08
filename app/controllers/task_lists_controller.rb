class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
    @tasks = Task.where(completed: false)
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

  def show
    @task_list = TaskList.find(params[:id])
    @tasks = Task.where(task_list_id: "#{params[:id]}").where(completed: false)
  end

  def completed
    @task_list = TaskList.find(params[:id])
    @tasks = Task.where(completed: true)
  end

  private
    def task_list_params
      params.require(:task_list).permit(:name)
    end

end