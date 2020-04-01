DESCRIPCION DEL PROYECTO

. Feature-Skeleton:
  Se realiza una copia de ultimo proyecto en IOS realizado en una práctica sobre EH-HO.
  Como contenido se deja lo referente a una animación realizada en la práctica a modo de pantalla inicial.
  Tambien se conserva las clases relacionadas con la comunicación con la Api.
  Ademas se genera el código para la estructura de topics y posts de cara al patrón de arquitectura MVVM.
  Por ultimo se queda implementado el módulo Pods para su posterior utilización por si fuera necesario.
  
  https://github.com/jacobomd/protectFinalIOSJacobo/blob/master/Eh-Ho/Resources/ArtWork/Assets.xcassets/Screenshot%20login%20user.imageset/Screenshot%20login%20user.png
  
. Feature-Login y Alta:
  En primer lugar a pesar de no estar dentro de esta feature se genera la funcionalidad para el visionado de la lista de 
  topics ya que es lo primero que se va a visualizar en la app, se sigue el patrón de arquitectura MVVM para ello. Una
  vez hecho esto se añaden las vista de login y de registro trabajando con Autolayout. Posteriormante a esto se 
  implementa todo lo que tiene que ver con la funcionalidad del login, registro y restablecimiento de contraseña.
  A continuación se realiza la lógica de la comprobación del inicio de sesion para habilitar permisos de acciones.
  Una vez terminado lo anterior se procede a la implementación del detalle del usuario que en este caso aparece un 
  dialog emergente al pulsar en cada avatar de cada topic.
  
. Feature-topics:
  Como ya se parte de que tenemos funcionando desde la anterior feature el visionado de la lista de topics se procede a 
  la implementación de la lógica en cuanto a la lista de posts por topic. A continuación se realiza la lógica del creado
  de topic realizando implementadas sus correspondientes permisos y validaciones.
  Al terminar con lo anterior se procede a la implementación de la creacion de un post dentro de cada topic, también 
  con sus permisos y validaciones ya que tanto para la creación de topics como de post estan sujetas tanto a si 
  estas logueado como si tienes conexión a internet.
  
. Feature-search:
  En esta feature se genera toda la lógica para el filtrado de topic en la lista de topics. Para ello se utiliza
  un searchbar. Una vez implementado se realizan mejoras para que funcione correctamente también con la persistencia
  en cuanto a cuando no tenemos conexión a internet.
  
. Feature-persistence:
  En esta feature se realiza toda la lógica que corresponde a la persistencia de la app. Para ello se ha utilizado la
  librería realm para la base de datos, para ello se genera una base de datos en realm en el cual se le carga los 
  datos en cuanto a lista de topics como  lista de posts para posteriormente acceder a dichos datos cuando la app
  lo requiera, que en este caso es para cuando dejamos de tener conexion a internet en el móvil.
  
. Feature-improvements:
  En esta feature se ha realizado todas las mejoras posibles que se han quedado pendientes durante el transcurso 
  de las anteriores features, como por ejemplo ciertas validaciones, problemas con sobrecargar de avatares en el 
  visionado de la lista de topics, limpiar y organizar mejor cierto código, etc...

