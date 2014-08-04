class TaskListsController < ApplicationController

  def index
    @task_lists = TaskList.order(:name)
  end

  def new

  end

  def create
    render plain: params[:task_list].inspect
  end
end