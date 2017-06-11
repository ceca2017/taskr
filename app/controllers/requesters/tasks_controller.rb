class Requesters::TasksController < ApplicationController
  def index
    @task = Task.where(requester_id: current_user.id)
  end

  def show
    if params[:format].nil?
      # the requester has clicked on a link to see details on a specific task
      @task = Task.find(params[:id])
    else
      # the reqester has just created a new task
      @task = Task.find(params[:format])
    end
    @task_cat = TaskCategory.find(@task.task_category_id)
  end
end
