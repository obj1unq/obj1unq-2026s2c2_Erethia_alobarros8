object rolando {
  var capacidadMochila = 2
  const mochila = [] 
  const historialEncuentros = []
  var vivienda = castilloDePiedra
  var poderBase = 5
  
  method tieneArtefactoFatalParaDerrotarA(enemigo) {
    return self.posesiones().contains(enemigo.puntoDebil()) 
  }

  method poderDeBatalla() {
    return mochila.sum { artefacto => artefacto.poderDeBatalla(self) } + poderBase
  }

  method poderBase(_poderBase){
    poderBase = _poderBase
  } 

  method poderBase() = poderBase

  method vivienda(_vivienda) {
    vivienda = _vivienda
  }

  method vivienda(){
    return vivienda
  } 
  
  method historialEncuentros() {
    return historialEncuentros
  }

  method capacidadMochila() {
    return capacidadMochila
    }

    method capacidadMochila(_capacidadMochila) {
      capacidadMochila = _capacidadMochila
    }

  method mochila() {
    return mochila
  }

  method agregarHitorialDeEncuentros(artefacto) {
    historialEncuentros.add(artefacto)
  }

  method encontrar(artefacto) {
    self.agregarHitorialDeEncuentros(artefacto)
    if (self.tieneEspacioEnMochila()) {
      mochila.add(artefacto)
    }
  }



  method tieneEspacioEnMochila() {
    return mochila.size() < capacidadMochila
  }  
  
  method llegarAHogar() {
    vivienda.almacenar(mochila)
    mochila.clear() 
  }
  method posesiones() {
    return (mochila + vivienda.baulCastillo()).asSet()
  }

  method posee(artefacto) {
    return self.posesiones().contains(artefacto)
  }

  method batalla() {
  
    mochila.forEach({ artefacto => artefacto.usar(self) })
    poderBase += 1
  }

}

object espadaDelDestino {
var batallas = 0
method poderDeBatalla(personaje) {
  return if (batallas >= 1){
      personaje.poderBase() * 0.50
    }else{
      personaje.poderBase()
    }
  }
method usar(personaje) {
  batallas += 1
}
}
object libroDeHechizos {
  const hechizos = []

  method hechizos() = hechizos

  method hechizos(_hechizos) {
    hechizos.clear()
    hechizos.addAll(_hechizos)
  }

  method agregarHechizo(hechizo) {
    hechizos.add(hechizo)
  }

  method poderDeBatalla(personaje) {
    return if (not hechizos.isEmpty()) {
      hechizos.first().poderDeBatalla(personaje)
    } else {
      0
    }
  }

  method usar(personaje) {
    if (not hechizos.isEmpty()) {
      hechizos.remove(hechizos.first())
    }
  }
}

object bendicion {
  method poderDeBatalla(personaje) = 4
}

object invisibilidad {
  method poderDeBatalla(personaje) = personaje.poderBase()
}

object invocacion {
  method poderDeBatalla(personaje) {
    const artefactosEnVivienda = personaje.vivienda().baulCastillo()
    return if (not artefactosEnVivienda.isEmpty()) {
      const masPoderoso = artefactosEnVivienda.max({ artefacto => artefacto.poderDeBatalla(personaje) })
      masPoderoso.poderDeBatalla(personaje)
    } else {
      0
    }
  }
}


object collarDivino {
var batallas = 0
method poderDeBatalla(personaje){
    return if (personaje.poderBase() > 6){
      3 + batallas
    }else{
      3
    }
  }  
method usar(personaje) {
  batallas += 1
}
}
object armaduraDeAceroValyrio {
method poderDeBatalla(personaje) {
    return 6
  }
method usar(personaje) {}
}

object castilloDePiedra {
  const baulCastillo = [] 

  
  method baulCastillo() {
    return baulCastillo
  }

  
  method almacenar(artefactos) {
    baulCastillo.addAll(artefactos)
  }
}

object erethia {
  const enemigos = [caterina , archibaldo , astra ]
  method enemigos() {
    return enemigos
  }
  method puedeVencer(personaje) = self.enemigos().filter({ enemigo => enemigo.poderDeBatalla() <= personaje.poderDeBatalla() })

  method viviendasConquistables(personaje) = self.puedeVencer(personaje).map({enemigo => enemigo.vivienda()})

  method esElMasPoderoso(personaje) = self.puedeVencer(personaje) == self.enemigos()

}

object caterina {
  var vivienda = fortalezaDeAcero
  method puntoDebil() = libroDeHechizos
  method vivienda() = vivienda
  method poderDeBatalla() = 28
}

object archibaldo {
  var vivienda = palacioDeMarmol
  method puntoDebil() = armaduraDeAceroValyrio
  method vivienda() = vivienda
  method poderDeBatalla() = 16
}
object astra {
  var vivienda = torreDeMarfil
  method puntoDebil() = espadaDelDestino
  method vivienda() = vivienda
  method poderDeBatalla() = 14
}

object fortalezaDeAcero {
  
}

object palacioDeMarmol {
  
}

object torreDeMarfil {
  
}