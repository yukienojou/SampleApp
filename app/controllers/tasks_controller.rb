class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  
  def index
    @task = Task.all
  end
  
  def show
    @task = Task
  end
end
