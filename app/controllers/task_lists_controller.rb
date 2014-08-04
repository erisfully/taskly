class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new

  end

  def create
    @task_lists = TaskList.new(task_list_params)
    if @task_lists.save
    flash[:notice] = "Task List was created successfully!"
    redirect_to root_path
    end
  end

  private
    def task_list_params
      params.require(:task_list).permit(:name)
    end

end