class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @task = Task.find(params[:task_id])
  end

  def create
    @comment = Comment.new
    @task = Task.find(params[:task_id])
    @board = Board.find(@task.board_id)
    if @comment.save
      redirect_to board_task_path(@board,@task), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end


end
