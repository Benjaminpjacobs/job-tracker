class ContactsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to company_jobs_path(@company)
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :position, :email, :company_id)
    end
end