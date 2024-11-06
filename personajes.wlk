class Personaje {
  var property rol
  const property fuerza

  method potencialOfensivo() = fuerza * 10 + rol.extra()
  method esGroso() = self.esInteligente() or rol.esGroso(self)
  method esInteligente()
}

class Orco inherits Personaje {
  override method potencialOfensivo() = super() * 1.1
  override method esInteligente() = false
}

class Humano inherits Personaje {
  const inteligencia = 100
  override method esInteligente() = inteligencia > 50
}

object guerrero {
  method extra() = 100
  method esGroso(quien) = quien.fuerza() > 50
}

class Cazador {
  const mascota

  method extra() = mascota.potencial()
  method esGroso(quien) = mascota.esLongeva()
}

class Mascota {
  const fuerza 
  const edad = 1
  var property tieneGarras = true
  method potencial() = fuerza * if(tieneGarras) 2 else 1
  method esLongeva() = edad > 10
}

object brujo{
  method extra() = 0
  method esGroso(quien) = true
}


class Ejercito {
  const integrantes = []

  method invadir(localidad) {
    if( self.potencialTotal() > localidad.potencialTotal())
      localidad.ocupar(self)
  }
  method potencialTotal() = integrantes.sum{i=>i.potencialOfensivo()}
  method cantidadIntegrantes() = integrantes.size()

  method nuevoEjercito(cantidad) =
    new Ejercito(
      integrantes = integrantes.sortedBy({a,b => a.potencialOfensivo()>b.potencialOfensivo()}).take(cantidad))
}


class Localidad {
  var property ocupante 
  method potencialTotal() = ocupante.potencialTotal()

  method ocupar(ejercito){
     ocupante = if (self.esGrande(ejercito))
                  ejercito.nuevoEjercito(10)
                else
                  ejercito
  }
  method esGrande(e)

}
class Aldea inherits Localidad{
  var tamanioMaximo = 3

  override method esGrande(ejercito) = ejercito.cantidadIntegrantes() > tamanioMaximo
}

class Ciudad inherits Localidad {

  override method potencialTotal() = super() + 300
  override method esGrande(e) = false
  
}