class CreateCodigoItems < ActiveRecord::Migration
  def change
    create_table :codigo_items do |t|
      t.string :tpoCodigo
      t.string :vlrCodigo

      t.timestamps
    end
  end
end
