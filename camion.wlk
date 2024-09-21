import cosas.*

object camion {
	const property cosas = #{}      //Cosas cargadas
		
	method cargar(unaCosa) {        //Agrega una cosa a las cosas cargadas
		cosas.add(unaCosa) 
	}

	method descargar(unaCosa){      //Quita una cosa de las cosas cargadas
		cosas.remove(unaCosa)
	}

	method todoPesoPar() {          //Bool, que indica si el peso es par
		return not cosas.all({cosas => cosas.peso().odd()})
	}
	
	method hayAlgunoQuePesa(peso) { //Bool, Any/Alguno que cumple el peso
		cosas.any({cosas => cosas.peso() == peso}) 
	}
	
	method elNivel(nivel){ //Devuelve el 1er elemento que coincida con el nivel indicado
		self.tienenNivel(nivel)
		cosas.asList() //Cosas como lista para poder devolver el primer elemento que aparece que cumple
		return cosas.first() 
	}
	method tienenNivel(nivel){ //filtra los que tienen el nivel indicado
		return cosas.filter({cosas => cosas.nivel() == nivel})
	}

	method pesoTotal(){ //Devuelve el peso total del camion
		 return 1000 + cosas.sum({cosas => cosas.peso()})
	}

	method excedidoDePeso() { //Indica si el camión está excedido de peso
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel){ //Filtra los objetos que superan el nivel de peligrosidad indicado
		cosas.filter({cosas => cosas.NivelPeligrosidad() > nivel})
	}
	
	method objetoMasPeligrosoQue(cosa){
		return cosas.filter({ cosa > cosas.nivelPeligrosidad() > cosa.nivelDePeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.noEstaExcedidoDePeso() and self.noSuperaNivelDePeligrosidad(nivelMaximoPeligrosidad)
	}  

	method noEstaExcedidoDePeso() {
		return not self.excedidoDePeso()
	}
	method noSuperaNivelDePeligrosidad(nivelMaximoPeligrosidad){ 
		return not self.superaNivelPeligrosidad(nivelMaximoPeligrosidad)
	}
	method superaNivelPeligrosidad(nivel) {
		return cosas.any({cosas => cosas.nivelPeligrosidad() > nivel})
		
	}
	method tieneAlgoQuePesaEntre(min,max){
		return cosas.any({cosas => cosas.pesoMaxMinEntre(min,max)})
	}
	method pesoMaxMinEntre(min,max){
		return cosas.any({cosas => cosas.peso() > min})
		and cosas.any({cosas => cosas.peso() < max})
	}
	method cosaMasPesada(){
		return cosas.max({cosas => cosas.peso()})
	}
	method pesos(){
		return cosas.filter {cosas => cosas.peso()}
	}
	method totalBultos(){
		return cosas.size()
	}

}
