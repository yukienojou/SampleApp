class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  
  def index
    @task = Task.all
  end
  
  def edit
    @task = Task.find(params[:id])
  end
end
