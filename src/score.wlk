import wollok.game.*
import fondo.*
import factories.*
import personaje.*

object score {
	var vida

	method dibujarInicial() {
		vida = new Visual(image = "assets/score/VIDA_0_relleno.png", position = game.at(1, 16))
		game.addVisual(vida)
	}

	method actualizarScoreTotal() {
		if (personaje.porcentajeInfeccion() == 0) {
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/VIDA_0_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} else if (personaje.porcentajeInfeccion() == 25) {
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/VIDA_1_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} else if (personaje.porcentajeInfeccion() == 50) {
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/VIDA_2_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} else if (personaje.porcentajeInfeccion() == 75) {
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/VIDA_3_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} 
	}

}

