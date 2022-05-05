USE Cellworld;

START TRANSACTION;
	-- Creacion de Fabricantes
	insert into Fabricante	(idFabricante,fabricante)
					values	(1,'Samsung'),	
							(2,'Mediatek');
	-- Creación de Microprocesadores
	insert into Microprocesador	(idMicroprocesador,idFabricante,lanzamiento,nucleos,velocidad)
						values	(1,2,'2019/6/25',8,820),
								(2,1,'2015/3/18',8,600),
								(3,1,'2019/4/5',8,1.6);
	-- Creación de Camaras
	insert into Camara	(idCamara,idFabricante,megapixeles,apertura)
				values	(1,1,48,2.0),
						(2,1,13,0.28),
						(3,1,13,1.9);
	-- Creación de Sistemas Operativos
	insert into SistemaOperativo (idSO,nombre,version,lanzamiento)
						values	(1,'Android 10',2.5,'2019/9/3'),
								(2,'Andoid 5.1.1',1.5,'2016/4/21'),
								(3,'Android 9.0', 3.1,'2018/8/6' );

	-- Creación de Modelos
	insert into Modelo	(idModelo,idFabricante,idCamara,idMicroprocesador,idSO,modelo,rom,ram,peso,altura,capacidadSD,ancho,profundidad)
				values	(1,1,1,1,1,'A31',128,6,185,159.3,64,73.1,8.6),
						(2,1,2,2,2,'J700M',16,1.5,171,152.2,5.0,7.5,5.5),
						(3,1,3,3,3,'SM-A205F',32,3,169,158.4,5.1,74.7,7.8);
	-- Creación de Celulares
	insert into Celular	(idModelo)
				values	(1),
						(2),
						(3);
COMMIT;