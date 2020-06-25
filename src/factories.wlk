import wollok.game.*
import fondo.*
import direcciones.*
import objetoNoAgarrable.*

class MarcoSolido {

	const verticeInicial
	const verticeFinal

	method colocarArbustos() {
		self.colocarLineaVertical(verticeInicial.x(), verticeInicial.y(), verticeFinal.y())
		self.colocarLineaVertical(verticeFinal.x(), verticeInicial.y(), verticeFinal.y())
		self.colocarLineaHorizontal(verticeInicial.y(), verticeInicial.x() + 1, verticeFinal.x() - 1)
		self.colocarLineaHorizontal(verticeFinal.y(), verticeInicial.x() + 1, verticeFinal.x() - 1)
	}

	method colocarElemento(columna, fila) {
		const elemento = new Arbusto()
		elemento.position(new Position(x = columna, y = fila))
		game.addVisual(elemento)
	}

	method colocarLineaVertical(columna, filaDesde, filaHasta) {
		(filaDesde .. filaHasta).forEach{ fila => self.colocarElemento(columna, fila)}
	}

	method colocarLineaHorizontal(fila, columnaDesde, columnaHasta) {
		(columnaDesde .. columnaHasta).forEach{ columna => self.colocarElemento(columna, fila)}
	}

}

object movimiento {

	method configurarFlechas(personaje) {
		keyboard.up().onPressDo{ 
			self.mover(arriba, personaje)
			personaje.ultimaDireccion(arriba)
		}
		keyboard.down().onPressDo{ 
			self.mover(abajo, personaje)
			personaje.ultimaDireccion(abajo)
		}
		keyboard.left().onPressDo{ 
			self.mover(izquierda, personaje)
			personaje.ultimaDireccion(izquierda)
		}
		keyboard.right().onPressDo{ 
			self.mover(derecha, personaje)
			personaje.ultimaDireccion(derecha)
		}
	}

	method mover(direccion, elemento) {
		elemento.position(direccion.futuraPosicion(elemento.position()))
	}

}

