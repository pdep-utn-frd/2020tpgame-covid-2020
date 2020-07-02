import entidadMovil.*
import direcciones.*
import factories.*
import wollok.game.*

class Infectado inherits EntidadMovil {

	var property direccion = [ arriba, abajo, izquierda, derecha ].anyOne()
	var property velocidad = 100.randomUpTo(300).roundUp()
	

	method comenzarMovimientoPeriodico(){
		game.onTick(self.velocidad(), "MovimientoInfectado", {=> self.correr()})
	}

	method image() = "assets/personaje/Infectado.png"

	override method colisionadoPor(personaje){
		personaje.recibirInfeccion()
	}

	method correr() {
		const ultimaPos = self.position()
		self.moverHaciaSiEsPosible(direccion)
		if (ultimaPos.x() == self.position().x() and ultimaPos.y() == self.position().y()) {
			direccion = direccion.opuesta()
		}
	}

}

