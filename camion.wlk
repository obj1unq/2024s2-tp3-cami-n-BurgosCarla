import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method todoPesoPar() {
		return cosas.all({cosas => cosas.peso().odd()})
	}

	method hayAlgunoQuePesa(peso) {
		cosas.forEach({cosas => cosas.peso(peso)})
	}

	method elNivel(nivel){
		return cosas.any({cosas => cosas.nivelPeligrosidad() == nivel}) 
		//return cosas.any({cosa => cosa.categoria() == categoria}
	}

	method pesoTotal(pesoDelCamion){
		 return 1000 + pesoDelCamion
	}

	method excedidoDePeso() {
		return pesoTotal(pesoDelCamion) > 25000
	}
	method objetosQueSuperanPeligrosidad(nivel){
		cosas.filter({cosas => cosas.NivelPeligrosidad() > nivel})
	}
	method objetoMasPeligrosoQue(cosa){
		////Referencia a la cosa y al nivel de peligrosidad
		return cosas.filter({ cosa > cosas.nivelPeligrosidad() > cosa.nivelDePeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.excedidoDePeso() and self.noSuperaNivelDePeligrosidad(nivelMaximoPeligrosidad)
	}
	method noSuperaNivelDePeligrosidad(nivelMaximoPeligrosidad){
		return 
	}
}
