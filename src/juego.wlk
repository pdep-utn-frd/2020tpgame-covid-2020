import wollok.game.*
import personajes.*

object juego {
	method inicio() {
		game.title("COVID RUNNER 2020")
		game.width(31)
		game.height(17)
		game.addVisualCharacter(personaje)
		game.start()
	}
}


