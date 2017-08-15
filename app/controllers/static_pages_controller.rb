class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
  #  @properties_recent = Property.where("created_at > (curdate() - 1)")
      @properties_recent = Property.order(created_at: :desc).limit(5)

  end
  def search
    @search_properties_for = Property.where("(info = ? OR city = ? OR location = ? OR category = ? OR rooms = ?) OR (price BETWEEN ? AND ?)", params[:info], params[:city], params[:location], params[:type], params[:rooms], params[:min], params[:max])

  end
  def help
  end


  def about
  end

end
