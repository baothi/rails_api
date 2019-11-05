class Api::V1::BooksController < ApplicationController
  before_acion :load_book, only: :show

  def index
    put "========================================="
    @books = Book.all
    json_response "Index books Successfully", true, {books: @books}, :ok
  end

  def show
    json_response "show book Successfully", true, {book: @book}, :ok
  end

  private
  def load_book
    @book = Book.find_by id: params[:id]
    unless @book.present?
      json_response "Can not get book", false, {}, :not_found
    end
  end
end
