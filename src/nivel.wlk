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
	var terminoElJuego = false

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
		const npc = [];
		4.times({i=>npc.add(new Policia())});
		4.times({i=>npc.add(new Infectado())});
		
		const hamburguesa = new Comida(puntaje = 25,image = 'assets/objetos/hamburguesa.png')
		const agua = new Comida(puntaje = 40, image = 'assets/objetos/agua.png')
		const cocacola = new Comida(puntaje = 10, image = 'assets/objetos/coca.png')
		const pizza = new Comida(puntaje = 15, image = 'assets/objetos/pizza.png')
		const lavandina = new Lavandina(porcentaje = 25, image = 'assets/objetos/lavandina.png')
		const pancho = new Comida(puntaje = 20, image = 'assets/objetos/pancho-pixel.png')
		
		const objetos = [hamburguesa, agua, cocacola, pizza, lavandina, pancho, new Permiso()];
		2.times({i=>objetos.add(new Arbol1())})
		2.times({i=>objetos.add(new Arbol2())})
		2.times({i=>objetos.add(new Piedra())})
		
		// Visuals
		game.addVisual(personaje)
		game.addVisual(entrenador)
		entrenador.manejadorDialogos()
		personaje.arrancaPersonaje()
		npc.forEach({ policia => game.addVisual(policia)})
		objetos.forEach({objeto => game.addVisual(objeto)})
		
		// Movimientos de la "IA" y eventos temporales.
		npc.forEach({ policia => policia.comenzarMovimientoPeriodico()})
		
		movimiento.configurarFlechas(personaje)
		new MarcoSolido(verticeInicial= new Position(x=0,y=0),verticeFinal = new Position(x=anchoRecuadro, y=altoRecuadro)).colocarArbustos()
		score.dibujarInicial()
		
		// Colisiones	
		game.onCollideDo(personaje, { elemento =>		
			elemento.colisionadoPor(personaje)
			score.actualizarScoreTotal(terminoElJuego)
		})
		// Musica
		musica.play()
	}

	method buscarPersonaje() {
		return personaje.position()
	}

	method gameOver() {
		terminoElJuego = true
		game.clear()
		musica.stop()
		if (personaje.porcentajeInfeccion() >= 100){
			game.addVisual(finDelJuegoInfectado)
		}else{
			game.addVisual(finDelJuegoPolicia)
		}
		game.addVisual(entrenador)
		entrenador.puntajeFinal()
		
		keyboard.space().onPressDo{ 
			game.stop()
		}
	}

}
