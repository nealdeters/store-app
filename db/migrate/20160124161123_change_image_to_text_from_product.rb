class ChangeImageToTextFromProduct < ActiveRecord::Migration
  def change
    change_column :products, :image, :text
  end
end
