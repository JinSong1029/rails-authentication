class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new( book_params )
    if @book.save
      redirect_to @book
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
  end

  private
    def book_params
      params.require(:book).permit(:title, :content)
    end
end
