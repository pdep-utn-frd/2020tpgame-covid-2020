import wollok.game.*
import nivel.*

class SuperObjeto {


	var property image
	var property position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 1).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 1).roundUp())

	

}