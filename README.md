# FE21_CR9_MichaelR

Database FAMAZON Web-Shop

You can find the thought process behind the database design in the PDF Folder inside the Step01 file. It contains a storyboard where the complete process is mapped.

The orders table also functions as an invoice data source since all information for automated invoice E-Mails will be fetched from there.

The payment process is linked to the order and the same pay_id may apply to several orders at once.

One account can have more than one preferred address and several payment methods. I didn't include an extra e-mail column as it doesn't serve a purpose for now. May be added at a later time.

I also kept the address table pretty pragmatic by only including the street_no, house_no and door_no. A city may be added at a later time.

If you have any questions please feel free to reach out to me!
