import wollok.game.*
import nivel.*

class ObjetosAgarrables {

	var property image
	const property transpasable = true
	
	method ubicarAleatoriamente(visual) {
		var posicion = new Position(x = 1.randomUpTo(nivel.anchoRecuadro() - 1), y = 1.randomUpTo(nivel.altoRecuadro() - 1))
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion) else self.ubicarAleatoriamente(visual)
	}

}

class Comida inherits ObjetosAgarrables {

	var property aumenta

	method colisionadoPor(visual, personaje) {
		self.ubicarAleatoriamente(visual) // cuando el personaje choque con la comida, la comida se ubica aleatoriamente
		personaje.aumentasalud(aumenta) // tiene que haber un metodo en el personaje que permita que aumente la salud
		game.say(self, "Sume " + aumenta + " de Salud!!") // cuando agarra una comida dice cuanto aumento su salud 
	}

}

object permiso inherits ObjetosAgarrables (image = "permiso.png") {

	method colisionadoPor(personaje) {
		personaje.tienePermiso(true)
		game.say(personaje, "Tengo el Permiso")
	}

}

const Hamburguesa = new Comida(image = "hamburguesa.png", aumenta = 15)

const Pizza = new Comida(image = "pizza.png", aumenta = 20)

const Agua = new Comida(image = "agua.png", aumenta = 35)

const Lavandina = new Comida(image = "lavandina.png", aumenta = 60)

const Cocacola = new Comida(image = "coca.png", aumenta = 5)

