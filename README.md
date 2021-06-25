# Project 4

Web Programming with Python and JavaScript


Project Author: Isaac Newton Kissiedu

This project is an online phonebook app powered by the Python Django Framework.

The project relies on HTML, CSS,Bootstrap Framework, Python, Django, sqlite for the data storage.

FILES AND FOLDERS IN THE PROJECT

1. app_contacts: A django app folder for managing contacts. Includes files like urls.py,views.py,models.py,test.py

2. app_homepage: A django app folder for managing the hompage, about us page and contact us page

3. app_users: A django app folder for managing features like login,registration, change password

4. media: This folder is used to store files specific to the entire website

5. mediafiles: This folder is used to store user uploaded files

6. project: This folder is the heart of the Django app. It contains the entire settings, urls etc

7. static: This folder contains the stylesheets, javascript and images for development

8. staticfiles: This folder is used to collect all static files into one container for deployment

9. templates: This folder is used to store site specific html files such as the base html layout extended by all pages

10. .travis.yml: This file contains Travis CI config for continous integration and continous deployment to Heroku

11. db.sqlite3: This file is a sqlite database where all the data for the app will be stored

12. manage.py: This file provides housekeeping commands to manage the django application

13. Procfile: This file is used to tell Heroku to start a web process that will serve the deployed app

14. README.md: This file is used to tell collaborators what this project is about

15. requirements.txt: This file contains all the python dependencies for the django application




HOW TO RUN THE APP

1. Create a Python 3 virtual environment and activate it.

2. Install the packages available in requiremnts.txt

3. Run the application by using the following command: $ python3 manage.py runserver