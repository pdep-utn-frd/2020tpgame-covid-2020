import wollok.game.*
import direcciones.*
import score.*
import nivel.*

object personaje {

	var property image = "assets/personaje/personaje1.png"
	var property position = game.at(5, 5)
	var property porcentajeInfeccion = 0
	var property nivelPuntaje = 0
	var property permiso
	var property tiempoPermiso = 5000
	var property ultimaDireccion = centro

	method arrancaPersonaje() {
		game.say(self, "Tengo el Permiso!")
		self.permiso(true)
		game.schedule(5000, { =>
			self.permiso(false)
			game.say(self, "Debo renovar mi permiso!")
		})
	}

	method recibirInfeccion() {
		porcentajeInfeccion += 25
		if (porcentajeInfeccion >= 100) {
			nivel.gameOver()
		}
	}

	method aumentarPuntaje(puntaje) {
		nivelPuntaje += puntaje
	}

	method disminuirPorcentaje(porcentaje) {
		porcentajeInfeccion = 0.max(porcentajeInfeccion - porcentaje)
	}

	method agarroPermiso() {
		if (permiso) {
			game.say(self, "Mi permiso anterior todavia sirve!")
		} else {
			game.say(self, "Tengo el Permiso!")
			permiso = true
			game.schedule(5000, { =>
				self.permiso(false)
				game.say(self, "Debo renovar mi permiso!")
			})
		}
	}

}

