class WelcomeController < ApplicationController
  def index
    flash[:notice] = "notice"
  end
end
