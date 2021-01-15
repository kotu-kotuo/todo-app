class TasksController < ApplicationController
before_action :set_task, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]



  def show

    @board = Board.find(params[:board_id])
    @task = @board.tasks.find(params[:id])
    binding.pry
    @comments = @task.comments
  end

  def new

    @task = Task.new
    # current_user.tasks.build
  end

  def create
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build(task_params)
    if @task.save
      redirect_to board_path(@board), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  def edit
    @board = Board.find(params[:board_id])
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @board = Board.find(params[:board_id])
    if @task.update(task_params)
      redirect_to board_task_path(@board,@task), notice: '更新できました'
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
