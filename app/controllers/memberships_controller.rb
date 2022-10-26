class MembershipsController < ApplicationController
  def create
    @contact = Contact.find(params[:contact_id])
    @category = Category.find(params[:category_id])
    @contact.join(@category)
    redirect_to @contact
  end

  def destroy
    contact = Membership.find(params[:id]).contact
    category = Membership.find(params[:id]).category
    contact.categories.delete(category)
    redirect_to contact
  end
end
