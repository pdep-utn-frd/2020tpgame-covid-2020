import wollok.game.*
import direcciones.*
import personaje.*

object entrenador {

	method image() = 'assets/personaje/entrenador.png'

	method position() = game.at(24, 12)

	method manejadorDialogos() {
		game.onTick(2000, 'sayPuntosEntrenador', { game.say(self, 'Tenes ' + personaje.nivelPuntaje() + '!')})
		game.onTick(3500, 'primerSayEntrenador', { game.say(self, 'Corré más rápido!')})
		game.onTick(5300, 'segundoSayEntrenador', { game.say(self, 'Vas bien! Musculá!')})
	}

	method puntajeFinal() {
		game.say(self, 'Puntaje:  ' + personaje.nivelPuntaje())
	}

	method colisionadoPor(algo) {
		game.say(self, 'No me choques!')
	}

}

