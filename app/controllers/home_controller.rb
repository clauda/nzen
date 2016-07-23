class HomeController < ApplicationController
  
  def index
    @categories = Category.active.group_by { |cat| cat.name[0] }
  end

  def categories
    @categories = Category.active
  end

  def category
    @category = Category.by_slug(params[:id])
  end

  def districts
    @districts = District.all.order(:name)
  end

  def district
    @district = District.by_slug(params[:id])
  end
end
