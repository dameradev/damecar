class AddPostionToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :postion, :integer
  end
end
