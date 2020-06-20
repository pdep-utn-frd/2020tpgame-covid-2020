import entidadesMoviles.*
import direcciones.*
import personaje.*
import wollok.game.*

class Policia inherits EntidadesMoviles
{
	//const property image = "assets/personajes/policia.png"
	
	var property position = new Position()
	
	var property tiempoDeVida = new Tiempo()
	
	method seguir(){
		
	}
}


//Esto tiene que haber un manejador que lo disminuya cada 1 segundo en el juego.
class Tiempo
{
	var duracion = 60
	
	method disminuir()
	{	
		duracion -= 1
	}
}
