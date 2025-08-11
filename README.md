SQL Task 5 – JOIN Operations

This task focuses on performing **SQL JOIN operations** using MySQL to combine and analyze data from multiple related tables.

---

## Files Included


 - **task5.sql** – SQL script that:
  - Creates a `Sales` database
  - Adds tables:
    - `Customers`
    - `Orders`


&nbsp; \* Insertion of sample records

&nbsp; \* Queries demonstrating \*\*INNER JOIN\*\*, \*\*LEFT JOIN\*\*, \*\*RIGHT JOIN\*\*, and \*\*FULL JOIN\*\* (using `UNION`)

&nbsp; \* Grouping and filtering data using `GROUP BY` and `HAVING`

\* `Screenshots.docx` – Contains screenshots of executed SQL commands and their outputs for verification



---



\## Operations Performed



\* \*\*Created Tables:\*\*



&nbsp; \* `Customers` – Stores customer details such as `CustomerID`, `CustomerName`, `Country`, `Email`, `JoinDate`

&nbsp; \* `Orders` – Stores order details such as `OrderID`, `CustomerID`, `ProductName`, `OrderDate`, `Price`, and `Quantity`



\* \*\*Inserted Data:\*\*



&nbsp; \* Multiple customer and order records, including some cases with missing matches to test JOIN results



\* \*\*Executed JOIN Queries:\*\*



&nbsp; \* \*\*INNER JOIN\*\* – Customers who have placed orders

&nbsp; \* \*\*LEFT JOIN\*\* – All customers, even those without orders

&nbsp; \* \*\*RIGHT JOIN\*\* – All orders, even if the customer is missing

&nbsp; \* \*\*FULL JOIN\*\* (via `UNION`) – All customers and all orders regardless of match



---



\## How to Run



1\. Open \*\*MySQL Workbench\*\*

2\. Connect to your local server

3\. Run `task5.sql` in a new SQL tab

4\. Review the outputs or refer to `Screenshots.docx`



---



\## Notes



\* Ensure MySQL server is running before execution

\* Database name used: `Sales`

\* Foreign keys enforce relationship between `Customers` and `Orders`

\* FULL JOIN is simulated using a `UNION` of LEFT and RIGHT JOINs (since MySQL doesn’t have native FULL JOIN support)



---



\## Author



\*\*Sumith Poojary\*\*

GitHub: \[sumith999](https://github.com/sumith999)




