class BooksController < ApplicationController
  def index
    render json: Book.all
  end

  def def create
    @Book = Object.new(book_params)
    if @Book.save
      flash[:success] = "Object successfully created"
      redirect_to @Book
    else
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
  
end
