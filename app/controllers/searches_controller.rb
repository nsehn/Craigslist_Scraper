class SearchesController < ApplicationController

  skip_before_filter :verify_authenticity_token, #:only => [:create]
  

  # GET /searches
  # GET /searches.json
  def index
    # index run first by convention
    #helper_method :current_user

    @user = self.current_user
    # user.searches.create
    @searches = Search.all #Search means model search.rb. Search.all gets all of the rows from the searches table in sql.
    #Search.all should become something like Search.matches(current_user) OR current_user.searches. Right now this is returning every single search. We want it to be used for multiple users so the information returned should be for the specific user. Arel - relational algebra
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.find_or_create_by_url(params[:url])
    puts params
    user_search = current_user.user_searches.find_or_initialize_by_search_id(@search.id)
    user_search.email = params[:email]
    user_search.sms = params[:sms]
    user_search.title = params[:bookmarkname]
    

    respond_to do |format|
      if user_search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
        scraper = CraigslistScraperScript.new(@search.url)
        @items = scraper.get_data
        @craigslist_item = CraigslistItem.create(@items)
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:url => @url])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
end
