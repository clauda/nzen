class RemoteController < ApplicationController
  
  def categories
    @categories = Category.children.order(:name)
    respond_to { |format| format.json }
  end

  def districts
    @districts = District.all.order(:name)
    respond_to { |format| format.json }
  end

end
