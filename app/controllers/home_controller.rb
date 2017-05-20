class HomeController < ApplicationController
  def index
    @managers = Manager.limit(19)
  end

  def cities
    @managers = Manager.where(type_manager: 0).limit(10)
  end

  def states
    @managers = Manager.where(type_manager: 1).limit(10)
  end

  def countries
    @managers = Manager.where(type_manager: 2).limit(10)
  end
end
