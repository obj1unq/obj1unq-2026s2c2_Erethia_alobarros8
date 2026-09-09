object rolando {
  var capacidadMochila = 2
  const mochila = [] 
  const historialEncuentros = []
  var vivienda = castilloDePiedra
  var poderBase = 5
  const artefactosUsadosEnBatallas = []

  method poderDeBatalla() {
    return mochila.sum { artefacto => artefacto.poderDeBatalla(self) } + poderBase
  }

  method artefactosUsadosEnBatalla() = artefactosUsadosEnBatallas

  method agregarAArtefactosUsadosEnBatalla(artefactos){
    artefactosUsadosEnBatallas.add(artefactos)
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
    artefactosUsadosEnBatallas.addAll(mochila)
     mochila.forEach({ artefacto => artefacto.usar(self) })
    poderBase += 1
  }

}

object espadaDelDestino {

method poderDeBatalla(personaje) {
  return if (personaje.artefactosUsadosEnBatalla().contains(self)){
      personaje.poderBase() * 0.50
    }else{
      personaje.poderBase()
    }
  }
method usar(personaje) {}
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
    const artefactosEnMorada = personaje.vivienda().baulCastillo()
    return if (not artefactosEnMorada.isEmpty()) {
      const masPoderoso = artefactosEnMorada.max({ artefacto => artefacto.poderDeBatalla(personaje) })
      masPoderoso.poderDeBatalla(personaje)
    } else {
      0
    }
  }
}


object collarDivino {
method poderDeBatalla(personaje){
    return if (personaje.poderBase() > 6){
      3 + personaje.artefactosUsadosEnBatalla().count({ artefacto => artefacto == self })
    }else{
      3
    }
  }  
method usar(personaje) {}
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