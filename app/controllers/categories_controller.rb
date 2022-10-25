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

  private
    def category_params
      params.require(:category)
      .permit(:name)
    end
end
