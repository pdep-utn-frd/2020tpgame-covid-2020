import wollok.game.*
import fondo.*
import factories.*

object score{
	const property porcentajeInfectado = 0
	var vida
	method dibujarInicial(){
		vida = new Visual(
		image =  "assets/score/VIDA_0.png",
		position = game.at(2,14))
		game.addVisual(vida)
	}
	
	method actualizarScoreTotal(){
		if(porcentajeInfectado == 0){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_0.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
		else if(porcentajeInfectado <= 20){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_2.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
		else if(porcentajeInfectado <= 40){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_4.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
		else if(porcentajeInfectado <= 60){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_6.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
		else if(porcentajeInfectado <= 80){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_HIT_old.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
		else if(porcentajeInfectado <= 100){
			game.removeVisual(vida)
			vida = new Visual(
			image =  "assets/score/VIDA_HIT.png",
			position = game.at(3,15))
			game.addVisual(vida)
		}
	}
}