import wollok.game.*
import nivel.*

class ObjetosNoAgarrables {

	/*var posNoAgrarrables = []
	var property posOcupadas = []*/
	var property position = game.at(1.randomUpTo(nivel.anchoRecuadro() - 1).roundUp(), 1.randomUpTo(nivel.altoRecuadro() - 1).roundUp())
	const property transpasable = false
	/*method agregar(pos) {
		posOcupadas.add(pos)
	}

	method remover(pos) {
		posOcupadas.remove(pos)
	}

	method posicionOcupada(pos) {
		return posNoAgrarrables.contains(pos) or posOcupadas.contains(pos)
	}

	method esONAgarrable(pos) {
		return posNoAgrarrables.contains(pos)
	}

	method agregarPosiciones() {
		5.times{ i => 5.times{ j => posNoAgrarrables.add(game.at(i * 2, j * 2))}}
		11.times{ k =>
			posNoAgrarrables.add(game.at(k, 0))
			posNoAgrarrables.add(game.at(k, 17))
			posNoAgrarrables.add(game.at(0, k))
			posNoAgrarrables.add(game.at(31, k))
		}
	}

	method spawnearCosasNoAgarrables() {
		var posicionesReservadas = [ game.at(1,1), game.at(2,1), game.at(1,2), game.at(11,11), game.at(11,10), game.at(10,11) ]
		11.times{ i => 11.times{ j =>
			var probabilidad = 1.randomUpTo(10)
			if (!posNoAgrarrables.contains(game.at(i, j)) and probabilidad > 6 and !posicionesReservadas.contains(game.at(i, j))) new Caja(position=game.at(i,j)).spawn()
		}}
	}*/

}

