class BookmarkletsController < ApplicationController
# run the bookmarklet.html.erb page here
 layout 'application'
def index
    # index run first by convention
    #helper_method :current_user
    
    @url = params[:url]
    @page_title = params[:title]
    @sms = params[:sms]
    @email = params[:email]
    
    # find_or_create_by_url(@url)
    search = Search.find_by_url(@url) || Search.create!(:url => @url)

    # current_user.user_searches.find_or_create_by_search_id({:search_id => search.id, :title => @page_title})
    user_search = current_user.user_searches.find_by_search_id(search.id)
    user_search ||= current_user.user_searches.create!({:search_id => search.id, :title => @page_title, :sms => @sms, :email => @email})

  end

  def js
    render :file => "bookmarklets/js", :content_type => Mime::JS, :layout => false
  end

end