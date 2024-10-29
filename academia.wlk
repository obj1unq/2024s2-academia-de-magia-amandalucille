/** Reemplazar por la solución del enunciado */
class Academia{
	const property muebles = #{}

	method yaEstaGuardado(cosa){
		return muebles.any({mueble => mueble.tiene(cosa)})
	}

	method puedeGuardarEnLaAcademia(cosa){
		return self.hayAlMenosUnMuebleParaGuardar(cosa) && (!self.yaEstaGuardado(cosa))
	}
	method hayAlMenosUnMuebleParaGuardar(cosa){
		return muebles.any({m => m.puedeGuardar(cosa)})
	}
	
}

class Cosa {
	const marca            = cuchuflito //cuchiflito será object al igual que otras marcas
	const property volumen = 2
	const esMagico         = true
	const esReliquia       = true
	
	  
}

class Mueble {
	var property cosas = #{}

	method guardarObjeto(cosa){
		
	}
	method tiene(cosa){
		return cosas.contains(cosa)
	}
}

class Baul inherits Mueble{
	const property volumenMax = 10

	override method puedeGuardar(cosa) {
		return super(cosa) && self.haySuficienteEspacio()  
	}
	
	method haySuficienteEspacio(){
		return volumenMax > self.volumenActual() + 1
	}
	method volumenActual(){
		return cosas.sum({cosa => cosa.volumen() })
	}
}

class GabineteMagico inherits Mueble{
	
}

class Armario inherits Mueble{
	
}
