
MATCH (allNodes) RETURN allNodes

//Relación de amistad y clientes
CREATE 
      //Clientes
      (rob:Cliente{name:'Roberto'}), (tony:Cliente{name:'Antonio'}), 
      (lily:Cliente{name:'Lilian'}), (lucas:Cliente{name:'Lucas'}), 
      (alb:Cliente{name:'Albina'}), (j:Cliente{name:'Joaquín'}),
      //Amigos
      (isidro:Amigo{name:'Isidro'}), (nora:Amigo{name:'Nora'}), 
      (freddy:Amigo{name:'Alfredo'}),(mau:Amigo{name:'Mauricio'}), 
      (reg:Amigo{name:'Regina'}), (julian:Amigo{name:'Julián'}),
      //Sedes
      (centro:Sede{name:'Centro'}),(nuevo_occidente:Sede{name:'Nuevo Occidente'}), (norte:Sede{name:'Norte'}),
      //Menus
      (hamburguesaBBQ:Menu{name:'Hamburguesa BBQ'}), (pastasNapolitana:Menu{name:'Pastas Napolitana'}), (limonada:Menu{name:'Limonada'})
CREATE
  //Relaciones de comentarios sobre sedes
  (rob)-[:Comentaron]->(centro), (rob)-[:Comentaron]->(norte), (rob)-[:Comentaron]->(nuevo_occidente),
  (j)-[:Comentaron]->(norte), (j)-[:Comentaron]->(centro),
  (tony)-[:Comentaron]->(nuevo_occidente), (tony)-[:Comentaron]->(nuevo_occidente),
  (alb)-[:Comentaron]->(norte), (lily)-[:Comentaron]->(nuevo_occidente), (lily)-[:Comentaron]->(norte),
  (lily)-[:Comentaron]->(centro), (lucas)-[:Comentaron]->(centro), (freddy)-[:Comentaron]->(nuevo_occidente),
  //Relaciones de amistad   
  (rob)-[:AmigoDe]->(isidro), (rob)-[:AmigoDe]->(tony), (rob)-[:AmigoDe]->(reg),
  (rob)-[:AmigoDe]->(mau), (rob)-[:AmigoDe]->(julian),
  (tony)-[:AmigoDe]->(reg), (tony)-[:AmigoDe]->(j),
  (alb)-[:AmigoDe]->(reg), (lily)-[:AmigoDe]->(isidro), (lily)-[:AmigoDe]->(j),
  (mau)-[:AmigoDe]->(lucas), (lucas)-[:AmigoDe]->(nora), (freddy)-[:AmigoDe]->(nora),
  //Relaciones de comentarios sobre menus
  (rob)-[:Comento]->(hamburguesaBBQ), (tony)-[:Comento]->(pastasNapolitana), (freddy)-[:Comento]->(limonada),
  (reg)-[:Comento]->(pastasNapolitana);



//Creación de la base de datos Restaurante
CREATE (TatianaU:Cliente {id_cliente:3001, nombre_cliente:'Tatiana Uribe', telefonos: '46546546', direccion: 'CL 021 095 45', ciudad: 'Medellin', estado_civil: 'Soltera', correo: 'tatiana@gmail.com' }),

(JuanOrtiz:Cliente {id_cliente:3002, nombre_cliente: 'Juan Ortiz', telefonos: '46956546', direccion: 'CL 095 015 45', ciudad: 'Medellin', estado_civil: 'Divorciado', correo: 'juan@gmail.com'}),

(CarlosMadrid:Cliente {id_cliente: 3003, nombre_cliente: 'Carlos Madrid', telefonos: '469654786', direccion: 'CQ 010 095 45', ciudad: 'Bello', estado_civil: 'Casado', correo: 'carlos@gmail.com'}),

(HamburguesaBBQ:Menu {id_producto: 5001, nombre_producto: 'Hamburguesa BBQ', precio: 20000, especialidad: 'Comida rapida', medida: 150, unidad_medida: 'grs', impuesto: 0.08}),

(PastasNapolitana:Menu {id_producto: 5002, nombre_producto: 'Pastas Napolitana', precio: 22000, especialidad: 'Comida Italiana', medida: 200, unidad_medida: 'grs', impuesto: 0.08}),

(SodaMichelada:Menu {id_producto: 5003, nombre_producto: 'Soda Michelada', precio: 7000, especialidad: 'Bebidas', medida: 400, unidad_medida: 'ml', impuesto: 0.08}),

(Limonada:Menu {id_producto: 5004, nombre_producto: 'Limonada', precio: 6000, especialidad: 'Bebidas', medida: 400, unidad_medida: 'ml', impuesto: 0.08}),

(FabianPat:Empleado {id_empleado: '2001', nombre_empleado: 'Fabian Patiño', telefonos: '5645642',  direccion: 'CQ 02 012 016', ciudad: 'Medellin', salario: 1500000, cargo: 'Auxiliar de cocina'}),

(AndersonJimenez:Empleado {id_empleado: '2002', nombre_empleado: 'Anderson Jimenez', telefonos: '15565545', direccion: 'CR 012 065 025', ciudad: 'Envigado', salario: 2500000,cargo: 'Cajero'}),

(CamiloTobon:Empleado {id_empleado: '2003', nombre_empleado: 'Camilo Tobón', telefonos: '46468897', direccion: 'CQ 095 065 025', ciudad: 'Bello', salario: 1300000, cargo: 'mesero'}),

(NuevoOccidente:Sede {id_sede: 1001, nombre_sede: 'Nuevo Occidente', horario_apertura: '07:00', horario_cierre: '19:00', telefonos: '3112525', capacidad_aforo: 25, direccion: 'CL 045 011 021', ciudad: 'Medellin'}),

(Centro:Sede {id_sede: 1002, nombre_sede: 'Centro', horario_apertura: '08:00', horario_cierre: '20:00', telefonos: '4012521', capacidad_aforo: 34, direccion: 'CR 065 011 021', ciudad: 'Envigado'}),

(Norte:Sede {id_sede: 1003, nombre_sede: 'Norte', direccion: 'TV 071 011 021', horario_apertura: '09:00', horario_cierre: '21:00', telefonos: '3112525', capacidad_aforo: 31, direccion: 'TV 021 035 096', ciudad: 'Bello'}),

(fact7001:factura {id_factura: '7001', fecha_hora: '2021-09-05 15:01:03', subtotal: 31280, impuesto: 2720, total: 34000 }),

(fact7002:factura {id_factura: '7002', fecha_hora: '2021-09-05 15:15:09', subtotal: 51520, impuesto: 4480, total: 56000}),

(fact7003:factura {id_factura: '7003', fecha_hora: '2021-09-05 15:21:54', subtotal: 42320, impuesto: 3680, total: 46000}),

(fact7004:factura {id_factura: '7004', fecha_hora: '2021-09-05 16:56:54', subtotal: 53360, impuesto: 4640, total: 58000}),

(spaghetti:MateriaPrima {id_item: 1, id_producto: 8001, nombre_item: 'spaghetti delgado', cantidad: 10, unidad_medida: 'libra', precio: 3000, fecha: '2021-09-04', accion: 'compra', especialidad: 'granos'})

//Relaciones de la base de datos
CREATE
(TatianaU)-[:LeFacturaron]->(fact7001),
(JuanOrtiz)-[:LeFacturaron]->(fact7002),
(JuanOrtiz)-[:LeFacturaron]->(fact7004),
(CarlosMadrid)-[:LeFacturaron]->(fact7003),
(TatianaU)-[:ComproEn]->(NuevoOccidente),
(JuanOrtiz)-[:ComproEn]->(NuevoOccidente),
(JuanOrtiz)-[:ComproEn]->(Norte),
(CarlosMadrid)-[:ComproEn]->(Centro),
(FabianPat)-[:Facturo]->(fact7001),
(AndersonJimenez)-[:Facturo]->(fact7002),
(AndersonJimenez)-[:Facturo]->(fact7003),
(FabianPat)-[:Facturo]->(fact7004),

(fact7001)-[:ProductoFactura {cantidad:[1]}]->(HamburguesaBBQ),
(fact7001)-[:ProductoFactura {cantidad:[2]}]->(SodaMichelada),
(fact7002)-[:ProductoFactura {cantidad:[2]}]->(PastasNapolitana),
(fact7002)-[:ProductoFactura {cantidad:[2]}]->(Limonada),
(fact7003)-[:ProductoFactura {cantidad:[2]}]->(HamburguesaBBQ),
(fact7003)-[:ProductoFactura {cantidad:[1]}]->(Limonada),
(fact7004)-[:ProductoFactura {cantidad:[2]}]->(PastasNapolitana),
(fact7004)-[:ProductoFactura {cantidad:[2]}]->(SodaMichelada);


  //Consultas
  MATCH (n:Sede) 
  RETURN 

