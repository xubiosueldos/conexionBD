package structLiquidacion

import (
	"github.com/xubiosueldos/conexionBD/Concepto/structConcepto"
	"github.com/xubiosueldos/conexionBD/structGormModel"
)

type Liquidacionitem struct {
	structGormModel.GormModel
	Concepto        *structConcepto.Concepto `json:"concepto" gorm:"ForeignKey:Conceptoid;association_foreignkey:ID;association_autoupdate:false;not null"`
	Conceptoid      *int                     `json:"conceptoid" sql:"type:int REFERENCES Concepto(ID)" gorm:"not null"`
	Importeunitario *float64                 `json:"importeunitario" sql:"type:decimal(19,4);" gorm:"not null"`
	Liquidacionid   int                      `json:"liquidacionid"`
	Cantidad        float64                  `json:"cantidad" sql:"type:decimal(19,4);"`
	Acumuladores    []Acumulador             `json:"acumuladores" gorm:"ForeignKey:Liquidacionitemid;association_foreignkey:ID"`
	/*
		 Cantidad        *int                      `json:"cantidad"`
		Porcentaje      *int                      `json:"porcentaje"`
		Sobreconceptos  []structConcepto.Concepto `json:"sobreconceptos" gorm:"ForeignKey:Sobreconceptoid;association_foreignkey:ID;association_autoupdate:false"`
		Sobreconceptoid *int                      `json:"sobreconceptoid"`
		Total           float32                   `json:"total" sql:"type:decimal(19,4);"`
	*/
}
