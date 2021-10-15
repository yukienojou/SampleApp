class TasksController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: %i(show edit update destroy)
  before_action :logged_in_user

 
  def new
    @task = Task.new
    @task = user_tasks_path（@user）
    
  end
  
  def index
    @task =Task.all
 
  end
  

  def edit
   @task = Task.find(params[:id])
  end
  
  def show
   @task = Task.find(params[:id])
   @user = current_user
  end
  
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = '新規作成に成功しました。'
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
    
    # beforeフィルター

    # ログイン済みのユーザーか確認します。
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください。"
        redirect_to login_url
      end
    end
    
     def set_user
       @user = User.find(params[:user_id])
     end
    
     def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
        flash[:danger] = "権限がありません。"
        redirect_to user_tasks_url @user
      end
     end
  end