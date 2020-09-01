import wollok.game.*
import nivel.*

class SuperObjeto {

	var property image
	var property position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 4).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 4).roundUp())

	method cambiarPosicion() {
		position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 4).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 4).roundUp())
	}

}

