# FE21_CR9_MichaelR

Database FAMAZON Web-Shop

You can find the thought process behind the database design in the PDF Folder inside the Step01 file. It contains a storyboard where the complete process is mapped.

The orders table also functions as an invoice data source since all information for automated invoice E-Mails will be fetched from there.

The payment process is linked to the order and the same pay_id may apply to several orders at once.

One account can have more than one preferred address and several payment methods. I didn't include an extra e-mail column as it doesn't serve a purpose for now. May be added at a later time.

I also kept the address table pretty pragmatic by only including the street_no, house_no and door_no. A city may be added at a later time.

If you have any questions please feel free to reach out to me!

The following criteria were graded:

Basic points:

- Create a GitHub Repository named: FE21_CR9_Name. Set it to private. Push the files into it and send the link through the learning management system (lms). See an example of a GitHub link below:
https://github.com/JohnDoe/repositoryname.git.
- Use the 4 steps for a database development process:

1.	Define the purpose - Cloud diagram
2.	The Entity model - ER diagram
3.	The Unified Modeling Language - Classes Diagram
4.	Refine and Normalize the Design

- Recreate your database design in MySQL. Name your database as cr9_famazon_johndoe (use your name instead of "johndoe"). The name must be as the task requests. Export your database as cr9_famazon_johndoe.sql and then upload the .sql file with the project to GitHub. Please remember to use the option “add create database” in the custom options.  
- Insert test data into the database (insert some dummy data in your database, at least 3 sets of data per table)
- Create at least 6 different SQL queries to show the power of your database (save these queries to a  cr9_famazon_johndoe_queries.sql file and upload it to the project) Note: The use of JOINS is required for at least three queries). Examples of queries: how many products were bought from a specific company, who purchased products on this date, what products were sent between this and that date, how many products were sent to a specific city etc. 

**Bonus points:**
- Expand initial specification with more than 10 tables
- Use JOINS in your SQL queries that connect more than 3 tables.
