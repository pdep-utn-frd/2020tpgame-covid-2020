import wollok.game.*
import personaje.*

object juego {
	method inicio() {
		game.title("COVID RUNNER 2020")
		game.width(31)
		game.height(17)
		game.ground("assets/escenario/pasto1.png")
		
		const personaje = new Personaje()
		
		game.addVisualCharacter(personaje)
		game.start()
	}
}