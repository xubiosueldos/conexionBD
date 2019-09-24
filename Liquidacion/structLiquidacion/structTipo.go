package structLiquidacion

import (
	"github.com/xubiosueldos/conexionBD/structGormModel"
)

type Liquidaciontipo struct {
	structGormModel.GormModel
	Nombre      string `json:"nombre"`
	Codigo      string `json:"codigo"`
	Descripcion string `json:"descripcion"`
	Activo      int    `json:"activo"`
}