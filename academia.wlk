/** Reemplazar por la solución del enunciado */
class Academia{
	const property muebles = #{}

	method puedeGuardarEnLaAcademia(cosa){
		return self.hayAlMenosUnMueble() && not (yaEstaGuardado(cosa))
	}
	method hayAlMenosUnMueble(){
		return not (muebles.isEmpty())
	}
	method yaEstaGuardado(cosa){
		muebles.any({mueble => mueble.puedeGuardar()})
	}
}

class Cosa {
	const marca   = x
	const property volumen = 2

	method esMagico(){
		return 
		}
	method esReliquia(){
		return 
		}
	
	  
}

class Mueble {
	var property cosas = #{}

	method guardarObjeto(cosa){
		if (self.puedeGuardar(cosa)){
			cosas.add(cosa)
		}
	}
	method puedeGuardar(cosa){
		return cosas.contains(cosa)// no se si está bien esto
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
