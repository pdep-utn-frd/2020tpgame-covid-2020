import wollok.game.*

import fondo.*
import factories.*
import personaje.*
import score.*

object nivel {
	const anchoTotal = 31
	const altoTotal = 17
	const anchoRecuadro = 30
	const altoRecuadro = 16
	method inicio(){
		game.clear()
		game.title("COVID RUNNER 2020")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.ground("assets/escenario/pasto1.png")
		game.addVisual(inicioDelJuego)
		keyboard.space().onPressDo{self.configurate()}
	}	
	method configurate() {
		game.clear()

		game.addVisual(personaje)
		movimiento.configurarFlechas(personaje)

		new MarcoSolido(
			verticeInicial= new Position(x=0,y=0),
			verticeFinal = new Position(x=anchoRecuadro, y=altoRecuadro),
			image = "assets/escenario/arbusto.png").dibujar()	        
//			
//		game.addVisual(espatula)
//		game.addVisual(plankton)
//	
//		const tomate = new Tomate()
//
//		[tomate,lechuga,pan,paty,condimentos].forEach { ing =>  
//			game.addVisual(ing)
//			self.ubicarAleatoriamente(ing) 
//		}
		score.dibujar()
//		
//	
		//Colisiones	
		game.whenCollideDo(personaje, {elemento => elemento.colisionadoPor(personaje) win.actualizarScoreTotal()})
		
		
        
        //Teclado	
//			keyboard.w().onPressDo{ bobEsponja.canta()}
//			keyboard.m().onPressDo{ bobEsponja.cuantasMonedas()}
//
//			keyboard.e().onPressDo{ win.actualizarScoreTotal()}
			
			
	}
		
	method ubicarAleatoriamente(visual){
		var posicion = new Position (x=1.randomUpTo(anchoRecuadro),y=1.randomUpTo(altoRecuadro))
		if(game.getObjectsIn(posicion).isEmpty())
			visual.position(posicion)
		else
			self.ubicarAleatoriamente(visual)			
		
	}
}
