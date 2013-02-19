class BookmarkletsController < ApplicationController
# run the bookmarklet.html.erb page here
 layout 'application'
def index
    # index run first by convention
    #helper_method :current_user
    @user = self.current_user
    @bookmarked = params[:url]
    @page_title = params[:title]
    # user.searches.create
   	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

end