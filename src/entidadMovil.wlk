import wollok.game.*
import direcciones.*
import nivel.*

class EntidadMovil {

	var property position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 1).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 1).roundUp())
	const property transpasable = false

	method moverHaciaSiEsPosible(direccion) {
		if (self.noHayNadieEnDireccion(direccion)) {
			self.position(direccion.futuraPosicion(self.position()))
		}
	}

	method noHayNadieEnDireccion(direccion) {
		return checker.estaVacia(direccion.futuraPosicion(self.position()))
	}

}

