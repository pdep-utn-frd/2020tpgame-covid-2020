import wollok.game.*
import nivel.*
import superObjeto.*
import direcciones.*
import factories.*

class ObjetoNoAgarrable inherits SuperObjeto {

	method colisionadoPor(personaje) {
		//TODO ESTO DE REBOTAR NO ESTÁ BUENO, a veces se rompe y el personaje sale volando pero no se me ocurre otra manera de manejarlo usando colisiones.
		movimiento.mover(personaje.ultimaDireccion().opuesta(), personaje)
	}

}

//TODO hay que revisar el tamaño de las imágenes y donde están colocadas, la colisión no se realiza correctamente.

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

