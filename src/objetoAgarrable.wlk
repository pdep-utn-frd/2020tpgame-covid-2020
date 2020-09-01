import wollok.game.*
import nivel.*
import superObjeto.*
import personaje.*

class Personaje {

	method tienepermiso() = true

}

class Lavandina inherits SuperObjeto {

	var property porcentaje

	method colisionadoPor(jugador) {
		jugador.disminuirPorcentaje(porcentaje)
		self.cambiarPosicion()
	}

}

class Comida inherits SuperObjeto {

	var property puntaje

	method colisionadoPor(jugador) {
		jugador.aumentarPuntaje(puntaje)
		self.cambiarPosicion()
	}

}

class Permiso inherits SuperObjeto {

	method image() = "assets/objetos/permiso.png"

	method colisionadoPor(jugador) {
		jugador.agarroPermiso()
		self.cambiarPosicion()
	}

}

