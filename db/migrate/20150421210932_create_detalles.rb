class CreateDetalles < ActiveRecord::Migration
  def change
    create_table :detalles do |t|
      t.string :tpoDocLiq
      t.integer :indExe
      t.string :indAgente
      t.float :mntBaseFaena
      t.float :mntMargComer
      t.integer :prcConsFinal
      t.string :nmbItem
      t.float :qtyRef
      t.string :unmdRef
      t.float :prcRef
      t.float :qtyItem
      t.string :unmdItem
      t.float :prcItem
      t.float :descuentoMonto
      t.float :recargoPct
      t.float :recargoMonto
      t.float :montoItem

      t.timestamps
    end
  end
end
