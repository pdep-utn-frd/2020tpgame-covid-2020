import wollok.game.*
import fondo.*
import factories.*
import personaje.*

//TODO la barra de vida es una entidad más, la cual se puede chocar, eso da error, ya que no tiene el método "colisionadoPor(personaje)"
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
			vida = new Visual(image = "assets/score/VIDA_4_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} else if (personaje.porcentajeInfeccion() == 75) {
			game.removeVisual(vida)
			vida = new Visual(image = "assets/score/VIDA_7_relleno.png", position = game.at(1, 16))
			game.addVisual(vida)
		} 
	}

}

