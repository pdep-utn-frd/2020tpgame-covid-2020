import wollok.game.*
import direcciones.*

object personaje {

	var property image = "assets/personaje/personaje1.png"
	var property position = game.at(5, 5)
	var property porcentajeInfeccion = 0
	var property permiso = true
	var property tiempoPermiso = 5000
	var property ultimaDireccion = centro
	
	
	//TODO Esto no funciona bien, se hace infinitamente (no se por qué)
	method recibirInfeccion(){
		porcentajeInfeccion += 25
		console.println(porcentajeInfeccion)
	}
	
	method disminuirPorcentaje(porcentaje){
		porcentajeInfeccion = 0.max(porcentajeInfeccion - porcentaje)
	}
		
}

