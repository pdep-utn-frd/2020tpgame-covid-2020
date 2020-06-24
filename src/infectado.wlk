import entidadMovil.*
import direcciones.*

class Infectado inherits EntidadMovil {

	var property direccion = [ arriba, abajo, izquierda, derecha ].anyOne()
	var property velocidad = 100.randomUpTo(300).roundUp()

	method image() = "assets/personaje/Infectado.png"

	method correr() {
		const ultimaPos = self.position()
		self.moverHaciaSiEsPosible(direccion)
		if (ultimaPos.x() == self.position().x() and ultimaPos.y() == self.position().y()) {
			direccion = direccion.opuesta()
		}
	}

}

