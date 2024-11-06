# PRACTICA PARCIAL - Objetos 1 - Unahur -2024 - Segundo Cuatrimestre

Desde hace décadas, la guerra entre las facciones de la Alianza y la Horda se ha extendido por todo el mundo. En esta oportunidad, queremos construir un sistema programando con objetos que nos permita modelar la situación actual de la lucha, y quien sabe, ayudar a que ~~nunca~~ termine.

Por el momento, tenemos dos razas distintas de personajes, los orcos (miembros de La Horda) y los humanos (integrantes de La Alianza); aunque en el futuro nuevas razas pueden sumarse a la batalla, el sistema deberá poder extenderse con facilidad. De los personajes nos interesa su fuerza, inteligencia y rol.

Los roles disponibles al momento son guerrero, cazador o brujo. Cada personaje tiene un único rol, pero, si se aburren, pueden cambiarlo por otro haciendo el trámite correspondiente. Los cazadores pueden tener una mascota (un animal salvaje que el cazador supo domar), de la cual conocemos su fuerza, edad y si tiene o no garras.

Nuestros personajes no viven en soledad, es por ello que tenemos distintas localidades donde pueden encontrarse. Por un lado, existen las aldeas, pequeñas pero acogedoras y, por otro lado, ciudades grandes y ricas. Las aldeas tienen una cantidad máxima de habitantes, que depende de su tamaño; sólo las ciudades pueden contener cualquier cantidad de personajes.

En algunas ocasiones los personajes pueden agruparse en ejércitos para atacar una localidad.

Se pide modelar las abstracciones necesarias para soportar los siguientes requerimientos:

1. Obtener el potencial ofensivo de un personaje, el cual se calcula como la fuerza multiplicada por 10 más un cierto extra que depende del rol:
    - Guerrero: Siempre da un extra de 100.
    - Cazador: El extra depende del potencial ofensivo de su mascota. Las mascotas sin garras tienen un potencial ofensivo igual a su fuerza. Las que tienen garras duplican dicho valor.
    - Brujo: No da ningún extra.

En el caso particular de los orcos, producto de su brutalidad innata, su potencial ofensivo es un 10% más.


2. Saber si un personaje es groso. Esto se da si es inteligente o es groso en su rol.
Un humano se considera inteligente si su inteligencia es mayor a 50. Los orcos nunca son inteligentes.
Un personaje es groso en su rol dependiendo de la exigencia del mismo:
    - Guerrero: Es groso si la fuerza del personaje es mayor a 50.
    - Cazador: Es groso si su mascota es longeva. Una mascota es longeva cuando su edad es mayor a 10.
    - Brujo: Siempre es groso.


3. Queremos modelar la invasión a una localidad. Cuando esto sucede, el ejército invasor lucha contra los personajes que habitan la zona para ganar control de ella.

En caso de que el potencial ofensivo total del ejército invasor supere al del defensor, la zona es desalojada y el ejército atacante pasa a ocuparla. Si el ejército es muy grande para la localidad debe dividirse en dos, quedando en la zona un nuevo ejército conformado por los 10 miembros con mayor potencial ofensivo del ejército original.

Si esto no ocurre, la invasión no tuvo éxito y el ejército defensor permanece a cargo.
Las ciudades poseen mejores defensas que las aldeas, con lo cual incrementan el potencial ofensivo del ejército defensor en 300.

