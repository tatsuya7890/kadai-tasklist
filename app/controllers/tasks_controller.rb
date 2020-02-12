class TasksController < ApplicationController

  #事前処理（ログインしているか確認）
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def index
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'taskが登録されました'
      redirect_to root_url
    else 
      flash.now[:danger] = "task登録ができませんでした。"
      render 'tasks/new'
    end
  end

  def edit
  end

  def update
    
    if @task.update(task_params)
      flash[:success] = 'taskが登録されました'
      redirect_to root_url
    else 
      flash.now[:danger] = "task登録ができませんでした。"
      render 'tasks/edit'
    end
  end

  def destroy
    
    @task.destroy
    
    flash[:success] = 'taskが削除されました'
    redirect_to tasks_path
  end

  private
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  #正しいユーザかチェック
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
     redirect_to root_url
    end
  end

end