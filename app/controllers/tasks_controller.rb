class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  
  def index
    @task = Task.all
  end
  
  def edit
    
  end
  
  def show
   @task = Task.find(params[:id])
   @user = User.find(params[:id])
  end
  
  
  def create
    @task = Task.new(task_params)
    if @task.save
     
      redirect_to @task
    else
      render :new
    end
  end
  
  private
  
    def task_params
      params.require(:task).permit(:name, :detail)
    end
end
  