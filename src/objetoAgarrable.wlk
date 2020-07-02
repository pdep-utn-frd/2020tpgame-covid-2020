import wollok.game.*
import nivel.*
import superObjeto.*
import personaje.*


class Personaje{
	method tienepermiso()= true
}

class Lavandina inherits SuperObjeto{
	var property porcentaje
	
	method colisionadoPor(Personaje){
		personaje.disminuirPorcentaje(porcentaje)
		game.removeVisual(self)
		
	// falta hacer que cambie de lugar??????	
	}
}
class Comida inherits SuperObjeto {

	var property puntaje

	method colisionadoPor(Personaje) {
		personaje.aumentarPuntaje(puntaje) 
		game.removeVisual(self)
		
	}
	
}


//Este nombre sigue sin convencerme.
class Permiso inherits SuperObjeto {
	
	override method image() = "assets/objetos/permiso.png"
	
	method colisionadoPor(personaje) {
		personaje.agarroPermiso()
		self.cambiarPosicion()
	}

}


object hamburguesa{}

object pizza {}

object  agua {}

object lavandina{}

object cocacola{}


