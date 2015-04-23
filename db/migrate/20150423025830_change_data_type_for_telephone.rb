class ChangeDataTypeForTelephone < ActiveRecord::Migration
  def up
  	change_table :orders do |t|
      t.change :telephone, :string
    end
  end

  def down
  	change_table :orders do |t|
      t.change :telephone, :integer
    end
  end
end
