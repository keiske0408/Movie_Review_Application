class AddUserIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :user_id, :int
  end
end
