-- Creacion de Fabricantes
insert into Fabricante	(idFabricante,fabricante)
				values	(1,'Samsung'),	
						(2,'Mediatek');
-- Creación de Microprocesadores
insert into Microprocesador	(idMicroprocesador,idFabricante,lanzamiento,nucleos,velocidad)
					values	(1,2,'2019/6/25',8,820);
-- Creación de Camaras
insert into Camara	(idCamara,idFabricante,megapixeles,apertura)
			values	(1,1,48,2.0);
-- Creación de Sistemas Operativos
insert into SistemaOperativo (idSO,nombre,version,lanzamiento)
					values	(1,'Android 10',2.5,'2019/9/3');
-- Creación de Modelos
insert into Modelo	(idModelo,idFabricante,idCamara,idMicroprocesador,idSO,modelo,rom,ram,peso,altura,capacidadSD,ancho,profundidad)
			values	(1,1,1,1,1,'A31',128,6,185,159.3,64,73.1,8.6);
-- Creación de Celulares
insert into Celular	(IMEI,idModelo)
			values	(1,1);
