class AddCountryToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :country, :string
  end
end
