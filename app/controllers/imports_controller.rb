class ImportsController < ApplicationController
  # GET /imports
  # GET /imports.json
  def index
    @publisher = Publisher.find(params[:publisher_id])
    @imports = @publisher.imports

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imports }
    end
  end

  # GET /imports/1
  # GET /imports/1.json
  def show
    @import = Import.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/new
  # GET /imports/new.json
  def new
    @publisher = Publisher.find(params[:publisher_id])
    @import = Import.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @import }
    end
  end

  # GET /imports/1/edit
  def edit
    @import = Import.find(params[:id])
  end

  # POST /imports
  # POST /imports.json
  def create
    @publisher = Publisher.find(params[:publisher_id])
    @import = Import.new(params[:import])
    @import.publisher = @publisher

    if @import.save
      redirect_to edit_import_path(@import), notice: 'Import was successfully created.'
    else
      render action: "new"
    end

  end

  # PUT /imports/1
  # PUT /imports/1.json
  def update
    @import = Import.find(params[:id])

    if @import.update_attributes(params[:import])
      redirect_to edit_import_path(@import), notice: 'Import was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /imports/1
  # DELETE /imports/1.json
  def destroy
    @import = Import.find(params[:id])
    @import.destroy

    respond_to do |format|
      format.html { redirect_to imports_url }
      format.json { head :no_content }
    end
  end
end
