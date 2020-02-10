class TasksController < ApplicationController
  

  def index
    if logged_in?
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
    end
  end

  def show
    #シングルレコードなので単数形(sなし 定義)
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
    if @task.save
      flash[:success] = 'taskが登録されましたで'
      redirect_to root_url
    else 
    #  @task = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = "task登録ができませんでした。"
      render 'tasks/index'
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @tasks = current_user.tasks.order(id: :desc).page(params[:page]).per(20)
    
    if @task.update(task_params)
      flash[:success] = 'taskが登録されました'
      redirect_to root_url
    else 
      flash.now[:danger] = "task登録ができませんでした。"
      render 'tasks/edit'
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