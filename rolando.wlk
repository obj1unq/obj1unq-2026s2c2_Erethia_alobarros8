object rolando {
  var capacidadMochila = 2
  const mochila = [] 

  
  method capacidadMochila() {
    return capacidadMochila
    }

    method capacidadMochila(_capacidadMochila) {
      capacidadMochila = _capacidadMochila
    }
   
  method mochila() {
    return mochila
  }

  
  method encontrar(artefacto) {
    if (self.tieneEspacioEnMochila()) {
      mochila.add(artefacto)
    }
  }

  
  method tieneEspacioEnMochila() {
    return mochila.size() < capacidadMochila
  }  
  
  method llegarAHogar() {
    castilloDePiedra.almacenar(mochila)
    mochila.clear() 
  }
   method posesiones() {
    return (mochila + castilloDePiedra.baulCastillo()).asSet()
  }

  // Consulta: Saber si Rolando posee un artefacto en particular
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