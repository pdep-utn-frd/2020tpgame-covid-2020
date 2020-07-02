import wollok.game.*

class Visual {

	var property image
	var property position = game.origin()

	method colisionadoPor(personaje){
		
	}

}

const inicioDelJuego = new Visual(image = "assets/escenario/fondo2.png", position = game.at(0, 0))

const finDelJuegoPolicia = new Visual(image = "assets/escenario/gameOverPolicia.png",position = game.at(0, 0))

const finDelJuegoInfectado = new Visual(image = "assets/escenario/gameOverInfectado.png",position = game.at(0, 0))

const pasto1 = new Visual(image = "assets/escenario/pasto1.png", position = game.at(1, 1))

const pasto2 = new Visual(image = "assets/escenario/pasto2.png", position = game.at(1, 1))
