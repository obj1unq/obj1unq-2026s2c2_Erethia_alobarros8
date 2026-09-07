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
}
object libroDeHechizos {

}
object collarDivino {
method poderDeBatalla(personaje){
    return if (personaje.poderBase() > 6){
      3 + personaje.artefactosUsadosEnBatalla().count(self)
    }else{
      3
    }
  }  
}
object armaduraDeAceroValyrio {
method poderDeBatalla(personaje) {
    return 6
  }
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