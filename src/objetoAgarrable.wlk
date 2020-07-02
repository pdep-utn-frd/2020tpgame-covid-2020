import wollok.game.*
import nivel.*
import superObjeto.*


class Personaje{
	method tienepermiso()= true
}

class Comida inherits SuperObjeto {
	//TODO comida solo debe afectar la puntación.
	var property porcentaje

	method colisionadoPor(personaje) {
		personaje.disminuirPorcentaje(porcentaje) 
		game.say(self, "Estoy " + porcentaje + " menos enfermo.")
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

class Hamburguesa inherits Comida {
	override method image() = "assets/objetos/hamburguesa.png"
	//TODO es probable que esto esté mal y sea por eso que la comida tira error, pero son las 4:40 de la mañana y me cansé D:
	override method porcentaje() = 15
}
	 
class Pizza inherits Comida {
	override method image() = "assets/objetos/pizza.png"
	override method porcentaje() = 20
}
class Agua inherits Comida{
	override method image() = "assets/objetos/agua.png"
	override method porcentaje() = 35
}
class Lavandina inherits Comida{
	override method image() = "assets/objetos/lavandina1.png"
	override method porcentaje() = 60
}

class Cocacola inherits Comida{
	override method image() = "assets/objetos/coca.png"
	override method porcentaje() = 5
}



