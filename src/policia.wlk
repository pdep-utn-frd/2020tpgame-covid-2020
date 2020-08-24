import entidadMovil.*
import direcciones.*
import wollok.game.*
import nivel.*

class Policia inherits EntidadMovil {

	var property velocidad = 300.randomUpTo(700).roundUp()
	
	method comenzarMovimientoPeriodico(){
		game.onTick(self.velocidad(), "MovimientoPolicia", {=> self.seguir()})
	}

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
			return self.moverLateralmente(difX)
		} else {
			return self.moverVerticalmente(difY)
		}
		return centro
	}


	method moverLateralmente(difX) {
		if (difX == 0) return centro
		return ( if (difX > 0) derecha else izquierda )
	}
	
	method moverVerticalmente(difY) {
		if (difY == 0) return centro
		return ( if (difY > 0) arriba else abajo)
	}


	method calcularDiferencia(pos1, pos2) {
		return pos1 - pos2
	}

}

