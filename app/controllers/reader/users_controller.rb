class Reader::UsersController < ApplicationController  # AdminController
  before_action :authenticate_user! # for devise

  layout "reader"
  

  def show
     @user = User.find(params[:id])
  end
   
       
end
