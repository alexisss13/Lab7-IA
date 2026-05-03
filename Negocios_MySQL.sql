-- Script SQL para MySQL/phpMyAdmin
-- Base de datos: Negocios

-- Crear base de datos
CREATE DATABASE IF NOT EXISTS Negocios;
USE Negocios;

-- Tabla CATEGORIA
CREATE TABLE CATEGORIA (
  IdCategoria INT PRIMARY KEY AUTO_INCREMENT,
  NombreCategoria VARCHAR(15) NOT NULL,
  Descripcion TEXT
);

-- Insertar categorías
INSERT INTO CATEGORIA (NombreCategoria, Descripcion) VALUES
('Bebidas', 'Gaseosas, cafe, te, cervezas y maltas'),
('Condimentos', 'Salsas dulces y picantes, delicias, comida para untar y aderezos'),
('Reposteria', 'Postres, dulces y pan dulce'),
('Lacteos', 'Quesos'),
('Granos/Cereales', 'Pan, galletas, pasta y cereales'),
('Carnes', 'Carnes preparadas'),
('Frutas/Verduras', 'Frutas secas y queso de soja'),
('Pescado/Marisco', 'Pescados, mariscos y algas');

-- Tabla PAIS
CREATE TABLE PAIS (
  Idpais INT PRIMARY KEY AUTO_INCREMENT,
  NombrePais VARCHAR(40) NOT NULL
);

-- Insertar países
INSERT INTO PAIS (NombrePais) VALUES
('Peru'),
('Argentina'),
('Chile'),
('USA'),
('España'),
('Francia'),
('Colombia'),
('Canada'),
('China');

-- Tabla CLIENTE
CREATE TABLE CLIENTE (
  IdCliente VARCHAR(5) PRIMARY KEY,
  NombreCia VARCHAR(40) NOT NULL,
  Direccion VARCHAR(60) NOT NULL,
  idpais INT NOT NULL,
  Telefono VARCHAR(24) NOT NULL,
  Estado CHAR(1) NOT NULL DEFAULT 'A',
  FOREIGN KEY (idpais) REFERENCES PAIS(Idpais)
);

-- Insertar clientes
INSERT INTO CLIENTE VALUES('ALFKI', 'Alfreds Futterkiste', 'Obere Str. 57', 2, '030-0074321','A');
INSERT INTO CLIENTE VALUES('ANATR', 'Ana Trujillo Emparedados y helados', 'Avda. de la Constitucion 2222', 5, '(5) 555-4729','A');
INSERT INTO CLIENTE VALUES('ANTON', 'Antonio Moreno Taqueria','Mataderos  2312', 5, '(5) 555-3932','A');
INSERT INTO CLIENTE VALUES('AROUT', 'Around the Horn','120 Hanover Sq.', 4, '(71) 555-7788','A');
INSERT INTO CLIENTE VALUES('BERGS', 'Berglunds snabbköp','Berguvsvägen  8', 6, '0921-12 34 65','A');
INSERT INTO CLIENTE VALUES('BLAUS', 'Blauer See Delikatessen', 'Forsterstr. 57', 1, '0621-08460','A');
INSERT INTO CLIENTE VALUES('BLONP', 'Blondel père et fils', '24, place Kleber Estrasburgo',8, '88.60.15.31','A');
INSERT INTO CLIENTE VALUES('BOLID', 'Bolido Comidas preparadas', 'C/ Araquil, 67', 9,  '(91) 555 91 99','A');
INSERT INTO CLIENTE VALUES('BONAP', 'Bon app', '12, rue des Bouchers', 1, '91.24.45.41','A');
INSERT INTO CLIENTE VALUES('BOTTM', 'Bottom-Dollar Markets', '23 Tsawassen Blvd.',3, '(604) 555-3745','A');
INSERT INTO CLIENTE VALUES('BSBEV', 'B\s Beverages',  'Fauntleroy Circus', 9, '(71) 555-1212','A');
INSERT INTO CLIENTE VALUES('CACTU', 'Cactus Comidas para llevar', 'Cerrito 333', 2, '(1) 135-4892','A');
INSERT INTO CLIENTE VALUES('CENTC', 'Centro comercial Moctezuma','Sierras de Granada 9993', 8, '(5) 555-7293','A');
INSERT INTO CLIENTE VALUES('CHOPS', 'Chop-suey Chinese', 'Hauptstr. 29', 1, '','A');
INSERT INTO CLIENTE VALUES('COMMI', 'Comercio Mineiro', 'Av. dos Lusiadas, 23', 4, '','A');
INSERT INTO CLIENTE VALUES('CONSH', 'Consolidated Holdings', 'Berkeley Gardens 12  Brewery', 5, '(71) 555-2282','A');
INSERT INTO CLIENTE VALUES('DRACD', 'Drachenblut Delikatessen', 'Walserweg 21',6, '0241-059428','A');
INSERT INTO CLIENTE VALUES('DUMON', 'Du monde entier', '67, rue des Cinquante Otages', 7, '40.67.89.89','A');
INSERT INTO CLIENTE VALUES('EASTC', 'Eastern Connection', '35 King George', 5, '(71) 555-3373','A');
INSERT INTO CLIENTE VALUES('ERNSH', 'Ernst Handel', 'Kirchgasse 6', 1, '7675-3426','A');
INSERT INTO CLIENTE VALUES('FAMIA', 'Familia Arquibaldo', 'Rua Oros, 92', 4,  '(11) 555-9857','A');
INSERT INTO CLIENTE VALUES('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'C/ Moralzarzal, 86',3, '(91) 555 55 93','A');
INSERT INTO CLIENTE VALUES('FOLIG', 'Folies gourmandes',  '184, chaussee de Tournai',9, '20.16.10.17','A');
INSERT INTO CLIENTE VALUES('FOLKO', 'Folk och fä HB', 'Åkergatan 24', 3, '','A');
INSERT INTO CLIENTE VALUES('FRANK', 'Frankenversand','Berliner Platz 43', 1, '089-0877451','A');
INSERT INTO CLIENTE VALUES('FRANR', 'France restauration', '54, rue Royale', 8, '40.32.21.20','A');
INSERT INTO CLIENTE VALUES('FRANS', 'Franchi S.p.A.', 'Via Monte Bianco 34', 1, '011-4988261','A');
INSERT INTO CLIENTE VALUES('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Jardim das rosas n. 32', 8, '(1) 354-2535','A');
INSERT INTO CLIENTE VALUES('GALED', 'Galeria del gastronomo', 'Rambla de Cataluña, 23', 4, '(93) 203 4561','A');
INSERT INTO CLIENTE VALUES('GODOS', 'Godos Cocina Tipica', 'C/ Romero, 33', 7, '','A');
INSERT INTO CLIENTE VALUES('GOURL', 'Gourmet Lanchonetes', 'Av. Brasil, 442', 8, '(11) 555-9482','A');
INSERT INTO CLIENTE VALUES('GREAL', 'Great Lakes Food Market', '2732 Baker Blvd.', 1, '(503) 555-7555','A');
INSERT INTO CLIENTE VALUES('GROSR', 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes',2, '(2) 283-3397','A');
INSERT INTO CLIENTE VALUES('HANAR', 'Hanari Carnes', 'Rua do Paço, 67', 1,'(21) 555-8765','A');
INSERT INTO CLIENTE VALUES('HILAA', 'HILARIoN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 8, '(5) 555-1948','A');
INSERT INTO CLIENTE VALUES('HUNGC', 'Hungry Coyote Import Store', 'City Center Plaza 516 Main St.', 9, '(503) 555-2376','A');
INSERT INTO CLIENTE VALUES('HUNGO', 'Hungry Owl All-Night Grocers', '8 Johnstown Road', 5,'2967 3333','A');
INSERT INTO CLIENTE VALUES('ISLAT', 'Island Trading','Garden House Crowther Way', 3,'','A');
INSERT INTO CLIENTE VALUES('KOENE', 'Königlich Essen', 'Maubelstr. 90', 7,'0555-09876','A');
INSERT INTO CLIENTE VALUES('LACOR', 'La corne deabondance', '67, avenue de Europe', 9, '30.59.84.10','A');
INSERT INTO CLIENTE VALUES('LAMAI', 'La maison de Asie', '1 rue Alsace-Lorraine', 2, '61.77.61.11','A');
INSERT INTO CLIENTE VALUES('LAUGB', 'Laughing Bacchus Wine Cellars',  '1900 Oak St.', 7, '(604) 555-7293','A');
INSERT INTO CLIENTE VALUES('LAZYK', 'Lazy K Kountry Store',  '12 Orchestra Terrace', 5, '(509) 555-6221','A');
INSERT INTO CLIENTE VALUES('LEHMS', 'Lehmanns Marktstand',  'Magazinweg 7', 4, '069-0245874','A');
INSERT INTO CLIENTE VALUES('LETSS', 'Lets Stop N Shop',  '87 Polk St. Suite 5',1, '','A');
INSERT INTO CLIENTE VALUES('LILAS', 'LILA-Supermercado',  'Carrera 52 con Ave. Bolivar #65-98 Llano Largo',8, '(9) 331-7256','A');
INSERT INTO CLIENTE VALUES('LINOD', 'LINO-Delicateses',  'Ave. 5 de Mayo Porlamar', 2, '(8) 34-93-93','A');
INSERT INTO CLIENTE VALUES('LONEP', 'Lonesome Pine Restaurant',  '89 Chiaroscuro Rd.', 1, '(503) 555-9646','A');
INSERT INTO CLIENTE VALUES('MAGAA', 'Magazzini Alimentari Riuniti',  'Via Ludovico il Moro 22', 7, '035-640231','A');
INSERT INTO CLIENTE VALUES('MAISD', 'Maison Dewey',  'Rue Joseph-Bens 532', 3, '(02) 201 24 68','A');
INSERT INTO CLIENTE VALUES('MEREP', 'Mère Paillarde',  '43 rue St. Laurent', 6, '(514) 555-8055','A');
INSERT INTO CLIENTE VALUES('MORGK', 'Morgenstern Gesundkost',  'Heerstr. 22', 9,  '','A');
INSERT INTO CLIENTE VALUES('NORTS', 'North/South',  'South House 300 Queensbridge', 5,'(71) 555-2530','A');
INSERT INTO CLIENTE VALUES('OCEAN', 'Oceano Atlantico Ltda.',  'Ing. Gustavo Moncada 8585 Piso 20-A', 1, '(1) 135-5535','A');
INSERT INTO CLIENTE VALUES('OLDWO', 'Old World Delicatessen',  '2743 Bering St.', 4,  '(907) 555-2880','A');
INSERT INTO CLIENTE VALUES('OTTIK', 'Ottilies Käseladen',  'Mehrheimerstr. 369', 3, '0221-0765721','A');
INSERT INTO CLIENTE VALUES('PARIS', 'Paris specialites',  '265, boulevard Charonne', 8,'(1) 42.34.22.77','A');
INSERT INTO CLIENTE VALUES('PERIC', 'Pericles Comidas clasicas',  'Calle Dr. Jorge Cash 321', 3,'(5) 545-3745','A');
INSERT INTO CLIENTE VALUES('PICCO', 'Piccolo und mehr',  'Geislweg 14', 2, '6562-9723','A');
INSERT INTO CLIENTE VALUES('PRINI', 'Princesa Isabel Vinhos',  'Estrada da saúde n. 58', 4, '','A');
INSERT INTO CLIENTE VALUES('QUEDE', 'Que Delicia',  'Rua da Panificadora, 12', 4, '(21) 555-4545','A');
INSERT INTO CLIENTE VALUES('QUEEN', 'Queen Cozinha',  'Alameda dos Canários, 891', 9, '','A');
INSERT INTO CLIENTE VALUES('QUICK', 'QUICK-Stop', 'Taucherstraße 10', 6,'','A');
INSERT INTO CLIENTE VALUES('RANCH', 'Rancho grande',  'Av. del Libertador 900', 1, '(1) 123-5556','A');
INSERT INTO CLIENTE VALUES('RATTC', 'Rattlesnake Canyon Grocery',  '2817 Milton Dr.', 1, '(505) 555-3620','A');
INSERT INTO CLIENTE VALUES('REGGC', 'Reggiani Caseifici',  'Strada Provinciale 124', 3, '0522-556722','A');
INSERT INTO CLIENTE VALUES('RICAR', 'Ricardo Adocicados',  'Av. Copacabana, 267', 7, '','A');
INSERT INTO CLIENTE VALUES('RICSU', 'Richter Supermarkt',  'Grenzacherweg 237', 3,'','A');
INSERT INTO CLIENTE VALUES('ROMEY', 'Romero y tomillo',  'Gran Via, 1', 9, '(91) 745 6210','A');
INSERT INTO CLIENTE VALUES('SANTG', 'Sante Gourmet',  'Erling Skakkes gate 78', 2,  '07-98 92 47','A');
INSERT INTO CLIENTE VALUES('SAVEA', 'Save-a-lot Markets', '187 Suffolk Ln.', 5,  '(208) 555-8097','A');
INSERT INTO CLIENTE VALUES('SEVES', 'Seven Seas Imports', '90 Wadhurst Rd.', 8,  '(71) 555-5646','A');
INSERT INTO CLIENTE VALUES('SIMOB', 'Simons bistro', 'Vinbæltet 34', 6, '31 13 35 57','A');
INSERT INTO CLIENTE VALUES('SPECD', 'Specialites du monde', '25, rue Lauriston', 3, '(1) 47.55.60.20','A');
INSERT INTO CLIENTE VALUES('SPLIR', 'Split Rail Beer & Ale', 'P.O. Box 555', 4, '(307) 555-6525','A');
INSERT INTO CLIENTE VALUES('SUPRD', 'Suprêmes delices', 'Boulevard Tirou, 255', 9,  '(071) 23 67 22 21','A');
INSERT INTO CLIENTE VALUES('THEBI', 'The Big Cheese', '89 Jefferson Way Suite 2', 3,  '','A');
INSERT INTO CLIENTE VALUES('THECR', 'The Cracker Box','55 Grizzly Peak Rd.', 7,  '(406) 555-8083','A');
INSERT INTO CLIENTE VALUES('TOMSP', 'Toms Spezialitäten', 'Luisenstr. 48', 4, '0251-035695','A');
INSERT INTO CLIENTE VALUES('TORTU', 'Tortuga Restaurante', 'Avda. Azteca 123', 6, '','A');
INSERT INTO CLIENTE VALUES('TRADH', 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 9,'(11) 555-2168','A');
INSERT INTO CLIENTE VALUES('TRAIH', 'Trails Head Gourmet Provisioners','722 DaVinci Blvd.', 1,  '(206) 555-2174','A');
INSERT INTO CLIENTE VALUES('VAFFE', 'Vaffeljernet','Smagsløget 45', 3, '86 22 33 44','A');
INSERT INTO CLIENTE VALUES('VICTE', 'Victuailles en stock','2, rue du Commerce', 7, '78.32.54.87','A');
INSERT INTO CLIENTE VALUES('VINET', 'Vins et alcools Chevalier','59 rue de lAbbaye', 5, '26.47.15.11','A');
INSERT INTO CLIENTE VALUES('WANDK', 'Die Wandernde Kuh','Adenauerallee 900', 8, '0711-035428','A');
INSERT INTO CLIENTE VALUES('WARTH', 'Wartian Herkku', 'Torikatu 38', 2, '981-443655','A');
INSERT INTO CLIENTE VALUES('WELLI', 'Wellington Importadora', 'Rua do Mercado, 12', 5, '','A');
INSERT INTO CLIENTE VALUES('WHITC', 'White Clover Markets','305 - 14th Ave. S. Suite 3B', 3, '(206) 555-4115','A');
INSERT INTO CLIENTE VALUES('WILMK', 'Wilman Kala','Keskuskatu 45', 7, '90-224 8858','A');
INSERT INTO CLIENTE VALUES('WOLZA', 'Wolski  Zajazd', 'ul. Filtrowa 68', 2, '(26) 642-7012','A');

-- Tabla PROVEEDOR
CREATE TABLE PROVEEDOR (
  IdProveedor INT PRIMARY KEY AUTO_INCREMENT,
  NombreCia VARCHAR(40) NOT NULL,
  NombreContacto VARCHAR(30) NOT NULL,
  CargoContacto VARCHAR(30) NOT NULL,
  Direccion VARCHAR(60) NOT NULL,
  idpais INT NOT NULL,
  Telefono VARCHAR(24) NOT NULL,
  Fax VARCHAR(24) NOT NULL,
  FOREIGN KEY (idpais) REFERENCES PAIS(Idpais)
);

-- Insertar proveedores
INSERT INTO PROVEEDOR (NombreCia, NombreContacto, CargoContacto, Direccion, idpais, Telefono, Fax) VALUES
('Exotic Liquids', 'Charlotte Cooper', 'Gerente de compras', '49 Gilbert St.', 3, '(171) 555-2222', ''),
('New Orleans Cajun Delights', 'Shelley Burke', 'Administrador de pedidos', 'P.O. Box 78934',8,'(100) 555-4822', ''),
('Grandma Kellys Homestead', 'Regina Murphy', 'Representante de ventas', '707 Oxford Rd.', 1, '(313) 555-5735', '(313) 555-3349'),
('Tokyo Traders', 'Yoshi Nagase', 'Gerente de marketing', '9-8 Sekimai Musashino-shi', 7, '(03) 3555-5011', ''),
('Cooperativa de Quesos Las Cabras', 'Antonio del Valle Saavedra', 'Administrador de exportaciones', 'Calle del Rosal 4',7, '(98) 598 76 54', ''),
('Mayumis', 'Mayumi Ohno', 'Representante de marketing', '92 Setsuko Chuo-ku',4, '(06) 431-7877', ''),
('Pavlova, Ltd.', 'Ian Devling', 'Gerente de marketing', '74 Rose St. Moonie Ponds',8, '(03) 444-2343', '(03) 444-6588'),
('Specialty Biscuits, Ltd.', 'Peter Wilson', 'Representante de ventas', '29 Kings Way', 3, '(161) 555-4448', ''),
('PB Knäckebröd AB', 'Lars Peterson', 'Agente de ventas', 'Kaloadagatan 13', 9,'031-987 65 43', '031-987 65 91'),
('Refrescos Americanas LTDA', 'Carlos Diaz', 'Gerente de marketing', 'Av. das Americanas 12.890', 3, '(11) 555 4640', ''),
('Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Gerente de ventas', 'Tiergartenstraße 5', 2, '(010) 9984510', ''),
('Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Ger. marketing internacional', 'Bogenallee 51', 7, '(069) 992755', ''),
('Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coordinador de mercados', 'Frahmredder 112a', 2, '(04721) 8714', ''),
('Formaggi Fortini s.r.l.', 'Elio Rossi', 'Representante de ventas', 'Viale Dante, 75', 6, '(0544) 60323', '(0544) 60603'),
('Norske Meierier', 'Beate Vileid', 'Gerente de marketing', 'Hatlevegen 5', 6, '(0)2-953010', ''),
('Bigfoot Breweries', 'Cheryl Saylor', 'Repr. de cuentas regional', '3400 - 8th Avenue Suite 210', 9, '(503) 555-9931', ''),
('Svensk Sjöföda AB', 'Michael Björn', 'Representante de ventas', 'Brovallav gen 231', 5, '08-123 45 67', ''),
('Aux joyeux ecclesiastiques', 'Guylène Nodier', 'Gerente de ventas', '203, Rue des Francs-Bourgeois', 8, '(1) 03.83.00.68', '(1) 03.83.00.62'),
('New England Seafood Cannery', 'Robb Merchant', 'Agente de cuentas al por mayor', 'Order Processing Dept. 2100 Paul Revere Blvd.', 4,  '(617) 555-3267', '(617) 555-3389'),
('Leka Trading', 'Chandra Leka', 'Propietario', '471 Serangon Loop, Suite #402',  1,  '555-8787', ''),
('Lyngbysild', 'Niels Petersen', 'Gerente de ventas', 'Lyngbysild Fiskebakken 10', 8, '43844108', '43844115'),
('Zaanse Snoepfabriek', 'Dirk Luchte', 'Gerente de contabilidad', 'Verkoop Rijnweg 22', 8, '(12345) 1212', '(12345) 1210'),
('Karkki Oy', 'Anne Heikkonen', 'Gerente de produccion', 'Valtakatu 12', 1,  '(953) 10956', ''),
('Gday, Mate', 'Wendy Mackenzie', 'Representante de ventas', '170 Prince Edward Parade Hunters Hill', 2,  '(02) 555-5914', '(02) 555-4873'),
('Ma Maison', 'Jean-Guy Lauzon', 'Gerente de marketing', '2960 Rue St. Laurent', 4,  '(514) 555-9022', ''),
('Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Administrador de pedidos', 'Via dei Gelsomini, 153', 8, '(089) 6547665', '(089) 6547667'),
('Escargots Nouveaux', 'Marie Delamare', 'Gerente de ventas', '22, rue H. Voiron', 9,  '', ''),
('Gai pâturage', 'Eliane Noz', 'Representante de ventas', 'Bat. B 3, rue des Alpes', 7, '38.76.98.06', '38.76.98.58'),
('Forêts derables', 'Chantal Goulet', 'Gerente de contabilidad', '148 rue Chasseur', 3, '(514) 555-2955', '(514) 555-2921');

-- Tabla PRODUCTO
CREATE TABLE PRODUCTO (
  IdProducto INT PRIMARY KEY AUTO_INCREMENT,
  NombreProducto VARCHAR(40) NOT NULL,
  IdProveedor INT NOT NULL,
  IdCategoria INT NOT NULL,
  umedida VARCHAR(100),
  PrecioUnidad DECIMAL(10,0) NOT NULL,
  UnidadesEnExistencia SMALLINT NOT NULL,
  FOREIGN KEY (IdProveedor) REFERENCES PROVEEDOR(IdProveedor),
  FOREIGN KEY (IdCategoria) REFERENCES CATEGORIA(IdCategoria)
);

-- Insertar productos
INSERT INTO PRODUCTO (NombreProducto, IdProveedor, IdCategoria, umedida, PrecioUnidad, UnidadesEnExistencia) VALUES
('Te Dharamsala', 1, 1,'12 frascos' ,'18', '39'),
('Cerveza tibetana Barley', 1, 1,'botella', '19', '17'),
('Sirope de regaliz', 1, 2,'botella', '10', '13'),
('Especias Cajun del chef Anton', 2, 2,'botella', 22, '53'),
('Mezcla Gumbo del chef Anton', 2, 2,'botella', '21', '0'),
('Mermelada de grosellas de la abuela', 3, 2,'botella','25', '120'),
('Peras secas organicas del tio Bob', 3, 7,'botella', '30', '15'),
('Salsa de arandanos Northwoods', 3, 2,'botella', '40', '6'),
('Buey Mishi Kobe', 4, 6, '18 - paq. 500 g', '97', '29'),
('Pez espada', 4, 8, '12 - frascos 200 ml', '31', '31'),
('Queso Cabrales', 5, 4, 'paq. 1 kg', 22, '30'),
('Queso Manchego La Pastora', 5, 4, '10 - paq. 500 g', '38', '86'),
('Algas Konbu', 6, 8, 'caja 2 kg', '6', '24'),
('Cuajada de judias', 6, 7, '40 - paq. 100 g', '23', '35'),
('Salsa de soja baja en sodio', 6, 2, '24 - bot. 250 ml', '15', '39'),
('Postre de merengue Pavlova', 7, 3, '32 - cajas 500 g', '17', '29'),
('Cordero Alice Springs', 7, 6, '20 - latas 1 kg', '39', '0'),
('Langostinos tigre Carnarvon', 7, 8, 'paq. 16 kg', '62', 42),
('Pastas de te de chocolate', 8, 3, '10 cajas x 12 piezas', '9', '25'),
('Mermelada de Sir Rodneys', 8, 3, '30 cajas regalo', '81', '40'),
('Bollos de Sir Rodneys', 8, 3, '24 paq. x 4 piezas', '10', '40'),
('Pan de centeno crujiente estilo Gustafs', 9, 5, '24 - paq. 500 g', '21', '104'),
('Pan fino', 9, 5, '12 - paq. 250 g', '9', '61'),
('Refresco Guarana Fantastica', 10, 1, '12 - latas 355 ml', '4', 20),
('Crema de chocolate y nueces NuNuCa', 11, 3, '20 - vasos  450 g', 14, '76'),
('Ositos de goma Gumbär', 11, 3, '100 - bolsas 250 g', '31', '15'),
('Chocolate Schoggi', 11, 3, '100 - piezas 100 g', '43', '49'),
('Col fermentada Rössle', 12, 7, '25 - latas 825 g', '45', '26'),
('Salchicha Thüringer', 12, 6, '50 bolsas x 30 salch', '123', '0'),
('Arenque blanco del noroeste', 13, 8, '10 - vasos 200 g', '25', '10'),
('Queso gorgonzola Telino', 14, 4, '12 - paq. 100 g', '12', '0'),
('Queso Mascarpone Fabioli', 14, 4, '24 - paq. 200 g', '32', '9'),
('Queso de cabra', 15, 4, '500 g', '2', '112'),
('Cerveza Sasquatch', 16, 1, '24 - bot. 12 l', 14, '111'),
('Cerveza negra Steeleye', 16, 1, '24 - bot. 12 l', '18', 20),
('Escabeche de arenque', 17, 8, '24 - frascos 250 g', '19', '112'),
('Salmon ahumado Gravad', 17, 8, '12 - paq. 500 g', '26', 11),
('Vino Côte de Blaye', 18, 1, '12 - bot. 75 cl', '263', '17'),
('Licor verde Chartreuse', 18, 1, '750 cc por bot.', '18', '69'),
('Carne de cangrejo de Boston', 19, 8, '24 - latas 4 l', '18', '123'),
('Crema de almejas estilo Nueva Inglaterra', 19, 8, '12 - latas 12 l', '9', '85'),
('Tallarines de Singapur', 20, 5, '32 - 1 kg paq.', 14, '26'),
('Cafe de Malasia', 20, 1, '16 - latas 500 g', '46', '17'),
('Azúcar negra Malacca', 20, 2, '20 - bolsas 2 kg', '19', '27'),
('Arenque ahumado', 21, 8, 'paq. 1k', '9', '5'),
('Arenque salado', 21, 8, '4 - vasos 450 g', '12', '95'),
('Galletas Zaanse', 22, 3, '10 - cajas 4 l', '9', '36'),
('Chocolate holandes', 22, 3, '10 paq.', '12', '15'),
('Regaliz', 23, 3, '24 - paq. 50 g', 20, '10'),
('Chocolate blanco', 23, 3, '12 - barras 100 g', '16', 65),
('Manzanas secas Manjimup', 24, 7, '50 - paq. 300 g', '53', 20),
('Cereales para Filo', 24, 5, '16 - cajas 2 kg', '7', '38'),
('Empanada de carne', 24, 6, '48 porc.', '32', '0'),
('Empanada de cerdo', 25, 6, '16 tartas', '7', '21'),
('Pate chino', 25, 6, '24 cajas x 2 tartas', '24', '115'),
('Gnocchi de la abuela Alicia', 26, 5, '24 - paq. 250 g', '38', '21'),
('Raviolis Angelo', 26, 5, '24 - paq. 250 g', '19', '36'),
('Caracoles de Borgoña', 27, 8, '24 porc.', '13', '62'),
('Raclet de queso Courdavault', 28, 4, 'paq. 5 kg', '55', '79'),
('Camembert Pierrot', 28, 4, '15 - paq. 300 g', '34', '19'),
('Sirope de arce', 29, 2, '24 - bot. 500 ml', '28', '113'),
('Tarta de azúcar', 29, 3, '48 tartas', '49', '17'),
('Sandwich de vegetales', 7, 2, '15 - frascos 625 g', '43', '24'),
('Bollos de pan de Wimmer', 12, 5, '20 bolsas x 4 porc.', '33', 22),
('Salsa de pimiento picante de Luisiana', 2, 2, '32 - bot. 8 l', '21', '76'),
('Especias picantes de Luisiana', 2, 2, '24 - frascos 8 l', '17', '4'),
('Cerveza Laughing Lumberjack', 16, 1, '24 - bot. 12 l', 14, '52'),
('Barras de pan de Escocia', 8, 3, '10 cajas x 8 porc.', '12', '6'),
('Queso Gudbrandsdals', 15, 4, 'paq. 10 kg', '36', '26'),
('Cerveza Outback', 7, 1, '24 - bot. 355 ml', '15', '15'),
('Crema de queso Flötemys', 15, 4, '10 - paq. 500 g', '21', '26'),
('Queso Mozzarella Giovanni', 14, 4, '24 - paq. 200 g', '34', 14),
('Caviar rojo', 17, 8, '24 - frascos150 g', '15', '101'),
('Queso de soja Longlife', 4, 7, 'paq. 5 kg', '10', '4'),
('Cerveza Klosterbier Rhönbräu', 12, 1, '24 - bot. 0,5 l', '7', '125'),
('Licor Cloudberry', 23, 1, '500 ml', '18', 57),
('Salsa verde original Frankfurter', 12, 2, '12 cajas', '13', '32');

-- Tabla DISTRITO
CREATE TABLE DISTRITO(
  idDistrito INT PRIMARY KEY AUTO_INCREMENT,
  NomDistrito VARCHAR(50) NOT NULL
);

-- Insertar distritos
INSERT INTO DISTRITO (NomDistrito) VALUES
('Trujillo'),
('Victor Larco'),
('La Esperanza'),
('El Porvenir');

-- Tabla CARGO
CREATE TABLE CARGO(
  idCargo INT PRIMARY KEY AUTO_INCREMENT,
  NomCargo VARCHAR(50) NOT NULL
);

-- Insertar cargos
INSERT INTO CARGO (NomCargo) VALUES
('Vendedor'),
('Supervisor');

-- Tabla EMPLEADO
CREATE TABLE EMPLEADO (
  IdEmpleado INT PRIMARY KEY AUTO_INCREMENT,
  ApeEmpleado VARCHAR(50) NOT NULL,
  NomEmpleado VARCHAR(50) NOT NULL,
  DirEmpleado VARCHAR(60) NOT NULL,
  idDistrito INT NOT NULL,
  fonoEmpleado VARCHAR(15) NULL,
  idCargo INT NOT NULL,
  Estado CHAR(1),
  FOREIGN KEY (idDistrito) REFERENCES DISTRITO(idDistrito),
  FOREIGN KEY (idCargo) REFERENCES CARGO(idCargo)
);

-- Insertar empleados
INSERT INTO EMPLEADO (ApeEmpleado, NomEmpleado, DirEmpleado, idDistrito, fonoEmpleado, idCargo, Estado) VALUES
('Davolio', 'Nancy','Calle Las Magnolias 123',2,'6573344',1,'A'),
('Fuller', 'Andrew', 'Av Abancay 234', 1,'98788766',1,'A'),
('Leverling', 'Janet','Av. Riva Aguero 233', 4,'5664555',1,'A'),
('Peacock', 'Margaret', 'Calle las flores 411', 2,'980523344',1,'A'),
('Buchanan', 'Steven','Av. Brasil 222',3,'6776566',2,'A'),
('Suyama', 'Michael','Calle Zafiro 344',1,'8997877',1,'A'),
('King', 'Robert','Jr Puni 322',1, '99876677',1,'A'),
('Callahan', 'Laura', 'Dinthilac 123',2,'90098999',1,'A'),
('Dodsworth', 'Anne','Av Los fresnos 2334',3,'98877888',1,'A');

-- Tabla PEDIDO
CREATE TABLE PEDIDO (
  IdPedido INT PRIMARY KEY,
  IdCliente VARCHAR(5),
  IdEmpleado INT NOT NULL,
  FechaPedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FechaEntrega DATETIME NULL,
  FechaEnvio DATETIME NULL,
  Envio CHAR(1) NULL DEFAULT '0',
  Cargo DECIMAL(10,0) NULL,
  Destinatario VARCHAR(40) NULL,
  DireccionDestinatario VARCHAR(60) NULL,
  CiudadDestinatario VARCHAR(15) NULL,
  RegionDestinatario VARCHAR(15) NULL,
  CodPostalDestinatario VARCHAR(10) NULL,
  PaisDestinatario VARCHAR(15) NULL,
  FOREIGN KEY (IdCliente) REFERENCES CLIENTE(IdCliente),
  FOREIGN KEY (IdEmpleado) REFERENCES EMPLEADO(IdEmpleado)
);

-- Tabla DETALLEPEDIDO
CREATE TABLE DETALLEPEDIDO (
  IdPedido INT NOT NULL,
  IdProducto INT NOT NULL,
  PrecioUnidad DECIMAL(10,0) NOT NULL,
  Cantidad SMALLINT NOT NULL,
  Descuento FLOAT NOT NULL,
  PRIMARY KEY(IdPedido, IdProducto),
  FOREIGN KEY (IdPedido) REFERENCES PEDIDO(IdPedido),
  FOREIGN KEY (IdProducto) REFERENCES PRODUCTO(IdProducto)
);

-- Insertar pedidos (muestra de los primeros 50)
INSERT INTO PEDIDO VALUES
(10248, 'WILMK', 5, '1996-07-04 00:00:00', '1996-08-01 00:00:00', '1996-07-16 00:00:00', '1', 32, 'Wilman Kala', 'Keskuskatu 45', 'Helsinki', '', '21240', 'Finlandia'),
(10249, 'TOMSP', 6, '1996-07-05 00:00:00', '1996-08-16 00:00:00', '1996-07-10 00:00:00', '1', 11, 'Toms Spezialitäten', 'Luisenstr. 48', 'Münster', '', '44087', 'Alemania'),
(10250, 'HANAR', 4, '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-12 00:00:00', '1', 65, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil'),
(10251, 'VICTE', 3, '1996-07-08 00:00:00', '1996-08-05 00:00:00', '1996-07-15 00:00:00', '1', 41, 'Victuailles en stock', '2, rue du Commerce', 'Lyon', '', '69004', 'Francia'),
(10252, 'SUPRD', 4, '1996-07-09 00:00:00', '1996-08-06 00:00:00', '1996-07-11 00:00:00', '1', 51, 'Suprêmes delices', 'Boulevard Tirou, 255', 'Charleroi', '', 'B-6000', 'Belgica'),
(10253, 'HANAR', 3, '1996-07-10 00:00:00', '1996-07-24 00:00:00', '1996-07-16 00:00:00', '1', 58, 'Hanari Carnes', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil'),
(10254, 'CHOPS', 5, '1996-07-11 00:00:00', '1996-08-08 00:00:00', '1996-07-23 00:00:00', '1', 22, 'Chop-suey Chinese', 'Hauptstr. 31', 'Bern', '', '3012', 'Suiza'),
(10255, 'RICSU', 9, '1996-07-12 00:00:00', '1996-08-09 00:00:00', '1996-07-15 00:00:00', '1', 148, 'Richter Supermarkt', 'Starenweg 5', 'Genève', '', '1204', 'Suiza'),
(10256, 'WELLI', 3, '1996-07-15 00:00:00', '1996-08-12 00:00:00', '1996-07-17 00:00:00', '1', 13, 'Wellington Importadora', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil'),
(10257, 'HILAA', 4, '1996-07-16 00:00:00', '1996-08-13 00:00:00', '1996-07-22 00:00:00', '1', 81, 'HILARIoN-Abastos', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristobal', 'Tachira', '5022', 'Venezuela'),
(10258, 'ERNSH', 1, '1996-07-17 00:00:00', '1996-08-14 00:00:00', '1996-07-23 00:00:00', '1', 140, 'Ernst Handel', 'Kirchgasse 6', 'Graz', '', '8010', 'Austria'),
(10259, 'CENTC', 4, '1996-07-18 00:00:00', '1996-08-15 00:00:00', '1996-07-25 00:00:00', '1', 3, 'Centro comercial Moctezuma', 'Sierras de Granada 9993', 'Mexico D.F.', '', '05022', 'Mexico'),
(10260, 'OTTIK', 4, '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-29 00:00:00', '1', 55, 'Ottilies Käseladen', 'Mehrheimerstr. 369', 'Köln', '', '50739', 'Alemania'),
(10261, 'QUEDE', 4, '1996-07-19 00:00:00', '1996-08-16 00:00:00', '1996-07-30 00:00:00', '1', 3, 'Que Delicia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil'),
(10262, 'RATTC', 8, '1996-07-22 00:00:00', '1996-08-19 00:00:00', '1996-07-25 00:00:00', '1', 48, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(10263, 'ERNSH', 9, '1996-07-23 00:00:00', '1996-08-20 00:00:00', '1996-07-31 00:00:00', '1', 146, 'Ernst Handel', 'Kirchgasse 6', 'Graz', '', '8010', 'Austria'),
(10264, 'FOLKO', 6, '1996-07-24 00:00:00', '1996-08-21 00:00:00', '1996-08-23 00:00:00', '1', 3, 'Folk och fä HB', 'Åkergatan 24', 'Bräcke', '', 'S-844 67', 'Suecia'),
(10265, 'BLONP', 2, '1996-07-25 00:00:00', '1996-08-22 00:00:00', '1996-08-12 00:00:00', '1', 55, 'Blondel père et fils', '24, place Kleber', 'Strasbourg', '', '67000', 'Francia'),
(10266, 'WARTH', 3, '1996-07-26 00:00:00', '1996-09-06 00:00:00', '1996-07-31 00:00:00', '1', 25, 'Wartian Herkku', 'Torikatu 38', 'Oulu', '', '90110', 'Finlandia'),
(10267, 'FRANK', 4, '1996-07-29 00:00:00', '1996-08-26 00:00:00', '1996-08-06 00:00:00', '1', 208, 'Frankenversand', 'Berliner Platz 43', 'München', '', '80805', 'Alemania'),
(10268, 'GROSR', 8, '1996-07-30 00:00:00', '1996-08-27 00:00:00', '1996-08-02 00:00:00', '1', 66, 'GROSELLA-Restaurante', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela'),
(10269, 'WHITC', 5, '1996-07-31 00:00:00', '1996-08-14 00:00:00', '1996-08-09 00:00:00', '1', 4, 'White Clover Markets', '1029 - 12th Ave. S.', 'Seattle', 'WA', '98124', 'Estados Unidos'),
(10270, 'WARTH', 1, '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-02 00:00:00', '1', 136, 'Wartian Herkku', 'Torikatu 38', 'Oulu', '', '90110', 'Finlandia'),
(10271, 'SPLIR', 6, '1996-08-01 00:00:00', '1996-08-29 00:00:00', '1996-08-30 00:00:00', '1', 4, 'Split Rail Beer & Ale', 'P.O. Box 555', 'Lander', 'WY', '82520', 'Estados Unidos'),
(10272, 'RATTC', 6, '1996-08-02 00:00:00', '1996-08-30 00:00:00', '1996-08-06 00:00:00', '1', 98, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(10273, 'QUICK', 3, '1996-08-05 00:00:00', '1996-09-02 00:00:00', '1996-08-12 00:00:00', '1', 76, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', '', '01307', 'Alemania'),
(10274, 'VINET', 6, '1996-08-06 00:00:00', '1996-09-03 00:00:00', '1996-08-16 00:00:00', '1', 6, 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', '', '51100', 'Francia'),
(10275, 'MAGAA', 1, '1996-08-07 00:00:00', '1996-09-04 00:00:00', '1996-08-09 00:00:00', '1', 26, 'Magazzini Alimentari Riuniti', 'Via Ludovico il Moro 22', 'Bergamo', '', '24100', 'Italia'),
(10276, 'TORTU', 8, '1996-08-08 00:00:00', '1996-08-22 00:00:00', '1996-08-14 00:00:00', '1', 13, 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mexico D.F.', '', '05033', 'Mexico'),
(10277, 'MORGK', 2, '1996-08-09 00:00:00', '1996-09-06 00:00:00', '1996-08-13 00:00:00', '1', 125, 'Morgenstern Gesundkost', 'Heerstr. 22', 'Leipzig', '', '04179', 'Alemania'),
(10278, 'BERGS', 8, '1996-08-12 00:00:00', '1996-09-09 00:00:00', '1996-08-16 00:00:00', '1', 92, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', '', 'S-958 22', 'Suecia'),
(10279, 'LEHMS', 8, '1996-08-13 00:00:00', '1996-09-10 00:00:00', '1996-08-16 00:00:00', '1', 25, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', '', '60528', 'Alemania'),
(10280, 'BERGS', 2, '1996-08-14 00:00:00', '1996-09-11 00:00:00', '1996-09-12 00:00:00', '1', 8, 'Berglunds snabbköp', 'Berguvsvägen  8', 'Luleå', '', 'S-958 22', 'Suecia'),
(10281, 'ROMEY', 4, '1996-08-14 00:00:00', '1996-08-28 00:00:00', '1996-08-21 00:00:00', '1', 2, 'Romero y tomillo', 'Gran Via, 1', 'Madrid', '', '28001', 'España'),
(10282, 'ROMEY', 4, '1996-08-15 00:00:00', '1996-09-12 00:00:00', '1996-08-21 00:00:00', '1', 12, 'Romero y tomillo', 'Gran Via, 1', 'Madrid', '', '28001', 'España'),
(10283, 'LILAS', 3, '1996-08-16 00:00:00', '1996-09-13 00:00:00', '1996-08-23 00:00:00', '1', 84, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolivar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10284, 'LEHMS', 4, '1996-08-19 00:00:00', '1996-09-16 00:00:00', '1996-08-27 00:00:00', '1', 76, 'Lehmanns Marktstand', 'Magazinweg 7', 'Frankfurt a.M.', '', '60528', 'Alemania'),
(10285, 'QUICK', 1, '1996-08-20 00:00:00', '1996-09-17 00:00:00', '1996-08-26 00:00:00', '1', 76, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', '', '01307', 'Alemania'),
(10286, 'QUICK', 8, '1996-08-21 00:00:00', '1996-09-18 00:00:00', '1996-08-30 00:00:00', '1', 229, 'QUICK-Stop', 'Taucherstraße 10', 'Cunewalde', '', '01307', 'Alemania'),
(10287, 'RICAR', 8, '1996-08-22 00:00:00', '1996-09-19 00:00:00', '1996-08-28 00:00:00', '1', 12, 'Ricardo Adocicados', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brasil'),
(10288, 'REGGC', 4, '1996-08-23 00:00:00', '1996-09-20 00:00:00', '1996-09-03 00:00:00', '1', 7, 'Reggiani Caseifici', 'Strada Provinciale 124', 'Reggio Emilia', '', '42100', 'Italia'),
(10289, 'BSBEV', 7, '1996-08-26 00:00:00', '1996-09-23 00:00:00', '1996-08-28 00:00:00', '1', 22, 'Bs Beverages', 'Fauntleroy Circus', 'London', '', 'EC2 5NT', 'Reino Unido'),
(10290, 'COMMI', 8, '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-03 00:00:00', '1', 79, 'Comercio Mineiro', 'Av. dos Lusiadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil'),
(10291, 'QUEDE', 6, '1996-08-27 00:00:00', '1996-09-24 00:00:00', '1996-09-04 00:00:00', '1', 6, 'Que Delicia', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil'),
(10292, 'TRADH', 1, '1996-08-28 00:00:00', '1996-09-25 00:00:00', '1996-09-02 00:00:00', '1', 1, 'Tradição Hipermercados', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil'),
(10293, 'TORTU', 1, '1996-08-29 00:00:00', '1996-09-26 00:00:00', '1996-09-11 00:00:00', '1', 21, 'Tortuga Restaurante', 'Avda. Azteca 123', 'Mexico D.F.', '', '05033', 'Mexico'),
(10294, 'RATTC', 4, '1996-08-30 00:00:00', '1996-09-27 00:00:00', '1996-09-05 00:00:00', '1', 147, 'Rattlesnake Canyon Grocery', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'Estados Unidos'),
(10295, 'VINET', 2, '1996-09-02 00:00:00', '1996-09-30 00:00:00', '1996-09-10 00:00:00', '1', 1, 'Vins et alcools Chevalier', '59 rue de lAbbaye', 'Reims', '', '51100', 'Francia'),
(10296, 'LILAS', 6, '1996-09-03 00:00:00', '1996-10-01 00:00:00', '1996-09-11 00:00:00', '1', 0, 'LILA-Supermercado', 'Carrera 52 con Ave. Bolivar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela'),
(10297, 'BLONP', 5, '1996-09-04 00:00:00', '1996-10-16 00:00:00', '1996-09-10 00:00:00', '1', 5, 'Blondel père et fils', '24, place Kleber', 'Strasbourg', '', '67000', 'Francia');

-- Nota: Este script contiene una muestra de los datos. 
-- Para el conjunto completo de pedidos, se pueden agregar más registros siguiendo el mismo patrón.
