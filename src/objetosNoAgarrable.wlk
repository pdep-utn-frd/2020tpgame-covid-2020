import wollok.game.*
import nivel.*
import superObjetos.*
import direcciones.*
import factories.*


class ObjetosNoAgarrables inherits SuperObjeto{

	
	method colisionadoPor(personaje) {
		movimiento.mover(centro, personaje)
	}

}

const arbol1 = new ObjetosNoAgarrables(image = "arbol1.png")

const arbol2 = new ObjetosNoAgarrables(image = "arbol2.png")

const piedra = new ObjetosNoAgarrables(image = "piedra.png")

const arbusto = new ObjetosNoAgarrables(image = "arbusto.png")