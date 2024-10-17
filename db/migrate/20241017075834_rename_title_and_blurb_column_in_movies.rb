class RenameTitleAndBlurbColumnInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :Title, :title
    rename_column :movies, :Blurb, :blurb
  end
end
