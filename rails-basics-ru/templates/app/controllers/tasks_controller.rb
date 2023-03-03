# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      pp @task.inspect
      flash[:success] = 'New task was successfully created'
      redirect_to task_path(@task)
    else
      pp @task.errors.full_messages
      flash[:failure] = 'Task cannot be created'
      render :new, status: :unprocessable_entity
    end
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
      flash[:success] = 'task was successfully deleted'
      redirect_to tasks_path
    else
      flash[:failure] = 'task cannot be deleted'
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    params.required(:task).permit(:name, :status, :creator, :performer, :description, :completed)
  end
end
