class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @deal }
    end
  end

  def new
    @advertiser = Advertiser.find(params[:advertiser_id])
    @deal = @advertiser.deals.build
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def create
    @advertiser = Advertiser.find(params[:advertiser_id])
    @deal = @advertiser.deals.build(params[:deal])
    if @deal.save
      redirect_to @deal, notice: 'Deal was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @deal = Deal.find(params[:id])

    if @deal.update_attributes(params[:deal])
      redirect_to @deal, notice: 'Deal was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    redirect_to deals_url
  end
end
