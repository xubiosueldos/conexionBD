package structNovedad

import (
	"time"

	"github.com/xubiosueldos/conexionBD/Concepto/structConcepto"
	"github.com/xubiosueldos/conexionBD/Legajo/structLegajo"
	"github.com/xubiosueldos/conexionBD/structGormModel"
)

type Novedad struct {
	structGormModel.GormModel
	Nombre      string                   `json:"nombre"`
	Codigo      string                   `json:"codigo"`
	Descripcion string                   `json:"descripcion"`
	Activo      int                      `json:"activo"`
	Importe     *float32                 `json:"importe" sql:"type:decimal(19,4);"`
	Cantidad    float64                  `json:"cantidad" sql:"type:decimal(19,4);"`
	Fecha       *time.Time               `json:"fecha" gorm:"not null"`
	Legajo      *structLegajo.Legajo     `json:"legajo" gorm:"ForeignKey:Legajoid;association_foreignkey:ID;association_autoupdate:false;not null;PRELOAD:false"`
	Legajoid    *int                     `json:"legajoid" sql:"type:int REFERENCES Legajo(ID)" gorm:"not null"`
	Concepto    *structConcepto.Concepto `json:"concepto" gorm:"ForeignKey:Conceptoid;association_foreignkey:ID;association_autoupdate:false;not null"`
	Conceptoid  *int                     `json:"conceptoid" gorm:"not null"`
}
