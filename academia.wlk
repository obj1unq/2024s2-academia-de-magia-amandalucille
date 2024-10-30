class Academia {
	const muebles = #{}
	
	method estaGuardada(cosa) = muebles.any({ m => m.tiene(cosa) })
	
	method dondeEstaGuardada(cosa) = muebles.find({ m => m.tiene(cosa) })
	
	method puedeGuardar(cosa) = (!self.estaGuardada(cosa)) && self.hayAlgunMuebleParaGuardar(cosa)
	
	method hayAlgunMuebleParaGuardar(cosa) = muebles.any({ m => m.puedeGuardarse(cosa) })
	
	method mueblesDisponibles(cosa) = muebles.filter({ m => m.puedeGuardarse(cosa)})
	
	method guardar(cosa) {
		self.validarGuardar(cosa)
		self.guardarEnMuebleDisponible(cosa)
	}
	
	method validarGuardar(cosa) {
		if (not self.puedeGuardar(cosa)){
			self.error("No se puede guardar" + cosa)
		}
	}
	
	method guardarEnMuebleDisponible(cosa) {
		self.mueblesDisponibles(cosa).anyOne().agregar(cosa)
	}
	
	method menosUtiles() = muebles.map({ m => m.cosaMenosUtil() })
	
	method marcaMenosUtil() = self.menosUtiles().min({ c => c.utilidad() }).marca()
	
	method removerMenosUtilesNoMagicas() {
		self.menosUtiles().filter({ c => not c.esMagica() }).forEach(
			{ c => self.remover(c) }
		)
	}
	
	method remover(cosa) {
		self.dondeEstaGuardada(cosa).remover(cosa)
	}
}

class Mueble {
	const cosas = #{}
	
	method tiene(cosa) = cosas.contains(cosa)
	
	method puedeGuardarse(cosa)
	
	method agregar(cosa) {
		cosas.add(cosa)
	}
	
	method remover(cosa) {
		cosas.remove(cosa)
	}
	
	method utilidad() = self.utilidadDeLasCosas() / self.precio()
	
	method utilidadDeLasCosas() = cosas.sum({ c => c.utilidad() })
	
	method precio()
	
	method cosaMenosUtil() = cosas.min({ c => c.utilidad() })
}

class Baul inherits Mueble {
	const volumenMaximo
	
	override method puedeGuardarse(cosa){
		return (self.volumenTotal() + cosa.volumen()) <= volumenMaximo
	} 
	method volumenTotal() = cosas.sum({ c => c.volumen() })
	
	override method precio() = volumenMaximo + 2
	
	override method utilidad() = super() + self.extras()
	
	method extras() = if (self.sonTodasReliquias()) 2 else 0
	
	method sonTodasReliquias() = cosas.all({ c => c.esReliquia() })
}

class BaulMagico inherits Baul {
	override method utilidad() = super() + self.cantidadDeCosasMagicas()
	
	method cantidadDeCosasMagicas() = cosas.count({ c => c.esMagica() })
	
	override method precio() = super() * 2
}

class GabineteMagico inherits Mueble {
	const precio
	
	override method puedeGuardarse(cosa) = cosa.esMagica()
	
	override method precio() = precio
}

class Armario inherits Mueble {
	var property cantidadMaxima
	
	override method puedeGuardarse(cosa) = cosas.size() < cantidadMaxima
	
	override method precio() = 5 * cantidadMaxima
}

class Cosa {
	const marca
	const property volumen
	const property esMagica
	const property esReliquia
	
	method utilidad() = ((volumen + self.valorDeMagia()) + self.valorDeReliquia()) + marca.valor(
		self
	)
	
	method valorDeMagia() = if (esMagica) 3 else 0
	
	method valorDeReliquia() = if (esReliquia) 5 else 0
}

object cuchuflito {
	method valor(cosa) = 0
}

object acme {
	method valor(cosa) = cosa.volumen() / 2
}

object fenix {
	method valor(cosa) = if (cosa.esReliquia()) 3 else 0
}