class AddSupplierIdAndProductIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, :integer
    remove_column :suppliers, :supplier_id, :integer
  end
end
