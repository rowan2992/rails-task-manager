class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(tasks_params)

    redirect_to task_path(@task)
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to home_path
  end


  private

  def tasks_params
    params.require(:task).permit(:name, :details, :completed)
  end
end

