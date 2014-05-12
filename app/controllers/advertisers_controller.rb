class AdvertisersController < ApplicationController
  def index
    @publisher = Publisher.find(params[:publisher_id])
    @advertisers = @publisher.advertisers
  end

  def new
    @advertiser = Advertiser.new
    @publisher = Publisher.find(params[:publisher_id])
  end

  def edit
    @advertiser = Advertiser.find(params[:id])
  end

  def create
    @publisher = Publisher.find(params[:publisher_id])
    @advertiser = Advertiser.new(params[:advertiser])
    @advertiser.publisher = @publisher

    if @advertiser.save
      redirect_to edit_advertiser_path(@advertiser), notice: 'Advertiser was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @publisher = Publisher.find(params[:publisher_id])
    @advertiser = Advertiser.find(params[:id])
    @advertiser.publisher = @publisher

    if @advertiser.update_attributes(params[:advertiser])
      redirect_to edit_advertiser_path(@advertiser), notice: 'Advertiser was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @advertiser = Advertiser.find(params[:id])
    @advertiser.destroy
    redirect_to publisher_advertisers_path(@advertiser.publisher)
  end
end
