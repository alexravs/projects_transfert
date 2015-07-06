class ExecuteSqlFileDb < ActiveRecord::Migration
  def change
    execute "CREATE TABLE categories
(
	cat_id        		serial PRIMARY KEY,
	cat_nom       		varchar(25) NOT NULL,
	cat_stat      		integer NOT NULL
);

INSERT INTO categories VALUES(default,'Linge de lit',0);
INSERT INTO categories VALUES(default,'Luminaires',0);
INSERT INTO categories VALUES(default,'Chambres à coucher',0);
INSERT INTO categories VALUES(default,'Accessoires',0);


CREATE TABLE sub_categories
(
	sscat_id      		serial PRIMARY KEY,
	sscat_nom     		varchar(30) NOT NULL,
	sscat_fk_categories integer NOT NULL REFERENCES categories(cat_id),
	sscat_stat    		integer NOT NULL
);

INSERT INTO sub_categories VALUES(default,'Housses de couette',1,0);
INSERT INTO sub_categories VALUES(default,'Lampes de table',2,0);
INSERT INTO sub_categories VALUES(default,'Suspensions',2,0);
INSERT INTO sub_categories VALUES(default,'Gardes-robes',3,0);
INSERT INTO sub_categories VALUES(default,'Lits',3,0);
INSERT INTO sub_categories VALUES(default,'Tringles à vêtements',4,0);
INSERT INTO sub_categories VALUES(default,'Etagères',4,0);
INSERT INTO sub_categories VALUES(default,'Portes de colonne',4,0);

CREATE TABLE products
(
	prod_id        		serial PRIMARY KEY,
	prod_nom      		varchar(20) NOT NULL,
	prod_vignette 		varchar(100) NOT NULL,
	prod_image    		varchar(100) NOT NULL,
	prod_descr_courte   varchar(100) NOT NULL,
	prod_descr_longue   varchar(500) NOT NULL,
	prod_stat     		integer NOT NULL,
	prod_fk_sub_categories integer REFERENCES sub_categories(sscat_id)	
);

INSERT INTO products VALUES(default,'Lonn','lonn_v.jpg','lonn_i.jpg','100% coton','<B>Housse en 100% coton.</B><BR>Plusieurs coloris.<BR>Design : B. Peterson<BR>',0,1);
INSERT INTO products VALUES(default,'Kare','kare_v.jpg','kare_i.jpg','Acier laqué et verre','<B>lampe de table en acier laqué et verre soufflé à la bouche.</B><BR>Diamètre : 16 cm.<BR>Hauteur : 28 cm.<BR>Max 40 W ou ampoule économique de 6 W.<BR>',0,2);
INSERT INTO products VALUES(default,'Porfylit','porfylit_v.jpg','porfylit_i.jpg','Bouleau','<B>Lampe de table en bouleau verni avec abat-jour en verre opalin soufflé à la bouche</B><BR>Diamètre : 12 cm.<BR>Hauteur : 25 cm.<BR>Max 40 W ou ampoule économique de 7 W.<BR>',0,2);
INSERT INTO products VALUES(default,'Takter','takter_v.jpg','takter_i.jpg','Aluminium','<B>Suspension en alluminium laqué.</B><BR>Hauteur réglable.<BR>Diamètre : 30 cm.<BR>Hauteur : 35 cm.<BR>Max 75 W ou ampoule économique de 15 W.<BR>',0,3);
INSERT INTO products VALUES(default,'Pax Nexus','pax_v.gif','pax_i.jpg','Colonne','<B>Elément de base de la colonne.</B><BR>Panneau de particules de 18 cm d''épaisseur.<BR>',0,4);
INSERT INTO products VALUES(default,'Morkedal','morkedal_v.gif','morkedal_i.jpg','Lit','<B>Structure en aggloméré renforcé, avec revêtement en tissu blanc ou lilas et piétement en métal.</B><BR>La tête est conçue pour offri un bon soutien dorsal lorsque vous lisez.<BR>ce lit se marie bien avec des meubles en hêtre ou en bouleau.<BR>',0,5);
INSERT INTO products VALUES(default,'Komplement','komplement_v.jpg','komplement_i.jpg','Acier laqué','<B>Tringle à vêtements en acier laqué gris, pour gardes-robes Pax et Askedal</B><BR>Disponible en différentes largeur.<BR>',0,6);
INSERT INTO products VALUES(default,'Pax Stag','pax_stag_v.jpg','pax_stag_i.jpg','Etagères pour colonne','<B>Etagères (par 2 pièces) pour gardes-robes Pax</B><BR>Disponible en hêtre ou en bouleau et en différentes largeur.<BR>',0,7);
INSERT INTO products VALUES(default,'Pax Drammen','pax_dra_v.jpg','pax_dra_i.jpg','Porte pour colonne','<B>Portes en verre trempé et cadre en aluminium pour les gardes-robes Pax</B><BR>Disponible en différentes largeur.<BR>Charnières incluses.<BR>',0,8);



CREATE TABLE properties
(
	prop_id       		serial PRIMARY KEY,
	prop_nom      		varchar(20) NOT NULL
);

INSERT INTO properties VALUES(default,'Dimensions');
INSERT INTO properties VALUES(default,'Non personnalisable');
INSERT INTO properties VALUES(default,'Largeur');
INSERT INTO properties VALUES(default,'Hauteur');
INSERT INTO properties VALUES(default,'Profondeur');
INSERT INTO properties VALUES(default,'Revêtement');

CREATE TABLE characteristics
(
	car_id        		serial PRIMARY KEY,
	car_fk_products       	integer NOT NULL REFERENCES products(prod_id),
	car_fk_properties     	smallint NOT NULL REFERENCES properties(prop_id),
	car_valeur    		varchar(20)
);

INSERT INTO characteristics VALUES(default,1,1,'150x210');
INSERT INTO characteristics VALUES(default,1,1,'200x200');
INSERT INTO characteristics VALUES(default,1,1,'240x220');
INSERT INTO characteristics VALUES(default,2,2,NULL);
INSERT INTO characteristics VALUES(default,3,2,NULL);
INSERT INTO characteristics VALUES(default,4,2,NULL);
INSERT INTO characteristics VALUES(default,5,3,'50 cm');
INSERT INTO characteristics VALUES(default,5,3,'100 cm');
INSERT INTO characteristics VALUES(default,5,4,'201 cm');
INSERT INTO characteristics VALUES(default,5,4,'236 cm');
INSERT INTO characteristics VALUES(default,5,5,'60 cm');
INSERT INTO characteristics VALUES(default,5,5,'37 cm');
INSERT INTO characteristics VALUES(default,5,6,'Bouleau');
INSERT INTO characteristics VALUES(default,5,6,'Hêtre');
INSERT INTO characteristics VALUES(default,6,1,'167x210 cm');
INSERT INTO characteristics VALUES(default,6,1,'187x210 cm');
INSERT INTO characteristics VALUES(default,6,6,'Blanc');
INSERT INTO characteristics VALUES(default,6,6,'Lilas');
INSERT INTO characteristics VALUES(default,7,3,'50 cm'); 
INSERT INTO characteristics VALUES(default,7,3,'100 cm'); 	
INSERT INTO characteristics VALUES(default,8,3,'50 cm');   
INSERT INTO characteristics VALUES(default,8,3,'100 cm'); 	
INSERT INTO characteristics VALUES(default,8,5,'60 cm');   
INSERT INTO characteristics VALUES(default,8,5,'37 cm');	
INSERT INTO characteristics VALUES(default,8,6,'Bouleau'); 
INSERT INTO characteristics VALUES(default,8,6,'Hêtre');
INSERT INTO characteristics VALUES(default,9,3,'50 cm');
INSERT INTO characteristics VALUES(default,9,3,'100 cm');
INSERT INTO characteristics VALUES(default,9,4,'201 cm');
INSERT INTO characteristics VALUES(default,9,4,'236 cm');




CREATE TABLE prices
(
	pri_id        		serial PRIMARY KEY,
	pri_htva_euro 		decimal(6,3) NOT NULL,
	pri_poids     		decimal(4,2) NULL,
	pri_vol_conditionnement       decimal(3,2) NULL
);

INSERT INTO prices VALUES(default,32.375,0.9,0.1);
INSERT INTO prices VALUES(default,39.875,1.2,0.15);
INSERT INTO prices VALUES(default,49.875,1.4,0.2);
INSERT INTO prices VALUES(default,32.375,1.5,0.2);
INSERT INTO prices VALUES(default,19.875,1.2,0.15);
INSERT INTO prices VALUES(default,49.875,1.8,0.35);

INSERT INTO prices VALUES(default,150,40,1);
INSERT INTO prices VALUES(default,187.375,50,1.5);
INSERT INTO prices VALUES(default,134.875,30,0.8);
INSERT INTO prices VALUES(default,179.875,40,1.2);
INSERT INTO prices VALUES(default,244.875,50,1.8);
INSERT INTO prices VALUES(default,309.925,60,2.1);
INSERT INTO prices VALUES(default,237.375,40,1.5);
INSERT INTO prices VALUES(default,302.375,50,1.7);

INSERT INTO prices VALUES(default,150,40,1);
INSERT INTO prices VALUES(default,187.375,50,1.5);
INSERT INTO prices VALUES(default,134.875,30,0.8);
INSERT INTO prices VALUES(default,179.875,40,1.2);
INSERT INTO prices VALUES(default,244.875,50,1.8);
INSERT INTO prices VALUES(default,309.925,60,2.1);
INSERT INTO prices VALUES(default,237.375,40,1.5);
INSERT INTO prices VALUES(default,302.375,50,1.7);

INSERT INTO prices VALUES(default,374.875,80,2.7);
INSERT INTO prices VALUES(default,399.875,85,2.8);

INSERT INTO prices VALUES(default,374.875,80,2.7);
INSERT INTO prices VALUES(default,399.875,85,2.8);

INSERT INTO prices VALUES(default,5,0.2,0.4);
INSERT INTO prices VALUES(default,5.675,0.25,0.45);

INSERT INTO prices VALUES(default,12.5,0.5,0.5);
INSERT INTO prices VALUES(default,11.25,0.45,0.45);
INSERT INTO prices VALUES(default,18.75,0.7,0.7);
INSERT INTO prices VALUES(default,15,0.65,0.65);

INSERT INTO prices VALUES(default,12.5,0.5,0.5);
INSERT INTO prices VALUES(default,11.25,0.45,0.45);
INSERT INTO prices VALUES(default,18.75,0.7,0.7);
INSERT INTO prices VALUES(default,15,0.65,0.65);

INSERT INTO prices VALUES(default,138.75,12.5,1.65);
INSERT INTO prices VALUES(default,172.375,13.5,1.85);
INSERT INTO prices VALUES(default,222.375,20.5,2.65);
INSERT INTO prices VALUES(default,279.875,23.5,2.85);

CREATE TABLE identifiant_combi
(
	idc_id		serial PRIMARY KEY,
	idc_fk_prices	integer NOT NULL REFERENCES prices(pri_id)
);


INSERT INTO identifiant_combi VALUES(1,1);
INSERT INTO identifiant_combi VALUES(2,2);
INSERT INTO identifiant_combi VALUES(3,3);
INSERT INTO identifiant_combi VALUES(4,4);
INSERT INTO identifiant_combi VALUES(5,5);
INSERT INTO identifiant_combi VALUES(6,6);
INSERT INTO identifiant_combi VALUES(7,7);
INSERT INTO identifiant_combi VALUES(8,8);
INSERT INTO identifiant_combi VALUES(9,9);
INSERT INTO identifiant_combi VALUES(10,10);
INSERT INTO identifiant_combi VALUES(11,11);
INSERT INTO identifiant_combi VALUES(12,12);
INSERT INTO identifiant_combi VALUES(13,13);
INSERT INTO identifiant_combi VALUES(14,14);
INSERT INTO identifiant_combi VALUES(15,15);
INSERT INTO identifiant_combi VALUES(16,16);
INSERT INTO identifiant_combi VALUES(17,17);
INSERT INTO identifiant_combi VALUES(18,18);
INSERT INTO identifiant_combi VALUES(19,19);
INSERT INTO identifiant_combi VALUES(20,20);
INSERT INTO identifiant_combi VALUES(21,21);
INSERT INTO identifiant_combi VALUES(22,22);
INSERT INTO identifiant_combi VALUES(23,23);
INSERT INTO identifiant_combi VALUES(24,24);
INSERT INTO identifiant_combi VALUES(25,25);
INSERT INTO identifiant_combi VALUES(26,26);
INSERT INTO identifiant_combi VALUES(27,27);
INSERT INTO identifiant_combi VALUES(28,28);
INSERT INTO identifiant_combi VALUES(29,29);
INSERT INTO identifiant_combi VALUES(30,30);
INSERT INTO identifiant_combi VALUES(31,31);
INSERT INTO identifiant_combi VALUES(32,32);
INSERT INTO identifiant_combi VALUES(33,33);
INSERT INTO identifiant_combi VALUES(34,34);
INSERT INTO identifiant_combi VALUES(35,35);
INSERT INTO identifiant_combi VALUES(36,36);
INSERT INTO identifiant_combi VALUES(37,37);
INSERT INTO identifiant_combi VALUES(38,38);
INSERT INTO identifiant_combi VALUES(39,39);
INSERT INTO identifiant_combi VALUES(40,40);


CREATE TABLE combinaisons
(
	com_fk_characteristics     integer NOT NULL REFERENCES characteristics(car_id),
	com_fk_identifiant_combi  	integer NOT NULL REFERENCES identifiant_combi(idc_id)
);

CREATE UNIQUE INDEX index_combinaisons ON combinaisons
(
	com_fk_characteristics ASC,
	com_fk_identifiant_combi ASC
);

INSERT INTO combinaisons VALUES(1,1);
INSERT INTO combinaisons VALUES(2,2);
INSERT INTO combinaisons VALUES(3,3);
INSERT INTO combinaisons VALUES(4,4);
INSERT INTO combinaisons VALUES(5,5);
INSERT INTO combinaisons VALUES(6,6);
INSERT INTO combinaisons VALUES(7,7);
INSERT INTO combinaisons VALUES(9,7);
INSERT INTO combinaisons VALUES(11,7);
INSERT INTO combinaisons VALUES(13,7);
INSERT INTO combinaisons VALUES(7,15);
INSERT INTO combinaisons VALUES(9,15);
INSERT INTO combinaisons VALUES(11,15);
INSERT INTO combinaisons VALUES(14,15);
INSERT INTO combinaisons VALUES(7,8);
INSERT INTO combinaisons VALUES(10,8);
INSERT INTO combinaisons VALUES(11,8);
INSERT INTO combinaisons VALUES(13,8);
INSERT INTO combinaisons VALUES(7,16);
INSERT INTO combinaisons VALUES(10,16);
INSERT INTO combinaisons VALUES(11,16);
INSERT INTO combinaisons VALUES(14,16);
INSERT INTO combinaisons VALUES(7,9);
INSERT INTO combinaisons VALUES(9,9);
INSERT INTO combinaisons VALUES(12,9);
INSERT INTO combinaisons VALUES(13,9);
INSERT INTO combinaisons VALUES(7,17);
INSERT INTO combinaisons VALUES(9,17);
INSERT INTO combinaisons VALUES(12,17);
INSERT INTO combinaisons VALUES(14,17);
INSERT INTO combinaisons VALUES(7,10);
INSERT INTO combinaisons VALUES(10,10);
INSERT INTO combinaisons VALUES(12,10);
INSERT INTO combinaisons VALUES(13,10);
INSERT INTO combinaisons VALUES(7,18);
INSERT INTO combinaisons VALUES(10,18);
INSERT INTO combinaisons VALUES(12,18);
INSERT INTO combinaisons VALUES(14,18);
INSERT INTO combinaisons VALUES(8,11);
INSERT INTO combinaisons VALUES(9,11);
INSERT INTO combinaisons VALUES(11,11);
INSERT INTO combinaisons VALUES(13,11);
INSERT INTO combinaisons VALUES(8,19);
INSERT INTO combinaisons VALUES(9,19);
INSERT INTO combinaisons VALUES(11,19);
INSERT INTO combinaisons VALUES(14,19);
INSERT INTO combinaisons VALUES(8,12);
INSERT INTO combinaisons VALUES(10,12);
INSERT INTO combinaisons VALUES(11,12);
INSERT INTO combinaisons VALUES(13,12);
INSERT INTO combinaisons VALUES(8,20);
INSERT INTO combinaisons VALUES(10,20);
INSERT INTO combinaisons VALUES(11,20);
INSERT INTO combinaisons VALUES(14,20);
INSERT INTO combinaisons VALUES(8,13);
INSERT INTO combinaisons VALUES(9,13);
INSERT INTO combinaisons VALUES(12,13);
INSERT INTO combinaisons VALUES(13,13);
INSERT INTO combinaisons VALUES(8,21);
INSERT INTO combinaisons VALUES(9,21);
INSERT INTO combinaisons VALUES(12,21);
INSERT INTO combinaisons VALUES(14,21);
INSERT INTO combinaisons VALUES(8,14);
INSERT INTO combinaisons VALUES(10,14);
INSERT INTO combinaisons VALUES(12,14);
INSERT INTO combinaisons VALUES(13,14);
INSERT INTO combinaisons VALUES(8,22);
INSERT INTO combinaisons VALUES(10,22);
INSERT INTO combinaisons VALUES(12,22);
INSERT INTO combinaisons VALUES(14,22);

INSERT INTO combinaisons VALUES(15,23);
INSERT INTO combinaisons VALUES(17,23);
INSERT INTO combinaisons VALUES(16,24);
INSERT INTO combinaisons VALUES(17,24);

INSERT INTO combinaisons VALUES(15,25);
INSERT INTO combinaisons VALUES(18,25);
INSERT INTO combinaisons VALUES(16,26);
INSERT INTO combinaisons VALUES(18,26);

INSERT INTO combinaisons VALUES(19,27);
INSERT INTO combinaisons VALUES(20,28);

INSERT INTO combinaisons VALUES(21,29); 
INSERT INTO combinaisons VALUES(23,29);
INSERT INTO combinaisons VALUES(26,29);

INSERT INTO combinaisons VALUES(21,30);
INSERT INTO combinaisons VALUES(24,30);
INSERT INTO combinaisons VALUES(26,30);

INSERT INTO combinaisons VALUES(22,31);
INSERT INTO combinaisons VALUES(23,31);
INSERT INTO combinaisons VALUES(26,31);

INSERT INTO combinaisons VALUES(22,32);
INSERT INTO combinaisons VALUES(24,32);
INSERT INTO combinaisons VALUES(26,32);

INSERT INTO combinaisons VALUES(21,33);
INSERT INTO combinaisons VALUES(23,33);
INSERT INTO combinaisons VALUES(25,33);

INSERT INTO combinaisons VALUES(21,34);
INSERT INTO combinaisons VALUES(24,34);
INSERT INTO combinaisons VALUES(25,34);

INSERT INTO combinaisons VALUES(22,35);
INSERT INTO combinaisons VALUES(23,35);
INSERT INTO combinaisons VALUES(25,35);
INSERT INTO combinaisons VALUES(22,36);
INSERT INTO combinaisons VALUES(24,36);
INSERT INTO combinaisons VALUES(25,36);

INSERT INTO combinaisons VALUES(27,37);
INSERT INTO combinaisons VALUES(29,37);
INSERT INTO combinaisons VALUES(27,38);
INSERT INTO combinaisons VALUES(30,38);
INSERT INTO combinaisons VALUES(28,39);
INSERT INTO combinaisons VALUES(29,39);
INSERT INTO combinaisons VALUES(28,40);
INSERT INTO combinaisons VALUES(30,40);


CREATE TABLE relations
(
	rel_fk_products_princ 	integer NOT NULL REFERENCES products(prod_id),
	rel_fk_products_sec   	integer NOT NULL REFERENCES products(prod_id)
);

CREATE UNIQUE INDEX index_relations ON relations
(
	rel_fk_products_princ ASC,
	rel_fk_products_sec ASC
);

INSERT INTO relations VALUES(5,7);
INSERT INTO relations VALUES(5,8);
INSERT INTO relations VALUES(5,9);

CREATE TABLE countries
(
        count_abreviation        varchar(2) PRIMARY KEY,
        count_nom                varchar(20),
        count_port               decimal(5,2)
);

INSERT INTO countries VALUES('B','Belgique',275);
INSERT INTO countries VALUES('F','France',675);
INSERT INTO countries VALUES('I','Italie',875);
INSERT INTO countries VALUES('NE','Hollande',575);

CREATE TABLE clients
(
	cli_id        		serial PRIMARY KEY,
	cli_nom       		varchar(25) NOT NULL,
	cli_prenom    		varchar(20) NOT NULL,
	cli_adresse   		varchar(50) NOT NULL,
	cli_cp        		varchar(10) NOT NULL,
	cli_localite  		varchar(50) NOT NULL,
	cli_fk_country      	varchar(2) NOT NULL REFERENCES countries(countryy_abreviation),
	cli_telephone 		varchar(20) NOT NULL,
	cli_numero_carte    varchar(20) NOT NULL,
	cli_mot_passe   	varchar(50) NOT NULL,
	cli_email     		varchar(40) NOT NULL
);

CREATE TABLE orders
(
	com_id        		serial PRIMARY KEY,
	com_date      		date NOT NULL,
	com_facture         boolean DEFAULT FALSE NOT NULL,
	com_fk_clients      integer NOT NULL REFERENCES clients(cli_id) 
);

CREATE TABLE order_rows
(
	row_id        		serial PRIMARY KEY,
	row_fk_orders    integer NOT NULL REFERENCES orders(com_id),
	row_fk_identifiant_combi       	integer NOT NULL REFERENCES identifiant_combi(idc_id),
	row_quantity  		smallint NOT NULL
);




"
  
  end
end
