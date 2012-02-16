class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      flash[:notice] = "Updated #{@publisher.name}"
      redirect_to edit_publisher_path(@publisher)
    else
      render :edit
    end
  end
end
