# frozen_string_literal: true
class TasksController < ApplicationController
  def index
    @tasks = Task.order(:position)
  end

  def show
    @task = Task.find(params[:id])
  end

  # View action notes:
  #   - Create an instance variable of new entry on db
  #   - Render a view with a form to create a new entry
  def new
    @count = Task.count
    @task = Task.new(position: @count + 1)
  end

  # Create action notes:
  #   - Instantiate a new object using form parameters
  #   - Save the object
  #   - If save succeeds, redirect to the index action
  #   - If save fails, redisplay the for so user can fix problems
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      # The new action is nOT being called here
      # Assign any instance variables needed
      # @count = Task.count
      render('new')
    end
  end
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path(@task)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

  # Provate function to parse data from forms
  def task_params
    params.required(:task).permit(:name, :position, :completed, :description)
  end
end
