import wollok.game.*
import nivel.*
import superObjetos.*


class Personaje{
	method tienepermiso()= true
}

class Comida inherits SuperObjeto {

	var property aumenta

	method colisionadoPor(personaje) {
		personaje.aumentasalud(aumenta) // tiene que haber un metodo en el personaje que permita que aumente la salud
		game.say(self, "Sume " + aumenta + " de Salud!!") // cuando agarra una comida dice cuanto aumento su salud
		game.removeVisual(self) 
	}

}

object permiso inherits SuperObjeto (image = "permiso.png") {

	method colisionadoPor(personaje) {
		personaje.tienePermiso(true)
		game.say(personaje, "Tengo el Permiso")
		game.onTick(6000, "VencePermiso", personaje.tienePermiso(false))
		game.removeVisual(self)
	}

}

object hamburguesa inherits Comida (image= "hamburguesa.png", aumenta = 15){}
object pizza inherits Comida (image= "pizza.png", aumenta = 20){}
object agua inherits Comida (image= "agua.png", aumenta = 35){}
object lavandina inherits Comida (image= "lavandina.png", aumenta = 60){}
object cocacola inherits Comida (image= "coca.png", aumenta = 5){}



