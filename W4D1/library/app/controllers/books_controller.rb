class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
  end

  def new
    # your code here
    render "books/new.html.erb"
  end

  def create
    # your code here
    book = Book.new(book_params)

    if book.save
      redirect_to "/books"
    else
      render json: book.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # your code here
    Book.find(params[:id]).delete
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
