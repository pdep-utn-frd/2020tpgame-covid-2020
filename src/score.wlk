import wollok.game.*
import fondo.*
import factories.*
import personaje.*

object score {

	method image() = "assets/score/" + personaje.porcentajeInfeccion().toString() + ".png"

	method position() = game.at(1, 16)

}

