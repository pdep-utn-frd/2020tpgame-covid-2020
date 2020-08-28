import wollok.game.*
import fondo.*
import factories.*
import personaje.*

}
object  score {
	
	method dibujarInicial() {
		game.addVisual(self)
	}
     method imagen() {
     	if(!pTerminoElJuego){
	
      	return "assets/score/" + personaje.porcentajeInfeccion().toString() + ".png"
	}
	
	method position() = game.at(1, 16)

}
