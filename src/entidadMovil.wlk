import wollok.game.*
import direcciones.*
import nivel.*

class EntidadMovil {

	var property position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 2).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 2).roundUp())

	method moverHaciaSiEsPosible(direccion) {
		if (self.noHayNadieEnDireccion(direccion) or checker.estaPersonajeEn(direccion.futuraPosicion(self.position()))) {
			self.position(direccion.futuraPosicion(self.position()))
		}
	}

	method noHayNadieEnDireccion(direccion) {
		return checker.estaVacia(direccion.futuraPosicion(self.position()))
	}

	method colisionadoPor(algo)

}

