class HomeController < ApplicationController
  def index;end

  def categories
    @categories = Category.active
  end

  def category
    @category = Category.by_slug(params[:id])
  end

  def districts
    @districts = District.all
  end

  def district
    @district = District.by_slug(params[:id])
  end
end
