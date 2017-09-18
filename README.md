# README



User Access Control:

There will be two categories of users: Admin and regular users (Buyers and Sellers).


The admin will be able to access all the features and functionalities from the admin panel like add, edit, update and the categories of the property types (Apartment, Office, Hotel, Plot, Bungalow, House etc.), approve ratings/reviews of the properties etc.

           

Admin features should be under “/admin” path, After admin’s approval ratings / reviews should be public, for this feature you should save reference of admin user in approved_by column.  


The regular users will be able to to add, edit, update and delete their own properties along with the other details like Images, Property Type, Location, Price (INR), Area (sqft.), Developer’s or Owner’s Name, Contact Person, info of the property for sell, rental, sold etc will be mark to each of the properties etc. General users will also be able to provide ratings / reviews which can be displayed on the property details.


The users or the customers can buy and sell the property by uploading the property details


The users will be able to sign up to the site with Name, Email Id, Mobile Number and create password. Once login the users can sign in to the site with Name/E-mail Id and Password.


You should not use any Gem like devise for user authentication.  


Also the users will be able to sign in through their Social Network account like via Facebook login and Google login.


While logging if the users put wrong Email Id or Password, it will show an error validation message.


The Homepage will be listed with the lists of properties, Recently Added properties etc. Visitors counts and Property Counts can be shown in the Homepage. Use REDIS to store properties visited by a user.


Once click on the specific property, the property details page will be open.


The users can add the property in their favorite list and can show interest in the property. Once the property will be marked as interested, the property owner will get a notification mail. The property owner will receive an email notification for every time his property will be visited by the user.


Property search filtration will be there where the users can browse and filter the properties by Location, Property Type, Price, Number of rooms etc.


Social Network sharing will be there for properties through Facebook, Twitter, Google etc.


Additional specifications:


Automated Testing, Use Rspec for this

For user sign-up/sign-in, it should not use gems


Guides to follow about Redis Server:

1. Please Install and Start Redis Server before Running the Project.

2. Redis Server application file is already present in the Project Directory just need to install it in the current      project working directory. Folder is: /redis-2.8.18

3. Redis commands to start server:
   $ cd redis-2.8.18/src
   $ ./redis-server
