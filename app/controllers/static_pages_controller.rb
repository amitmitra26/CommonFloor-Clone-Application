class StaticPagesController < ApplicationController
  skip_before_action :require_login

  def home
    @properties_recent = Property.order(created_at: :desc).limit(5)
  end

  def search
    if (params[:min].to_i > 0) && (params[:max].to_i == 0)
      params[:max] = 1000000000000
    end
    @search_properties_for = Property.where("(info = ? OR city = ? OR location = ? OR category = ? OR rooms = ?) OR (price >= ? AND price <= ?)", params[:info], params[:city], params[:location], params[:category], params[:rooms], params[:min], params[:max])
  end

  def help
  end

  def about
  end

end
