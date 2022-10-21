--Stok-Marka Bazlı Satış Faturası Listesi

select 
U.tarih, U.fisno, U.belgeno2 fatura_no, U.carikartkodu, U.cariunvan, M.kod Marka,
K.stokhizmetkodu stok_kodu, K.stokhizmetaciklama stok_adi, K.miktar,  K.birimkodu,
 K.birimfiyati, K.sonbirimfiyati, K.tutari, U.turu
from scf_fatura_kalemi_liste_view K
LEFT JOIN scf_fatura_liste_view U ON U._key = K._key_scf_fatura
LEFT JOIN scf_stokkart S ON S._key = K._key_kalemturu
LEFT JOIN scf_marka M ON M._key = S._key_scf_marka
where U.turu <> 1 and  U.tarih between '{start}' and '{end}' and _key_kalemturu in (select S._key from scf_stokkart S where S._key_scf_marka IN (select M._key from scf_marka M where M.kod='{marka}'))
order by U.tarih, U.fisno


