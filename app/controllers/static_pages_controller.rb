class StaticPagesController < ApplicationController
  def index
    @contact = Contact.new
  end

    def download_resume 
  	send_file(
  		"#{Rails.root}/public/marvins.gdoc",
  		filename: "MarvinSantizoresume.gdoc",
  		type: "application/gdoc"
  	)
  end
end
