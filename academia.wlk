/** Reemplazar por la solución del enunciado */
object academia{
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
	const volumen = 2

	method esMagico(){
		return 
		}
	method esReliquia(){
		return 
		}
	
	  
}

class Mueble {
	var property cosas = #{}

	method puedeGuardar(cosa){
		return cosas.any({elemento => elemento == cosa})// no se si está bien esto
	}
}

class Baul inherits Mueble{

	override method puedeGuardar(cosa) {
		return super(cosa) && self.haySuficienteEspacio()  
	}
	
	method haySuficienteEspacio(){
		return true
	}
}

class GabineteMagico inherits Mueble{
	
}

class Armario inherits Mueble{
	
}
