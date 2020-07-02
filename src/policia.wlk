import entidadMovil.*
import direcciones.*
import wollok.game.*
import nivel.*

class Policia inherits EntidadMovil {

	var property velocidad = 300.randomUpTo(700).roundUp()

	method image() = "assets/personaje/policia1.png"
	
	override method colisionadoPor(personaje){
		if(!personaje.permiso()){
			nivel.gameOver()
		}else{
			game.say(self, "Muy bien! Siga circulando.")
		}
	}		

	method seguir() {
		const posPersonaje = nivel.buscarPersonaje()
		var dir = self.calcularMejorDireccion(self.position(), posPersonaje)
		self.moverHaciaSiEsPosible(dir)
	}

	method calcularMejorDireccion(posicionPolicia, posicionPersonaje) {
		var difX = self.calcularDiferencia(posicionPersonaje.x(), posicionPolicia.x())
		var difY = self.calcularDiferencia(posicionPersonaje.y(), posicionPolicia.y())
		if (difX.abs() >= difY.abs()) {
			return self.moverLateralmente(difX, difY)
		} else {
			return self.moverVerticalmente(difX, difY)
		}
		return centro
	}

	method moverLateralmente(difX, difY) {
		if (difX != 0) {
			if (difX > 0) {
				return derecha
			} else if (difX < 0) {
				return izquierda
			}
		}
		return centro
	}

	method moverVerticalmente(difX, difY) {
		if (difY != 0) {
			if (difY > 0) {
				return arriba
			} else if (difY < 0) {
				return abajo
			}
		}
		return centro
	}

	method calcularDiferencia(pos1, pos2) {
		return pos1 - pos2
	}

}

