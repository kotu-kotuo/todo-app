class CommentsController < ApplicationController

  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comments_params)
    if @comment.save!
      redirect_to board_task_path(board_id: @task.board_id,id: @task.id), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  private
  def comments_params
      params.require(:comment).permit(:content)
  end

end
