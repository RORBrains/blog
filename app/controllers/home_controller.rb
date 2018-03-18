class HomeController < ApplicationController
  def index
    session[:visits] ||= 0
    session[:visits] += 1
  end
end
