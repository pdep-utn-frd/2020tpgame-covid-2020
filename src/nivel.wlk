import wollok.game.*
import fondo.*
import factories.*
import score.*
import policia.*
import infectado.*

object nivel {

	const property anchoTotal = 31
	const property altoTotal = 17
	const property anchoRecuadro = anchoTotal - 1
	const property altoRecuadro = altoTotal - 1

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
		const policias = [ new Policia(), new Policia(), new Policia(), new Policia() ]
		const infectados = [ new Infectado(), new Infectado(), new Infectado(), new Infectado() ]
			// Visuals
		game.addVisual(personaje)
		policias.forEach({ policia => game.addVisual(policia)})
		infectados.forEach({ infectado => game.addVisual(infectado)})
			// Movimientos de la "IA" (Esto provoca un progresivo empeoramiento en la performance del wollok game.)
		policias.forEach({ policia => handlerTemporal.moverPolicia(policia)})
		infectados.forEach({ infectado => handlerTemporal.moverInfectado(infectado)})
		movimiento.configurarFlechas(personaje)
		new MarcoSolido(
			verticeInicial= new Position(x=0,y=0),
			verticeFinal = new Position(x=anchoRecuadro, y=altoRecuadro),
			image = "assets/escenario/arbusto.png").dibujar()
		score.dibujar()
			// Colisiones	
		game.whenCollideDo(personaje, { elemento =>
			elemento.colisionadoPor(personaje)
			win.actualizarScoreTotal()
		})
			// Musica
		const musica = game.sound("assets/audio/juego.mp3")
		musica.play()
	}

	method ubicarAleatoriamente(visual) {
		var posicion = new Position(x = 1.randomUpTo(anchoRecuadro), y = 1.randomUpTo(altoRecuadro))
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion) else self.ubicarAleatoriamente(visual)
	}

	method buscarPersonaje() {
		return personaje.position()
	}

}

object handlerTemporal {

	method moverPolicia(policia) {
		game.onTick(policia.velocidad(), "MovimientoPolicia", {=> policia.seguir()})
	}

	method moverInfectado(infectado) {
		game.onTick(infectado.velocidad(), "MovimientoInfectado", {=> infectado.correr()})
	}

}

