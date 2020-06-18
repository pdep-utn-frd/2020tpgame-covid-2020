import wollok.game.*

object personaje{
	var position = game.origin()
	
	method position() = position
	
	method position(nuevaPos){
		position = nuevaPos
	}
}
