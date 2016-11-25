class BooksController < ApplicationController
  before_action :authenticate_user!

  #index Action
  def index
    @books = Book.all
    @hash = Gmaps4rails.build_markers(@books) do |book, marker|
      marker.lat book.latitude
      marker.lng book.longitude
    end
  end

  #Creating empty book
  def new
    @book = Book.new
  end

  #Save real data to db
  def create
    @book = current_user.books.new(book_params)
    if @book.valid?
      if @book.save
        redirect_to @book
      end
    else
      redirect_to new_book_path
    end
  end
  #Edit action.
  def edit
    @book = Book.find(params[:id])
  end

  #Update Action
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  #show action
  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :content, :price, :city, :avatar)
    end
end
