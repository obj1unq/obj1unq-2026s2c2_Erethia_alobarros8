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
}

object espadaDelDestino {}
object libroDeHechizos {}
object collarDivino {}
object armaduraDeAceroValyrio {}