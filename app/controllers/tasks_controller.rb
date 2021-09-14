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
   @user = current_user
  end
  
  
  def create
    @user = current_user
    @task = @user.tasks.new(task_params)
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
  