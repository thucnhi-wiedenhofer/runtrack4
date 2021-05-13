CREATE TABLE company_PB(
   Id_company_PB int(11) NOT NULL,
   name VARCHAR(50),
   address VARCHAR(250),
   email VARCHAR(250),
   phone VARCHAR(50),
   city VARCHAR(250),
   postal_code VARCHAR(50),
   country VARCHAR(50),
   PRIMARY KEY(Id_company_PB)
);

CREATE TABLE company_import(
   Id_comp_import int(11) NOT NULL,
   name VARCHAR(50),
   adress VARCHAR(250),
   email VARCHAR(250),
   phone VARCHAR(50),
   city VARCHAR(250),
   postal_code VARCHAR(50),
   country VARCHAR(50),
   PRIMARY KEY(Id_comp_import)
);

CREATE TABLE company_supplier(
   Id_comp_supplier int(11) NOT NULL,
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
   Id_perfect_banda_ int(11) NOT NULL,
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
   FOREIGN KEY(Id_company_PB) REFERENCES company_PB(Id_company_PB)
);

CREATE TABLE supplier(
   id_supplier int(11) NOT NULL,
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
   FOREIGN KEY(Id_comp_supplier) REFERENCES company_supplier(Id_comp_supplier)
);

CREATE TABLE importer(
   Id_importer int(11) NOT NULL,
   title VARCHAR(50),
   lastname VARCHAR(250),
   firstname VARCHAR(250),
   email VARCHAR(250),
   password VARCHAR(250),
   phone VARCHAR(250),
   adress VARCHAR(250),
   rights VARCHAR(50),
   Id_comp_import INT NOT NULL,
   PRIMARY KEY(Id_importer),
   FOREIGN KEY(Id_comp_import) REFERENCES company_import(Id_comp_import)
);

CREATE TABLE product(
   code_product int(11) NOT NULL,
   name VARCHAR(250),
   _year INT,
   photo_recto_label VARCHAR(250),
   photo_verso_label VARCHAR(250),
   photo_bottle_front VARCHAR(250),
   photo_bottle_back VARCHAR(250),
   certificate_medals VARCHAR(250),
   technical_data TEXT,
   origin VARCHAR(250),
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(code_product),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company_supplier(Id_comp_supplier)
);

CREATE TABLE _order(
   Id_order int(11) NOT NULL,
   reference VARCHAR(150),
   order_date DATE,
   order_form VARCHAR(250),
   pickup_date DATE,
   planned_etd VARCHAR(50),
   planned_eta DATE,
   efective_etd DATE,
   efective_eta DATE,
   comments TEXT,
   Id_importer INT NOT NULL,
   PRIMARY KEY(Id_order),
   FOREIGN KEY(Id_importer) REFERENCES importer(Id_importer)
);

CREATE TABLE sample_request(
   Id_sample_request int(11) NOT NULL,
   quantity INT,
   request_date DATE,
   status VARCHAR(50),
   code_product INT NOT NULL,
   Id_importer INT NOT NULL,
   PRIMARY KEY(Id_sample_request),
   FOREIGN KEY(code_product) REFERENCES product(code_product),
   FOREIGN KEY(Id_importer) REFERENCES importer(Id_importer)
);

CREATE TABLE sample_offer(
   Id_sample_offer int(11) NOT NULL,
   quantity INT,
   tracking VARCHAR(150),
   shipping_date DATE,
   shipping_company VARCHAR(50),
   Id_importer INT NOT NULL,
   code_product INT NOT NULL,
   PRIMARY KEY(Id_sample_offer),
   FOREIGN KEY(Id_importer) REFERENCES importer(Id_importer),
   FOREIGN KEY(code_product) REFERENCES product(code_product)
);

CREATE TABLE production(
   Id_production int(11) NOT NULL,
   prod_start_date DATE,
   prod_end_date DATE,
   prod_delay VARCHAR(20),
   contact_carrier VARCHAR(20),
   logistic_issue VARCHAR(20),
   photo_shipment VARCHAR(20),
   comment TEXT,
   id_supplier INT NOT NULL,
   Id_order INT NOT NULL,
   PRIMARY KEY(Id_production),
   FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order)
);

CREATE TABLE video(
   Id_video int(11) NOT NULL,
   vid_title VARCHAR(200),
   vid_description TEXT,
   vid_date DATE,
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(Id_video),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company_supplier(Id_comp_supplier)
);

CREATE TABLE photo(
   Id_photo int(11) NOT NULL,
   photo_title VARCHAR(250),
   photo_description TEXT,
   photo_date DATE,
   Id_comp_supplier INT NOT NULL,
   PRIMARY KEY(Id_photo),
   FOREIGN KEY(Id_comp_supplier) REFERENCES company_supplier(Id_comp_supplier)
);

CREATE TABLE pay_order(
   Id_pay_order int(11) NOT NULL,
   order_pdf VARCHAR(250),
   order_amount DECIMAL(15,2),
   pay_order_date DATE,
   Id_order INT NOT NULL,
   Id_importer INT NOT NULL,
   PRIMARY KEY(Id_pay_order),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order),
   FOREIGN KEY(Id_importer) REFERENCES importer(Id_importer)
);

CREATE TABLE detail_order(
   id_detail int(11) NOT NULL,
   quantity INT NOT NULL,
   Id_order INT NOT NULL,
   code_product INT NOT NULL,
   PRIMARY KEY(id_detail),
   FOREIGN KEY(Id_order) REFERENCES _order(Id_order),
   FOREIGN KEY(code_product) REFERENCES product(code_product)
);
