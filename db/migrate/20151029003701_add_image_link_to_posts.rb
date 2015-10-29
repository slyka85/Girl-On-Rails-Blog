class AddImageLinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_link, :string
  end
end
