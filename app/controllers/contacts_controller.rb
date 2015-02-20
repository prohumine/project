class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = "Thank you for your message I will get back to you soon"
      redirect_to root_path
    else
      render new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
