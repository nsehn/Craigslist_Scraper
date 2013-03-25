class CraigslistItemsController < ApplicationController
  # GET /craigslist_items
  # GET /craigslist_items.json
  def index
    url = params[:search_url]
    if url != nil
      scraper = CraigslistScraperScript.new(url)
      scraper.get_data
    end

    @craigslist_items = CraigslistItem.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @craigslist_items }
    end
  end

  # GET /craigslist_items/1
  # GET /craigslist_items/1.json
  def show
    @craigslist_item = CraigslistItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @craigslist_item }
    end
  end

  # GET /craigslist_items/new
  # GET /craigslist_items/new.json
  def new
    @craigslist_item = CraigslistItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @craigslist_item }
    end
  end

  # GET /craigslist_items/1/edit
  def edit
    @craigslist_item = CraigslistItem.find(params[:id])
  end

  # POST /craigslist_items
  # POST /craigslist_items.json
  def create
    @craigslist_item = CraigslistItem.find(params[:url])
    if @craigslist_item.nil?
      @craigslist_item = CraigslistItem.new(params[:craigslist_item])
    end

    respond_to do |format|
      if @craigslist_item.save
        format.html { redirect_to @craigslist_item, notice: 'Craigslist item was successfully created.' }
        format.json { render json: @craigslist_item, status: :created, location: @craigslist_item }
      else
        format.html { render action: "new" }
        format.json { render json: @craigslist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /craigslist_items/1
  # PUT /craigslist_items/1.json
  def update
    @craigslist_item = CraigslistItem.find(params[:id])

    respond_to do |format|
      if @craigslist_item.update_attributes(params[:craigslist_item])
        format.html { redirect_to @craigslist_item, notice: 'Craigslist item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @craigslist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /craigslist_items/1
  # DELETE /craigslist_items/1.json
  def destroy
    @craigslist_item = CraigslistItem.find(params[:id])
    @craigslist_item.destroy

    respond_to do |format|
      format.html { redirect_to craigslist_items_url }
      format.json { head :no_content }
    end
  end
end
