object rolando {
  var capacidadMochila = 2
  const mochila = [] 
  const historialEncuentros = []
  var vivienda = castilloDePiedra

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
    self.validarRecoletar(artefacto)
  }

method validarRecoletar(artefacto){
if (not self.tieneEspacioEnMochila()) {
      self.error("no se puede recolectar el artefacto, la mochila esta llena")
    }else{
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

}

object espadaDelDestino {}
object libroDeHechizos {}
object collarDivino {}
object armaduraDeAceroValyrio {}

object castilloDePiedra {
  const baulCastillo = [] 

  
  method baulCastillo() {
    return baulCastillo
  }

  
  method almacenar(artefactos) {
    baulCastillo.addAll(artefactos)
  }
}