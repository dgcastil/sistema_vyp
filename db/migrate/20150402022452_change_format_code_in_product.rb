class ChangeFormatCodeInProduct < ActiveRecord::Migration
  def up
  	change_column :products, :code, :string
  end

  def down
  	change_column :products, :code, :integer
  end
end
