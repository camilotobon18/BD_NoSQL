CREATE (c:Cliente{name:"Tatiana Uribe"}), (f:Factura{name:"1001"})
WITH c, f
CREATE (c)-[ce:Compro]->(f)
SET ce.fecha=2021
//SET ce.fecha=date('2021-09-08') 
RETURN c, f, ce

CREATE (c:Cliente{name:"Tatiana Uribe"}), (s:Sede{name:"Centro"})
WITH c, s
CREATE (c)-[ca:Califico]->(f)
SET ca.calificacion=8
RETURN c, s, ca;

CREATE (c:Cliente{name:"Juan Gonzalez"}), (s:Sede{name:"Centro"})
WITH c, s
CREATE (c)-[ca:Califico]->(f)
SET ca.calificacion=9
RETURN c, s, ca;

CREATE (c:Cliente{name:"Lina Ortiz"}), (s:Sede{name:"Centro"})
WITH c, s
CREATE (c)-[ca:Califico]->(f)
SET ca.calificacion=7.5
RETURN c, s, ca;

CREATE (rob:Cliente{name:'Roberto'}), (centro:Sede{name:'Centro'}),
      (tony:Cliente{name:'Antonio'}), (nuevo_occidente:Sede{name:'Nuevo Occidente'}),
      (lily:Cliente{name:'Lilian'}), (lucas:Cliente{name:'Lucas'}), 
      (alb:Cliente{name:'Albina'}), (norte:Sede{name:'Norte'}),
      (j:Cliente{name:'Joaquín'})
// Create relationships
CREATE
  (rob)-[:Comentaron]->(centro), (rob)-[:Comentaron]->(norte), (rob)-[:Comentaron]->(nuevo_occidente),
  (j)-[:Comentaron]->(norte), (j)-[:Comentaron]->(centro),
  (tony)-[:Comentaron]->(nuevo_occidente), (tony)-[:Comentaron]->(nuevo_occidente),
  (alb)-[:Comentaron]->(norte), (lily)-[:Comentaron]->(nuevo_occidente), (lily)-[:Comentaron]->(norte),
  (lily)-[:Comentaron]->(centro), (lucas)-[:Comentaron]->(centro), (freddy)-[:Comentaron]->(nuevo_occidente);

