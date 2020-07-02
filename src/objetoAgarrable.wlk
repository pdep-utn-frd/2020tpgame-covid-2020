import wollok.game.*
import nivel.*
import superObjeto.*
import personaje.*


class Personaje{
	method tienepermiso()= true
}

class Lavandina inherits SuperObjeto{
	var property porcentaje
	
	constructor(pPorcentaje, pImagen){
		porcentaje = pPorcentaje
		image = pImagen
	}
	
	method colisionadoPor(pPersonaje){
		personaje.disminuirPorcentaje(porcentaje)
		self.cambiarPosicion()
	}
}
class Comida inherits SuperObjeto {

	var property puntaje
	
	constructor(pPuntaje, pImagen){
		puntaje = pPuntaje
		image = pImagen
	}

	method colisionadoPor(personaje) {
		personaje.aumentarPuntaje(puntaje) 
		self.cambiarPosicion()
		
	}
	
}

class Permiso inherits SuperObjeto {
	
	override method image() = "assets/objetos/permiso.png"
	
	method colisionadoPor(personaje) {
		personaje.agarroPermiso()
		self.cambiarPosicion()
	}

}