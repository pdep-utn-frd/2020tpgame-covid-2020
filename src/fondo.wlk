import wollok.game.*


class Visual {
	var property image
	var property position = game.origin()
}

const inicioDelJuego = new Visual(
	image =  "assets/escenario/fondo2.png",
	position = game.at(0,0)
)

const pasto1 = new Visual(
	image =  "assets/escenario/pasto1.png",
	position = game.at(1,1)
)
const pasto2 = new Visual(
	image =  "assets/escenario/pasto2.png",
	position = game.at(1,1)
)
const personaje = new Visual(
	image =  "assets/personaje/personaje1.png",
	position = game.at(5,5)
)

object win{
	
	method actualizarScoreTotal(){
//		if (plankton.score()>= 3)
//			nivel.gameOver()
//		else{ 
//			if(kangreburger.score() >= 2)
//				nivel.hasGanado()
//			else 
//				score.dibujar()
//		}
	}
}