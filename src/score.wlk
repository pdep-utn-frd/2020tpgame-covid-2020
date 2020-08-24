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

	method actualizarScoreTotal(pTerminoElJuego) {
		if(!pTerminoElJuego){
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/" + personaje.porcentajeInfeccion().toString() + ".png", position = game.at(1, 16))
			game.addVisual(vida)
		}
		
	}

}

