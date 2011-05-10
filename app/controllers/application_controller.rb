class ApplicationController < ActionController::Base
  protect_from_forgery

  prepend_before_filter :authenticate_user!
  before_filter :find_distributor

protected
  def find_distributor
    @distributor = Distributor.where(:id => params[:distributor_id]).first
  end
end
