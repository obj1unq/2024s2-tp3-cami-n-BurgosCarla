//Cosa
object knightRider {
	method peso() { 
		return 500 
	}
}
//Cosa con estados de transformacion
 object bumblebee {
	var nivelPeligrosidad = 0
	var estadoDeTransformacion = null

	method cambiaEstadoA(estado){
		estadoDeTransformacion = estado
	}
	method auto() {
		nivelPeligrosidad = 15
	}
	method robot() { 
		nivelPeligrosidad = 30 
	}	
}
//Cosa
object ladrillos {
	method peso(cantidad) { 
		return 2 * cantidad 
		}
	method nivelPeligrosidad() { 
		return 2 
	}
}
//Cosa con estados
object arenaAGranel {
	var property peso = 0

	method nivelPeligrosidad(){
		return 1
	}

}
//Cosa 
object bateriaAntiaerea {
	var peso = 200
	var nivelPeligrosidad = 0
	var property estadoBateria = null

	method cambiarEstadoA(unEstado){
		estadoBateria = unEstado
	}
	method default() {
		peso = 200
		nivelPeligrosidad = 0
	}
	method conMisiles(){
		peso = 300
		nivelPeligrosidad = 100
	}
}
object contenedorPortuario {
	var property peso = 100
	const property cosas = #{}
	var property nivelPeligrosidad = null

	method pesoActual(){
		cosas.sum{cosas => cosas.peso()}
	}
	method nivelPeligrosidadActual(){
		nivelPeligrosidad = self.maxPeligrosidad()
	}
	method maxPeligrosidad() {
		cosas.maxIfEmpy({cosas => cosas.nivelPeligrosidad()}, {"defualt"})
	}
}
object residuosRadioactivos {
	var peso = 0
	var property nivelPeligrosidad = 200
}
object embalajePeligrosidad {
	var property peso = 0
	var property nivelPeligrosidad = 0

	method pesoTotalEnvolviendoA(unaCosa){
		peso = unacosa.peso()
	}
	method nivelPeligrosidad(unaCosa){
		nivelPeligrosidad = unaCosa.nivelPeligrosidad() / 2
	}
}







