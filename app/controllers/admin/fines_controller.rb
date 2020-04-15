class Admin::FinesController < ApplicationController
before_action :authenticate_user! # for devise
load_and_authorize_resource :fine
 
 layout "admin"  

  def create
   fineworker = FineWorker.new
   fineworker.perfom
   redirect_to  admin_fines_path, :notice => I18n.t('notice.fine_add')  #"Fines were added" 
  end

  def index
    @fines = Fine.all
  end


end
