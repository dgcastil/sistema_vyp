class Documento < ActiveRecord::Base
  attr_accessible :IVA, :IVANoRet, :IVANoRetOtrMnda, :IVAOtrMnda, :RUTChofer, :RUTEmisor, :RUTMandante, :RUTRecep, :RUTSolicita, :RUTTrans, :TpoCambio, :acteco, :cdgSIISucur, :cdgTraslado, :ciudadDest, :ciudadOrigen, :ciudadRecep, :cmnaDest, :cmnaOrigen, :cmnaRecep, :codClauVenta, :codModVenta, :codPaisDestin, :codPaisRecep, :codPtoDesemb, :codPtoEmbarque, :codUnidMedTara, :codUnidPesoBruto, :codUnidPesoNeto, :codViaTransp, :credEC, :dirDest, :dirOrigen, :dirRecep, :fchAut, :fchCancel, :fchVenc, :fechEmis, :fmaPagExp, :fmaPago, :folio, :folioAut, :giroEmis, :giroRecep, :grntDep, :indNoRebaja, :indServicio, :indTraslado, :mntBase, :mntBruto, :mntCancel, :mntExe, :mntExeOtrMnda, :mntFaeCarneOtrMnda, :mntMargComOtrMnda, :mntMargenCom, :mntNeto, :mntNetoOtrMnda, :mntTotOtrMnda, :mntTotal, :montoNF, :nombreChofer, :patente, :pesoBruto, :rznSoc, :rznSocRecep, :saldoInsol, :tasaIVA, :tipoDespacho, :totBultos, :totClauVenta, :tpoImpresion, :tpoMoneda, :tpoMoneda_OtraMoneda, :valComExe, :valComIVA, :valComNeto, :version

end