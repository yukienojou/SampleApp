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
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "#{@task.name}のデータを削除しました。"
    redirect_to tasks_url
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスク情報を更新しました。"
      redirect_to @task
    else
      render :edit      
    end
  end
  
  private
  
    def task_params
      params.require(:task).permit(:name, :detail)
    end
end
  