import wollok.game.*
import fondo.*
import factories.*
import score.*
import policia.*
import infectado.*
import personaje.*
import entrenador.*
import objetoAgarrable.*
import objetoNoAgarrable.*

object nivel {

	const property anchoTotal = 31
	const property altoTotal = 17
	const property anchoRecuadro = anchoTotal - 1
	const property altoRecuadro = altoTotal - 1
	const musica = game.sound("assets/audio/juego.mp3")

	method inicio() {
		game.clear()
		game.title("COVID RUNNER 2020")
		game.width(anchoTotal)
		game.height(altoTotal)
		game.ground("assets/escenario/pasto1.png")
		game.addVisual(inicioDelJuego)
		keyboard.space().onPressDo{ self.configurate()}
	}

	method configurate() {
		game.clear()
		
		//Setup Visuals
		const policias = []
		4.times({i=>policias.add(new Policia())})
		const infectados = []
		4.times({i=>infectados.add(new Infectado())})
		
		const hamburguesa = new Comida(25, 'assets/objetos/hamburguesa.png')
		const agua = new Comida(40, 'assets/objetos/agua.png')
		const cocacola = new Comida(10, 'assets/objetos/coca.png')
		const pizza = new Comida(15, 'assets/objetos/pizza.png')
		const lavandina = new Lavandina(25, 'assets/objetos/lavandina.png')
		const pancho = new Comida(20, 'assets/objetos/pancho-pixel.png')
		
		const objetosAgarrables = [hamburguesa, agua, cocacola, pizza, lavandina, pancho, new Permiso()]
		const objetosNoAgarrables = []
		//TODO esto debería de hacerse de una manera coherente, ahora es totalmente random.
		2.times({i=>objetosNoAgarrables.add(new Arbol1())})
		2.times({i=>objetosNoAgarrables.add(new Arbol2())})
		2.times({i=>objetosNoAgarrables.add(new Piedra())})
		
		// Visuals
		game.addVisual(personaje)
		game.addVisual(entrenador)
		entrenador.manejadorDialogos()
		personaje.arrancaPersonaje()
		policias.forEach({ policia => game.addVisual(policia)})
		infectados.forEach({ infectado => game.addVisual(infectado)})
		objetosAgarrables.forEach({objeto => game.addVisual(objeto)})
		objetosNoAgarrables.forEach({objeto => game.addVisual(objeto)})
		
		// Movimientos de la "IA" y eventos temporales (Esto provoca un progresivo empeoramiento de la performance en wollok game.)
		policias.forEach({ policia => handlerTemporal.moverPolicia(policia)})
		infectados.forEach({ infectado => handlerTemporal.moverInfectado(infectado)})

		movimiento.configurarFlechas(personaje)
		new MarcoSolido(verticeInicial= new Position(x=0,y=0),verticeFinal = new Position(x=anchoRecuadro, y=altoRecuadro)).colocarArbustos()
		score.dibujarInicial()
		
		// Colisiones	
		game.whenCollideDo(personaje, { elemento =>		
			elemento.colisionadoPor(personaje)
			score.actualizarScoreTotal()
		})
		// Musica
		musica.play()
	}


	//Este metodo no se usa. (todavía?)
	method ubicarAleatoriamente(visual) {
		var posicion = new Position(x = 1.randomUpTo(anchoRecuadro), y = 1.randomUpTo(altoRecuadro))
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion) else self.ubicarAleatoriamente(visual)
	}

	method buscarPersonaje() {
		return personaje.position()
	}

	method gameOver() {
		game.clear()
		musica.stop()
		game.addVisual(finDelJuego)
		keyboard.space().onPressDo{ 
			game.stop()
		}
	}

}

object handlerTemporal {
	method moverPolicia(policia) {game.onTick(policia.velocidad(), "MovimientoPolicia", {=> policia.seguir()})}

	method moverInfectado(infectado) {game.onTick(infectado.velocidad(), "MovimientoInfectado", {=> infectado.correr()})}
}

