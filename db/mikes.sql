DROP TABLE products;
DROP TABLE manufacturers;

CREATE TABLE manufacturers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  country VARCHAR(255),
  contact VARCHAR(255),
  rating INT4
);

CREATE TABLE products (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity INT4,
  buy_cost INT,
  sell_price INT,
  manufacturer_id INT4 REFERENCES manufacturers(id) ON DELETE SET NULL
);
