class HomeController < ApplicationController
  def index
    @managers = Manager.limit(19)
  end

  def cities
    filter = { type_manager: 0 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter).limit(10)
  end

  def states
    filter = { type_manager: 1 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter).limit(10)
  end

  def countries
    filter = { type_manager: 2 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter).limit(10)
  end
end
