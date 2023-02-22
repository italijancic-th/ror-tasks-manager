# frozen_string_literal: true
class TasksController < ApplicationController
  def index
    @page = params[:page]
    @tasks = ['Fold laundry', 'Sweep porch', 'Wash dishes', 'Mom lawn']
  end

  def new; end

  def edit; end
end
