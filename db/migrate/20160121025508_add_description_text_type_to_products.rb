class AddDescriptionTextTypeToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.change :description, :text
      t.change :price, :decimal, :precision => 8, :scale => 2
    end
  end
end
