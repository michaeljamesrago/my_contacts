class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @contacts = Contact.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    @contacts = @category.members
  end
  
  def contacts
    @categories = Category.all
    @category = Category.find(params[:id])
    @contacts = @category.members.paginate(page: params[:page])
  end

  private
    def category_params
      params.require(:category)
      .permit(:name)
    end
end
