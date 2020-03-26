package automigrateFunction

import (
	"net/http"

	"github.com/jinzhu/gorm"
	"github.com/xubiosueldos/conexionBD"
	"github.com/xubiosueldos/conexionBD/Function/structFunction"
	"github.com/xubiosueldos/framework"
)

func AutomigrateFunctionTablasPrivadas(db *gorm.DB) error {

	//para actualizar tablas...agrega columnas e indices, pero no elimina
	err := db.AutoMigrate(&structFunction.Invoke{}, &structFunction.Value{}, &structFunction.Param{}, &structFunction.Function{}).Error
	if err == nil {
		db.Model(&structFunction.Param{}).AddForeignKey("functionname", "function(name)", "CASCADE", "CASCADE")
		db.Model(&structFunction.Function{}).AddForeignKey("valueid", "value(id)", "CASCADE", "CASCADE")
		db.Model(&structFunction.Invoke{}).AddForeignKey("functionname", "function(name)", "CASCADE", "CASCADE")
		db.Model(&structFunction.Value{}).AddForeignKey("valueinvokeid", "invoke(id)", "CASCADE", "CASCADE")
	}
	return err

}

func AutomigrateFunctionTablasPublicas(db *gorm.DB) error {
	//para actualizar tablas...agrega columnas e indices, pero no elimina
	err := db.AutoMigrate(&structFunction.Value{}, &structFunction.Invoke{}, &structFunction.Param{}, &structFunction.Function{}).Error
	if err == nil {
		versionFunctionDB := ObtenerVersionFunctionDB(db)
		if versionFunctionDB < 1 {
			db.Exec("INSERT INTO value(id, created_at, name, valuenumber, valuestring, valueinvokeid, arginvokeid, valueobject) VALUES(-1,current_timestamp,'return',0,'',0,0,NULL)")
			db.Exec("INSERT INTO function(name, created_at, description, origin, type, scope, result, valueid) VALUES('GetParamValue', current_timestamp, 'Obtiene el valor de un parametro de la formula', 'primitive', 'internal', 'public', 'number', 1)")
			db.Exec("INSERT INTO param(id,created_at, name, type, functionname) VALUES(-1,current_timestamp,'paramName','string','GetParamValue')")

			db.Exec("INSERT INTO value(id, created_at, name, valuenumber, valuestring, valueinvokeid, arginvokeid, valueobject) VALUES(-2,current_timestamp,'return',0,'',0,0,NULL)")
			db.Exec("INSERT INTO function(name, created_at, description, origin, type, scope, result, valueid) VALUES('Sum', current_timestamp, 'Dado dos valores obtiene la suma de ambos', 'primitive', 'operator', 'public', 'number', 2)")
			db.Exec("INSERT INTO param(id,created_at, name, type, functionname) VALUES(-2,current_timestamp,'val1','number','Sum')")
			db.Exec("INSERT INTO param(id,created_at, name, type, functionname) VALUES(-3,current_timestamp,'val2','number','Sum')")

			db.Exec("INSERT INTO value(id, created_at, name, valuenumber, valuestring, valueinvokeid, arginvokeid, valueobject) VALUES(-3,current_timestamp,'return',0,'',0,0,NULL)")
			db.Exec("INSERT INTO function(name, created_at, description, origin, type, scope, result, valueid) VALUES('TotalImporteRemunerativo', current_timestamp, 'Dada una liquidacion obtiene la suma total de importes remunerativos de la misma', 'primitive', 'helper', 'public', 'number', 3)")
		}
	}
	return err
}

func ObtenerFormulasPublicas(db *gorm.DB) {
	var w http.ResponseWriter
	var formulas []structFunction.Function

	// nil hace referencia a la funcion automigrate
	db_public := conexionBD.ObtenerDB("public")

	db_public.Find(&formulas)
	for i := 0; i < len(formulas); i++ {
		formula := formulas[i]
		if err := db.Save(&formula).Error; err != nil {
			framework.RespondError(w, http.StatusInternalServerError, err.Error())
			return
		}
	}

}
