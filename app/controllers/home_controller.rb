class HomeController < ApplicationController
  def index
    @managers = Manager.limit(6)
  end
end
