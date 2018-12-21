class MainController < ApplicationController
  def home
    render :json => {:name => "Wrong path!"}
  end
end
