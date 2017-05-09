class HomeController < ApplicationController
  def index
    @managers = Manager.limit(19)
  end
end
