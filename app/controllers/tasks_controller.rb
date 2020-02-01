class TasksController < ApplicationController

  def index
    #全てなので複数形(sあり 定義)
    @tasks = Task.all
  end

  def show
    #シングルレコードなので単数形(sなし 定義)
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'taskが登録されました'
      redirect_to @task
    else 
      flash.now[:danger] = "登録失敗"
      render :new
    end

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'taskが登録されました'
      redirect_to @task
    else 
      flash.now[:danger] = "登録失敗"
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'やることが削除されました'
    redirect_to tasks_path
  end

  private
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end

end