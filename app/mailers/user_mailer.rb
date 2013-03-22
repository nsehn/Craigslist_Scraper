class UserMailer < ActionMailer::Base
  default from: "notifications@craigslistalert.com"


  def welcome_email(user)
  	@user = user
  	@url = "http://localhost:3000"
  	mail(:to => user.email, :subject => "Welcome to Craigslist Scraper!")
end
end
