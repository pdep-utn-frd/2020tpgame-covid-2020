import wollok.game.*
import nivel.*
import superObjeto.*
import direcciones.*
import factories.*

class ObjetoNoAgarrable inherits SuperObjeto {

	method colisionadoPor(algo) {
		movimiento.mover(algo.ultimaDireccion().opuesta(), algo)
	}

}

class Arbol1 inherits ObjetoNoAgarrable{
	override method image() = "assets/escenario/arbol1-pixel.png"
}

class Arbol2 inherits ObjetoNoAgarrable{
	override method image() = "assets/escenario/arbol2-pixel.png"
}

class Piedra inherits ObjetoNoAgarrable{
	override method image() = "assets/escenario/piedra1-pixel.png"
}

class Arbusto inherits ObjetoNoAgarrable{
	override method image() = "assets/escenario/arbusto.png"
	override method position(posicion) { position = posicion }
}

