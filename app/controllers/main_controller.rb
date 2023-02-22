class MainController < ApplicationController
  def index
  end

  def about
    # Instance variable to put dynamic data into a template
    @crated_by= 'Ivan Talijancic'
    @id = params[:id]
    @page = params['page']
  end

  def hello
    # redirect_to main_index_path
    redirect_to(controller: "main", action: "index")
  end
end
