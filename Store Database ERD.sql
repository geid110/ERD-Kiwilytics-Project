CREATE TABLE "Categories" (
  "CategoryID" int PRIMARY KEY,
  "CategoryName" varchar,
  "Description" text
);

CREATE TABLE "Customers" (
  "CustomerID" varchar PRIMARY KEY,
  "CompanyName" varchar,
  "ContactName" varchar,
  "ContactTitle" varchar,
  "Address" varchar,
  "City" varchar,
  "Region" varchar,
  "PostalCode" varchar,
  "Country" varchar,
  "Phone" varchar
);

CREATE TABLE "Employees" (
  "EmployeeID" int PRIMARY KEY,
  "LastName" varchar,
  "FirstName" varchar,
  "JobTitle" varchar,
  "TitleOfCourtesy" varchar,
  "BirthDate" date,
  "HireDate" date,
  "Address" varchar,
  "City" varchar,
  "Region" varchar,
  "PostalCode" varchar,
  "Country" varchar,
  "Phone" varchar,
  "ReportsTo" int
);

CREATE TABLE "Orders" (
  "OrderID" int PRIMARY KEY,
  "CustomerID" varchar,
  "EmployeeID" int,
  "OrderDate" date,
  "RequiredDate" date,
  "ShippedDate" date,
  "ShipVia" int,
  "Freight" decimal,
  "ShipName" varchar,
  "ShipAddress" varchar,
  "ShipCity" varchar,
  "ShipRegion" varchar,
  "ShipPostalCode" varchar,
  "ShipCountry" varchar
);

CREATE TABLE "Order_Details" (
  "OrderID" int,
  "ProductID" int,
  "UnitPrice" decimal,
  "Quantity" int,
  "Discount" float,
  PRIMARY KEY ("OrderID", "ProductID")
);

CREATE TABLE "Products" (
  "ProductID" int PRIMARY KEY,
  "ProductName" varchar,
  "SupplierID" int,
  "CategoryID" int,
  "QuantityPerUnit" varchar,
  "UnitPrice" decimal,
  "UnitsInStock" int,
  "UnitsOnOrder" int,
  "ReorderLevel" int,
  "Discontinued" boolean
);

CREATE TABLE "Shippers" (
  "ShipperID" int PRIMARY KEY,
  "CompanyName" varchar,
  "Phone" varchar
);

CREATE TABLE "Suppliers" (
  "SupplierID" int PRIMARY KEY,
  "CompanyName" varchar,
  "ContactName" varchar,
  "ContactTitle" varchar,
  "Address" varchar,
  "City" varchar,
  "Region" varchar,
  "PostalCode" varchar,
  "Country" varchar,
  "Phone" varchar,
  "Fax" varchar,
  "HomePage" text
);

ALTER TABLE "Products" ADD FOREIGN KEY ("CategoryID") REFERENCES "Categories" ("CategoryID");

ALTER TABLE "Products" ADD FOREIGN KEY ("SupplierID") REFERENCES "Suppliers" ("SupplierID");

ALTER TABLE "Orders" ADD FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");

ALTER TABLE "Orders" ADD FOREIGN KEY ("EmployeeID") REFERENCES "Employees" ("EmployeeID");

ALTER TABLE "Orders" ADD FOREIGN KEY ("ShipVia") REFERENCES "Shippers" ("ShipperID");

ALTER TABLE "Order_Details" ADD FOREIGN KEY ("OrderID") REFERENCES "Orders" ("OrderID");

ALTER TABLE "Order_Details" ADD FOREIGN KEY ("ProductID") REFERENCES "Products" ("ProductID");

ALTER TABLE "Employees" ADD FOREIGN KEY ("ReportsTo") REFERENCES "Employees" ("EmployeeID");
