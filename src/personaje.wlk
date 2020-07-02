import wollok.game.*
import direcciones.*
import nivel.*

object personaje {
	
	var property image = "assets/personaje/personaje1.png"
	var property position = game.at(5, 5)
	var property porcentajeInfeccion = 0
	var property nivelPuntaje = 0
	var property permiso = true
	var property tiempoPermiso = 5000
	var property ultimaDireccion = centro
	
	method recibirInfeccion(){
		porcentajeInfeccion += 25
		if (porcentajeInfeccion >= 100){
			nivel.gameOver()
		}
	}
	
	method aumentarPuntaje(puntaje){
		nivelPuntaje = nivelPuntaje + puntaje
	}
	
	method disminuirPorcentaje(porcentaje){
		porcentajeInfeccion = 0.max(porcentajeInfeccion - porcentaje)
	}
		
}

