import wollok.game.*

//object personaje{
//	var position = game.origin()
//	
//	var infectado = 0
//	
//	method image() = "assets/personaje/personaje1.png"
//	 
//	method position() = position
//	
//	method position(nuevaPos){
//		position = nuevaPos
//	}
//}

class Personaje{
	var nivelInfectado = 0
	
	var position = game.origin()
	
	method image() = "assets/personaje/personaje1.png"
	 
	method position() = position
	
	method position(nuevaPos){
		console.println(nuevaPos)
		position = nuevaPos
	}
}