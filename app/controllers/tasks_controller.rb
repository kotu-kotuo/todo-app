class TasksController < ApplicationController
before_action :set_task, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def show
    @task = Task.find(params[:id])
  end

  def new

    @task = Task.new
    # current_user.tasks.build
  end

  def create
    @task = Task.new(task_params)
    # current_user.tasks.build(task_params)

    if @task.save
      redirect_to board_path(@task), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :limit)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
