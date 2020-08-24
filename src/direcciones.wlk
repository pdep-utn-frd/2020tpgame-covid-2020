import wollok.game.*
import nivel.*

object arriba {
	override method toString() = "Arriba"
	method opuesta() {
		return abajo
	}
	method futuraPosicion(posicion) = posicion.up(1)
	method futuraPosicion(posicion, n) = posicion.up(n)
}

object abajo {
	method opuesta() {
		return arriba
	}
	method futuraPosicion(posicion) = posicion.down(1)
	method futuraPosicion(posicion, n) = posicion.down(n)
}

object izquierda {
	method opuesta() {
		return derecha
	}
	method futuraPosicion(posicion) = posicion.left(1)
	method futuraPosicion(posicion, n) = posicion.left(n)
}

object derecha {
	method opuesta() {
		return izquierda
	}
	method futuraPosicion(posicion) = posicion.right(1)
	method futuraPosicion(posicion, n) = posicion.right(n)
}

object centro {
	method futuraPosicion(posicion) = posicion
	method futuraPosicion(posicion, n) = posicion
}

object checker {
	method estaVacia(posicion) {
		return game.getObjectsIn(posicion) == []
	}
	method tieneObjetoTranspasable(posicion) {
		return game.getObjectsIn(posicion).any({ objeto => objeto.transpasable() })
	}
	method estaPersonajeEn(posicion) {
		return posicion == nivel.buscarPersonaje()
	}
}

