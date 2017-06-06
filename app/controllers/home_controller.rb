class HomeController < ApplicationController
  layout "home"

  def index
    @managers = Manager.limit(19)
    @last_promise = Promise.last
  end

  def cities
    filter = { type_manager: 0 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter).page(params[:page]).per(10)
  end

  def states
    filter = { type_manager: 1 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter).page(params[:page]).per(10)
  end

  def countries
    filter = { type_manager: 2 }
    filter[:text] = params[:search] if (params[:search])
    @managers = Manager.search(filter)
  end
end
