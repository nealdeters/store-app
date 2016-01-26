class AddSupplierIdToSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :supplier_id, :integer
  end
end
