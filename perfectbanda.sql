CREATE TABLE company(
   Id_company_PB int(11) NOT NULL AUTO_INCREMENT,
   name VARCHAR(50),
   address VARCHAR(250),
   email VARCHAR(250),
   phone VARCHAR(50),
   city VARCHAR(250),
   postal_code VARCHAR(50),
   country VARCHAR(50),
   PRIMARY KEY(Id_company_PB)
);

CREATE TABLE product(
   Id_product int(11) NOT NULL AUTO_INCREMENT,
   name VARCHAR(250),
   _year INT,
   photo_recto_label VARCHAR(250),
   photo_verso_label VARCHAR(250),
   photo_bottle_front VARCHAR(250),
   photo_bottle_back VARCHAR(250),
   certificate_medals VARCHAR(250),
   technical_data TEXT,
   origin VARCHAR(250),
   PRIMARY KEY(Id_product)
);

CREATE TABLE company(
   Id_comp_import int(11) NOT NULL AUTO_INCREMENT,
   name VARCHAR(50),
   address VARCHAR(250),
   email VARCHAR(250),
   phone VARCHAR(50),
   city VARCHAR(250),
   postal_code VARCHAR(50),
   country VARCHAR(50),
   PRIMARY KEY(Id_comp_import)
);

CREATE TABLE company(
   Id_comp_supplier int(11) NOT NULL AUTO_INCREMENT,
   name VARCHAR(50),
   address VARCHAR(250),
   email VARCHAR(250),
   phone VARCHAR(50),
   city VARCHAR(250),
   postal_code VARCHAR(50),
   country VARCHAR(50),
   PRIMARY KEY(Id_comp_supplier)
);

CREATE TABLE perfect_banda_(
   Id_perfect_banda_ int(11) NOT NULL AUTO_INCREMENT,
   title VARCHAR(50),
   lastname VARCHAR(200),
   firstname VARCHAR(200),
   email VARCHAR(100),
   password VARCHAR(200),
   phone VARCHAR(50),
   address VARCHAR(200),
   rights VARCHAR(50),
   Id_company_PB INT NOT NULL,
   PRIMARY KEY(Id_perfect_banda_),
   FOREIGN KEY(Id_company_PB) REFERENCES company(Id_company_PB)
);

CREATE TABLE supplier(
   id_supplier int(11) NOT NULL AUTO_INCREMENT,
   title VARCHAR(50),
   lastname VARCHAR(250),
   firstname VARCHAR(250),
   email VARCHAR(250),
   password VARCHAR(250),
   phone VARCHAR(150),
   address VARCHAR(250),
   rights VARCHAR(50),
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(id_supplier),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company(Id_comp_supplier)
);

CREATE TABLE importer(
   Id_importer int(11) NOT NULL AUTO_INCREMENT,
   title VARCHAR(50),
   lastname VARCHAR(250),
   firstname VARCHAR(250),
   email VARCHAR(250),
   password VARCHAR(250),
   phone VARCHAR(250),
   address VARCHAR(250),
   rights VARCHAR(50),
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_importer),
   FOREIGN KEY(Id_comp_import) REFERENCES company(Id_comp_import)
);

CREATE TABLE _order(
   Id_order int(11) NOT NULL AUTO_INCREMENT,
   reference VARCHAR(150),
   order_date DATE,
   order_form VARCHAR(250),
   pickup_date DATE,
   planned_etd VARCHAR(50),
   planned_eta DATE,
   effective_etd DATE,
   effective_eta DATE,
   comments TEXT,
   Id_comp_supplier INT NOT NULL,
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_order),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company(Id_comp_supplier),
   FOREIGN KEY(Id_comp_import) REFERENCES company(Id_comp_import)
);

CREATE TABLE sample_request(
   Id_sample_request int(11) NOT NULL AUTO_INCREMENT,
   quantity INT,
   request_date DATE,
   Id_product INT NOT NULL,
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_sample_request),
   FOREIGN KEY(Id_product) REFERENCES product(Id_product),
   FOREIGN KEY(Id_comp_import) REFERENCES company(Id_comp_import)
);

CREATE TABLE sample_offer(
   Id_sample_offer int(11) NOT NULL AUTO_INCREMENT,
   quantity INT,
   tracking VARCHAR(150),
   shipping_date DATE,
   shipping_company VARCHAR(50),
   Id_product INT NOT NULL,
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_sample_offer),
   FOREIGN KEY(Id_product) REFERENCES product(Id_product),
   FOREIGN KEY(Id_comp_import) REFERENCES company(Id_comp_import)
);

CREATE TABLE production(
   Id_production int(11) NOT NULL AUTO_INCREMENT,
   prod_start_date DATE,
   prod_end_date DATE,
   prod_delay LOGICAL,
   contact_carrier LOGICAL,
   logistic_issue LOGICAL,
   photo_shipment VARCHAR(250),
   comment TEXT,
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(Id_production),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company(Id_comp_supplier)
);

CREATE TABLE video(
   Id_video int(11) NOT NULL AUTO_INCREMENT,
   vid_title VARCHAR(200),
   vid_description TEXT,
   vid_date DATE,
   id_supplier INT NOT NULL,
   PRIMARY KEY(Id_video),
   FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE photo(
   Id_photo int(11) NOT NULL AUTO_INCREMENT,
   photo_title VARCHAR(250),
   photo_description TEXT,
   photo_date DATE,
   id_supplier INT NOT NULL,
   PRIMARY KEY(Id_photo),
   FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier)
);

CREATE TABLE pay_order(
   Id_pay_order int(11) NOT NULL AUTO_INCREMENT,
   order_pdf VARCHAR(250),
   order_amount DECIMAL(15,2),
   pay_order_date DATE,
   Id_order INT NOT NULL,
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_pay_order),
   UNIQUE(Id_order),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order),
   FOREIGN KEY(Id_comp_import) REFERENCES company(Id_comp_import)
);

CREATE TABLE pay_commission(
   Id_pay_commission int(11) NOT NULL AUTO_INCREMENT,
   commission_percentage DECIMAL(15,2),
   amount_commission DECIMAL(15,2),
   pay_commission_date DATE,
   Id_order INT NOT NULL,
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(Id_pay_commission),
   UNIQUE(Id_order),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company(Id_comp_supplier)
);

CREATE TABLE contain(
   Id_product INT,
   Id_production INT,
   PRIMARY KEY(Id_product, Id_production),
   FOREIGN KEY(Id_product) REFERENCES product(Id_product),
   FOREIGN KEY(Id_production) REFERENCES production(Id_production)
);

CREATE TABLE take(
   Id_company_PB INT,
   Id_order INT,
   PRIMARY KEY(Id_company_PB, Id_order),
   FOREIGN KEY(Id_company_PB) REFERENCES company(Id_company_PB),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order)
);
