class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order(:year).all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
  def set_book
    @book = Book.friendly.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :year, :abstract, :cover_img)
  end
end
