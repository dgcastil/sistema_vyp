class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :version
      t.integer :folio
      t.date :fechEmis
      t.integer :indNoRebaja
      t.integer :tipoDespacho
      t.integer :indTraslado
      t.string :tpoImpresion
      t.integer :indServicio
      t.float :mntBruto
      t.integer :fmaPago
      t.integer :fmaPagExp
      t.date :fchCancel
      t.float :mntCancel
      t.float :saldoInsol
      t.date :fchVenc
      t.string :RUTEmisor
      t.string :rznSoc
      t.string :giroEmis
      t.integer :acteco
      t.integer :cdgTraslado
      t.integer :folioAut
      t.date :fchAut
      t.integer :cdgSIISucur
      t.string :dirOrigen
      t.string :cmnaOrigen
      t.string :ciudadOrigen
      t.string :RUTMandante
      t.string :RUTRecep
      t.string :rznSocRecep
      t.string :giroRecep
      t.string :dirRecep
      t.string :cmnaRecep
      t.string :ciudadRecep
      t.string :RUTSolicita
      t.string :patente
      t.string :RUTTrans
      t.string :RUTChofer
      t.string :nombreChofer
      t.string :dirDest
      t.string :cmnaDest
      t.string :ciudadDest
      t.integer :codModVenta
      t.integer :codClauVenta
      t.float :totClauVenta
      t.integer :codViaTransp
      t.integer :codPtoEmbarque
      t.integer :codPtoDesemb
      t.integer :codUnidMedTara
      t.float :pesoBruto
      t.integer :codUnidPesoBruto
      t.integer :codUnidPesoNeto
      t.integer :totBultos
      t.string :codPaisRecep
      t.string :codPaisDestin
      t.string :tpoMoneda
      t.float :mntNeto
      t.float :mntExe
      t.float :mntBase
      t.float :mntMargenCom
      t.float :tasaIVA
      t.float :IVA
      t.float :IVANoRet
      t.float :credEC
      t.float :grntDep
      t.float :valComNeto
      t.float :valComExe
      t.float :valComIVA
      t.float :mntTotal
      t.float :montoNF
      t.string :tpoMoneda_OtraMoneda
      t.float :TpoCambio
      t.float :mntNetoOtrMnda
      t.float :mntExeOtrMnda
      t.float :mntFaeCarneOtrMnda
      t.float :mntMargComOtrMnda
      t.float :IVAOtrMnda
      t.float :IVANoRetOtrMnda
      t.float :mntTotOtrMnda

      t.timestamps
    end
  end
end
