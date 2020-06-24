import wollok.game.*
import fondo.*
import direcciones.*

class MarcoSolido {

	const verticeInicial
	const verticeFinal
	const image

	method dibujar() {
		self.dibujarLineaVertical(verticeInicial.x(), verticeInicial.y(), verticeFinal.y())
		self.dibujarLineaVertical(verticeFinal.x(), verticeInicial.y(), verticeFinal.y())
		self.dibujarLineaHorizontal(verticeInicial.y(), verticeInicial.x() + 1, verticeFinal.x() - 1)
		self.dibujarLineaHorizontal(verticeFinal.y(), verticeInicial.x() + 1, verticeFinal.x() - 1)
	}

	method dibujarElemento(columna, fila) {
		var elemento = new VisualSolido(image = image, position = new Position(x = columna, y = fila))
		game.addVisual(elemento)
	}

	method dibujarLineaVertical(columna, filaDesde, filaHasta) {
		(filaDesde .. filaHasta).forEach{ fila => self.dibujarElemento(columna, fila)}
	}

	method dibujarLineaHorizontal(fila, columnaDesde, columnaHasta) {
		(columnaDesde .. columnaHasta).forEach{ columna => self.dibujarElemento(columna, fila)}
	}

}

object movimiento {

	method configurarFlechas(visual) {
		keyboard.up().onPressDo{ self.mover(arriba, visual)}
		keyboard.down().onPressDo{ self.mover(abajo, visual)}
		keyboard.left().onPressDo{ self.mover(izquierda, visual)}
		keyboard.right().onPressDo{ self.mover(derecha, visual)}
	}

	method mover(direccion, elemento) {
		const siguientePosicion = direccion.futuraPosicion(elemento.position())
		// Ahora mismo no diferencia entre visuales solidos y los agarrables. Esto es importante para poder agarrar cosas, sino nunca vas a llegar a donde esten los agarrables.
		if (checker.estaVacia(siguientePosicion) or checker.tieneObjetoTranspasable(siguientePosicion)) {
			elemento.position(direccion.futuraPosicion(elemento.position()))
		} else {
			elemento.position(centro.futuraPosicion(elemento.position()))
		}
	}

}

class VisualSolido inherits Visual {
	
	const property transpasable = false
	
	method colisionadoPor(elemento) {
		movimiento.mover(centro, elemento)
	}

}

