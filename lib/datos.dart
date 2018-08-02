class Elemento {
  final String id;
  final String name;
  final String categoria;
  final String situacion;
  final String latitud;
  final String longitud;
  final String description;
  final String image;
  final String picture;
  final String Fecha1;
  bool favorito;

  Elemento(this.id, this.name, this.categoria, this.situacion, this.latitud, this.longitud,
    this.description, this.image, this.picture, this.favorito, this.Fecha1);

}

//Listado donde vamos a guardar los favoritos
List<String> favoritos =[];


//Listado de información a mostrar
List<Elemento> elemento = [
  Elemento(
      "1",
      "Palacio de Valdecarzana",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.556369",
      "-5.921637 ",
      "El Palacio de Valdecarzana también conocido como la Casa de las Baragañas, se encuentra situado en la localidad asturiana de Avilés. Se trata de un palacio perteneciente al estilo gótico construido entre los siglos XIV y XV por un rico comerciante avilesino para servir como su domicilio particular. Además también posee una zona baja utilizada en sus inicios para mercadear y almacenar los productos, ya que dispone de varios arcos ojivales con guardapolvos dispuestos a tal efecto. La parte de la vivienda se caracteriza asimismo por poseer cuatro ventanas geminadas a modo de galería, de las cuales su alféizar se encuentra decorado por dientes en sierra. Es el edificio civil más antiguo de Asturias y el único ejemplo no religioso del estilo gótico en la villa, también se caracteriza por ser la única muestra de arquitectura burguesa presente en ella. Cabe destacar que de la estructura original solo queda en pie actualmente la fachada sur, que fue completamente asegurada y restaurada durante el siglo XX para convertir al edificio en el Archivo Histórico de Avilés. Entre generaciones ha pasado la creencia de que el rey Pedro I el Cruel cuando libró a la ciudad en 1352 de las tropas de su hermano bastardo, el insurrecto Enrique de Trastámara se alojó en este palacio.",
      "assets/img/valdecarzana_1.jpg",
      "https://www.nasa.gov/sites/default/files/thumbnails/image/pia21723-16.jpg",
      false,
      null
  ),
   Elemento(
      "2",
      "Palacio de Ferrera",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.5553927",
      "-5.9226939",
      "El palacio de Ferrera se encuentra situado en las inmediaciones del ayuntamiento de Avilés, en Asturias. Es uno de los inmuebles de estilo barroco más antiguos de la provincia, siendo un claro exponente de lo que se conoce como ensanche barroco hacia las afueras de la muralla medieval. Desde su construcción hasta el año 1998 sirvió como residencia de los marqueses de Ferrera, y era elegido como alojamiento por la Familia Real Española siempre que alguno de sus miembros pernoctaba en la villa. Durante 2003 el edificio fue sometido a una reforma integral y acondicionado para albergar un hotel de cinco estrellas perteneciente a la cadena hotelera NH Hoteles.",
      "assets/img/ferrara_1.jpg",
      "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/images/110411main_Voyager2_280_yshires.jpg",
      false,
       null
  ),
   Elemento(
      "3",
      "Palacio de Macua",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.556467",
      " -5.923691",
      "El Palacio de Macua está situado en la localidad asturiana de Avilés. Edificado a lo largo del siglo XIX y XX para la familia Maqua consta de tres pisos de los que destaca los balcones del tercer piso. El palacio se rehabilitó en 1983 y 1997.Se Declaró Bien de Interés Cultural con categoría de Monumento el 3 de octubre de 1991​.",
      "assets/img/macua_1.jpg",
      "https://farm5.staticflickr.com/4086/5052125139_43c31b7012.jpg",
      false,
       null
  ),
   Elemento(
      "4",
      "Palacio de Balsera",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.555030",
      "-5.924086",
      "El Palacio de Balsera o Sendón está situado en la localidad asturiana de Avilés. Antaño residencia privada, actualmente es la sede del Conservatorio municipal de música Julián Orbón. Este palacio fue construido a principios del siglo XX, probablemente 1917, por el arquitecto pontevedrés Antonio Palacios para Victoriano Fernández Balsera, un rico comerciante avilesino. El edificio «a medio camino entre el modernismo y el eclecticismo,​ se caracteriza por un interesante juego de volúmenes ascendentes, desde el chaflán curvado en el ángulo a la esbelta torre de inspiración historicista. Está decorado de forma profusa y el interior se conserva en perfecto estado. ",
      "assets/img/balsera_1.jpg",
      "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/iss042e340851_1.jpg",
      false,
       null
  ),
   Elemento(
      "5",
      "Palacio de Llano Ponte",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.555240" ,
      "-5.921298",
      "El Palacio de Llano Ponte también conocido como Casa-Palacio de García-Pumarino está situado haciendo esquina en la plaza de España, en pleno conjunto histórico artístico de la localidad asturiana de Avilés. A mediados del siglo XX sufrió un gran proceso de reforma iniciado por sus nuevos propietarios con el objetivo final de convertir el edificio en una sala de cine, denominada Marta y María como tributo a la novela de título homónimo escrita por Armando Palacio Valdés durante 1898.",
      "assets/img/llano_ponte_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
       null
  ),
   Elemento(
      "6",
      "Palacio de Camposagrado",
      "Historico",
      "Calle Sol, 1, 33402 Avilés, Asturias",
      "43.557636" ,
      "-5.922093",
      "El Palacio de Camposagrado es un edificio palaciego de estilo barroco situado en la localidad asturiana de Avilés. Sus dos fachadas principales fueron construidas en el siglo XVII, la que da al actual parque del muelle (si bien cuando fue construida daba directamente a la ría) y la que da a la plaza de Camposagrado.",
      "assets/img/camposagrado_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
       null
  ),

  Elemento(
      "7",
      "Pedro Menendez de Aviles",
      "Personajes",
      "Parque del muelle",
      "43.559138" ,
      "-5.921958",
      "Pedro Menéndez de Avilés fue un militar y marino español y gobernante de Indias. En 1565 reconquistó la Florida tras destruir Fort Caroline y otros asentamientos de hugonotes franceses que la ocupaban, y fundó la ciudad de San Agustín",
      "assets/img/Pedro_menendez_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      null
  ),

  Elemento(
      "8",
      "Juan Carreño de Miranda",
      "Personajes",
      "Plaza de Camposagrado",
      "43.557129",
      "-5.922066",
      "Juan Carreño de Miranda (¿Avilés?, 25 de marzo de 1614 - Madrid, 3 de octubre de 1685) fue un pintor barroco español. Llamado por Miguel de Unamuno pintor de la «austriaca decadencia de España»,1​ a partir de 1671 sirvió como pintor de cámara de Carlos II. Como retratista de la corte fue continuador del tipo de retrato velazqueño, con su misma sobriedad y carencia de artificio pero empleando una técnica de pincelada más suelta y pastosa.",
      "assets/img/carreño_miranda_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      null
  ),
  Elemento(
      "9",
      "Oscar Niemeyer",
      "Personajes",
      "Centro Niemeyer",
      "43.557872",
      "-5.917517",
      "Oscar Ribeiro de Almeida Niemeyer Soares Filho (Río de Janeiro, 15 de diciembre de 1907-Río de Janeiro, 5 de diciembre de 2012)1​ fue un arquitecto brasileño. Seguidor y gran promotor de las ideas de Le Corbusier, es considerado uno de los personajes más influyentes de la arquitectura moderna internacional. Fue pionero en la exploración de las posibilidades constructivas y plásticas del hormigón armado.",
      "assets/img/oscar_niemeyer_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      null
  ),
  Elemento(
      "10",
      "Escudo de avilés",
      "Curiosidades",
      "",
      "",
      "",
      "El escudo de Avilés alude a la toma de Sevilla por Fernando III,  el 20 de mayo de  1248, cuando una nave mandada por el cántabro Ramón Bonifaz y el avilesino Rui Pérez rompió un puente de barcas que cerraba el paso por el río entre la torre del Oro y el castillo de Triana.",
      "assets/img/cañon_aviles_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      null
  ),
  Elemento(
      "11",
      "Villa del adelantado",
      "Curiosidades",
      "San Agustín de la Florida",
      "29.902247",
      "-81.316079",
      "La cuidad de Avilés también es conocida como Villa del Adelantado en honor a Pedro Menendez de Avilés que fue el fundador de San Agustín de la Florida, primer enclave español en Norteamérica y la que dicen es la ciudad más antigua de Estados Unidos.",
      "assets/img/cañon_aviles_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      null
  ),
  Elemento(
      "12",
      "Mercado franco de alcabala",
      "Momentos historicos",
      "Plaza Hermanos Orbón",
      "43.557688",
      "-5.923501",
      "Para paliar el gran incendio que debastó Avilés en 1478 los Reyes Católicos conceden a Avilés el privilegio de organizar un mercado semanal a celebrar todos los lunes, a fin de que la villa se volviese a poblar, ya que la mayoría de los moradores la habían abandonado al quedar reducida a escombros su vivienda.",
      "assets/img/cañon_aviles_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      "15-01-1479"
  ),
  Elemento(
      "13",
      "Incendio de Avilés",
      "Momentos historicos",
      "",
      "",
      "",
      "El primer gran incendio del que se tiene noticia en Avilés es el que asoló la villa en noviembre de 1478, sin que se pueda precisar el día. Las llamas arrasaron la mayor parte de las casas ubicadas dentro del recinto amurallado y sólo se salvaron los edificios principales construidos en piedra. Se ignora el número de víctimas, que cabe suponer elevado.",
      "assets/img/cañon_aviles_1.jpg",
      "https://c1.staticflickr.com/9/8105/8497927473_2845ae671e_b.jpg",
      false,
      "01-11-1478"
  ),
];
