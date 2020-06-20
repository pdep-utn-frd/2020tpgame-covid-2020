import wollok.game.*

object arriba 
{
	method posicion(posicion) = posicion.up(1)
	
	method posicion(posicion,n) = posicion.up(n)
}

object abajo 
{
	method posicion(posicion) = posicion.down(1)
	
	method posicion(posicion,n) = posicion.down(n)
}

object izquierda
{
	method posicion(posicion) = posicion.left(1)
	
	method posicion(posicion,n) = posicion.left(n)
}

object derecha
{
	method posicion(posicion) = posicion.right(1)
	
	method posicion(posicion,n) = posicion.right(n)
}
