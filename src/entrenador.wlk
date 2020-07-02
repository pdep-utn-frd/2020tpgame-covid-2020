import wollok.game.*
import direcciones.*
import personaje.*

object entrenador {

	var property image = "assets/personaje/personaje1.png"
	var property position = game.at(24, 12)
	
	method manejadorDialogos(){
		game.onTick(7000, 'sayEntrenador', { 
			game.say(self, 'Vas bien! Musculá!')
		})
		game.onTick(3000, 'sayEntrenadoraa', {
			game.say(self, 'Corré más rápido!')
		})
//		game.onTick(5000, 'sayPuntosEntrenador', {
//			game.say(self, 'Tenes ' + personaje.nivelPuntaje() + '!')
//		})
	}
	
	method colisionadoPor(personaje) {
		game.say(self, 'No me choques!')
	}
}
