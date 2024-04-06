class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id  # присваиваем user_id текущему залогиненному пользователю

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task was successfully updated'
      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task was successfully deleted'
      redirect_to tasks_path
    else
      flash[:failure] = 'Task cannot be deleted'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description).merge(user_id: current_user.id)
  end
end
