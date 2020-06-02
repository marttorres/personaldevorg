public class Arboles50 {

}

/*
Id IdBosque = [SELECT Id FROM Bosque__c WHERE Name ='Alameda']

Bosque__c objBosque = [SELECT Id FROM Bosque__c WHERE Name ='Alameda'];
id IdArbol = objBosque.Id;
Arbol__c objArbol51 = New Arbol__c(Name='Weed', strColor__c = 'Verde muy verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol2 = New Arbol__c(Name='Pinanano',strColor__c = 'Naranja', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol3 = New Arbol__c(Name='Aguacate', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol4 = New Arbol__c(Name='Durazno', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol5 = New Arbol__c(Name='Ciruelo', strColor__c = 'Rojo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol6 = New Arbol__c(Name='Peral', strColor__c = 'Amarillo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol7 = New Arbol__c(Name='Manzano', strColor__c = 'Rosa', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol8 = New Arbol__c(Name='Kiwi', strColor__c = 'Verde limon', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol9 = New Arbol__c(Name='Naranjo', strColor__c = 'Ocre', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol10 = New Arbol__c(Name='Cidra', strColor__c = 'Lila', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol11 = New Arbol__c(Name='Cedro', strColor__c = 'marron', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol12 = New Arbol__c(Name='Abedul', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol13 = New Arbol__c(Name='Tabachin', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol14 = New Arbol__c(Name='Roble', strColor__c = 'Blanco', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol15 = New Arbol__c(Name='Sauce', strColor__c = 'Negro', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol16 = New Arbol__c(Name='Litchi', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol17 = New Arbol__c(Name='Nogal', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol18 = New Arbol__c(Name='Limonar', strColor__c = 'Iñigo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol19 = New Arbol__c(Name='Platano', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol20 = New Arbol__c(Name='Granada', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol21 = New Arbol__c(Name='Ahuehuete', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol22 = New Arbol__c(Name='Mamey', strColor__c = 'amarillo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol23 = New Arbol__c(Name='Mezquite', strColor__c = 'amarillo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol24 = New Arbol__c(Name='Arce', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol25 = New Arbol__c(Name='Olmo', strColor__c = 'Morado', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol26 = New Arbol__c(Name='Abeto', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol27 = New Arbol__c(Name='Palmera', strColor__c = 'Morado', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol28 = New Arbol__c(Name='Abellana', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol29 = New Arbol__c(Name='Acanto', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol30 = New Arbol__c(Name='Capulin', strColor__c = 'Blanco', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol31 = New Arbol__c(Name='Míspero', strColor__c = 'Negro', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol32 = New Arbol__c(Name='Copei', strColor__c = 'Azul', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol33 = New Arbol__c(Name='Cipres', strColor__c = 'Morado', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol34 = New Arbol__c(Name='Acebiño', strColor__c = 'Gris', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol35 = New Arbol__c(Name='Lilo', strColor__c = 'Magenta', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol36 = New Arbol__c(Name='Baobab', strColor__c = 'Azul agua pero de drenage', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol37 = New Arbol__c(Name='Mirto', strColor__c = 'Azul cielo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol38 = New Arbol__c(Name='Achiote', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol39 = New Arbol__c(Name='Nim', strColor__c = 'Verde moco', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol40 = New Arbol__c(Name='Higo', strColor__c = 'Verde Alcantarilla', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol41 = New Arbol__c(Name='Chaya', strColor__c = 'Verde', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol42 = New Arbol__c(Name='Cedro Blanco', strColor__c = 'Amarillo huevo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol43 = New Arbol__c(Name='Pino Limón', strColor__c = 'Amarillo Vomito', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol44 = New Arbol__c(Name='Pimentero', strColor__c = 'Amarillo Pollo', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol45 = New Arbol__c(Name='Encino Rojo', strColor__c = 'Amarillo chillon', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol46 = New Arbol__c(Name='Coco', strColor__c = 'Verde chillon', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol47 = New Arbol__c(Name='Pistacho', strColor__c = 'Rojo sangrado', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol48 = New Arbol__c(Name='Ricino', strColor__c = 'Arcoiris', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol49 = New Arbol__c(Name='Sauco', strColor__c = 'LGBT', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);
Arbol__c objArbol50 = New Arbol__c(Name='Fresno Blanco', strColor__c = 'RGB', numPromedioDeHojas__c = 50, Bosque__c = IdArbol);

List<Arbol__c> listArbol = New List<Arbol__c>{objArbol51,objArbol2,objArbol3,objArbol4,
    objArbol5,objArbol6,objArbol7,objArbol8,objArbol9,objArbol10,objArbol11,objArbol12,
    objArbol13,objArbol14,objArbol15,objArbol16,objArbol17,objArbol18,objArbol19,
    objArbol20,objArbol21,objArbol22,objArbol23,objArbol24,objArbol25,objArbol26,objArbol27,
    objArbol28,objArbol29,objArbol30,objArbol31,objArbol32,objArbol33,objArbol34,objArbol35,
    objArbol36,objArbol37,objArbol38,objArbol39,objArbol40,objArbol41,objArbol42,
    objArbol43,objArbol44,objArbol45,objArbol46,objArbol47,objArbol48,objArbol49,
    objArbol50
    };
Insert listArbol;


/*
List<Arbol__c> listaArboles = [SELECT Id, Name FROM Arbol__c WHERE NAME LIKE 'a%'];
	DELETE listaArboles; 

List<Arbol__c> listaArboles = [SELECT Id, Name FROM Arbol__c WHERE NAME LIKE 'p%' LIMIT 7];
	DELETE listaArboles; 


*/