class FavoritesController < ApplicationController
	before_action :set_variables

  def like
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
  end

  def unlike
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
  end

  private

  def set_variables
    @book = Book.find(params[:book_id])
    @id_name = "#favorite-link-#{@book.id}"
  end
end
