class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        format.html
        format.js {flash[:notice] = "Thank you for your message I will get back to you soon"}
      else
        format.js do
          render js: "alert(#{@contact.errors.full_messages});"
        end
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
