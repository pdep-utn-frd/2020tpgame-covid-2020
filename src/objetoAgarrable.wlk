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



object permiso inherits SuperObjeto (image = "assets/objetos/permiso.png") {

	method colisionadoPor(Personaje) {
		personaje.permiso(true)
		game.say(personaje, "Tengo el Permiso")
		game.removeVisual(self)
	}

}


object hamburguesa{}

object pizza {}

object  agua {}

object lavandina{}

object cocacola{}


