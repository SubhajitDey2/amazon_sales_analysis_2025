-- Cretae table 

CREATE TABLE amazon_sales (
    "Order_ID" TEXT,
    "Date" DATE,
    "Product" TEXT,
    "Category" TEXT,
    "Price" NUMERIC,
    "Quantity" INTEGER,
    "Total_Amount" NUMERIC,
    "Customer_Name" TEXT,
    "City" TEXT,
    "Payment_Method" TEXT,
    "Order_Status" TEXT
);

-- LOAD Dataset From CSV To SQL

COPY amazon_sales 
from 'D:\clean_amazon_sales.csv'
delimiter','
CSV Header;




	 