class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to @contact
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @categories = Category.all
    @joinable_categories = Category.all.select { |category| !(@contact.categories.include?(category)) }
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contact_path(@contact)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to root_url, status: :see_other
  end

  private
    def contact_params
      params.require(:contact)
      .permit(:name, :email, :phone)
    end
end
