class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    @task.done = false
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to list_path(@list)
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if params[:done] == "true"
      @task.done = true
      @task.save
    end
    redirect_to list_path(@list)
  end

    def show

    end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end
