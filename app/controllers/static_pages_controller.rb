class StaticPagesController < ApplicationController
  def index
    @contact = Contact.new
  end

    def download_resume 
  	send_file(
  		"#{Rails.root}/public/marvinsres.pdf",
  		filename: "MarvinSantizoresume.pdf",
  		type: "application/pdf"
  	)
  end
end
