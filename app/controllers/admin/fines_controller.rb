class Admin::FinesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :fine
 
 layout "admin"  

  def create
   fineworker = FineWorker.new
   fineworker.perfom
   redirect_to  admin_fines_path, :notice => "Fines were added" 
  end

  def index
    @fines = Fine.where ("id is not null")
  end


end
