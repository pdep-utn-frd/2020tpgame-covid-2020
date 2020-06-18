import wollok.game.*

object personaje{
	var position = game.origin()
	
	method image() = "assets/personaje/personaje1.png"
	 
	method position() = position
	
	method position(nuevaPos){
		position = nuevaPos
	}
}
