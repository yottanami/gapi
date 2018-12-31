class MainController < ApplicationController
  def home
    render :json => {:error => "Wrong path!"}
  end
end
