class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home

  end
  def search
    @search_properties_for = Property.where("(info = ? OR city = ? OR location = ? OR category = ? OR rooms = ?) OR (price BETWEEN ? AND ?)", params[:info], params[:city], params[:location], params[:type], params[:rooms], params[:min], params[:max])
  
  end
  def help
  end


  def about
  end

end
