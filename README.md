# Friendly-Bakery

## Built With:
* Ruby 
* Sinatra
* Mailgun API

## Learning Objectives:  

Upon successful completion of this project, the student will demonstrate their understanding of how to use API Wrappers in Ruby as well how to create a website using the Sinatra microframework as introduction to backend

## Featured:
* Front page provides information about bakery and has links to all categories of items sold in the bakery
* Has pages that display items of each category with information about the items
* Has a way for a person on the site to receive an email with a catalog of all items sold
* Passes information (first and last name), received through subscribe form to personalize email

### Example of catalog received through email
![email](/public/images/email.png)

 

## Challenge:

In programming, in order to not repeat yourself, sometimes we have to store our data in a universal format that can be utilized in multiple areas. This is similar to how you would write recipe instructions down so in the future you can just use that as a template.

That all being said, following was implemented:

* Created one class per generic category of item sold in the bakery
 * Cookie class
 * Cake class
 * Muffin class
* Used these classes to create 1 object per item being sold (e.g if you have 3 cookies for sale you would create 3 Cookie objects based on one Cookie class)
* Each item should has the following attributes
 * description
 * price

