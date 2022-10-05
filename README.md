# Group-Project-One-Team-2
-------------------------------------------------------------------------------------------------------------------
Group Members are (Calvin Wang, Hardip Chander, Anyeli Rodriguez, Preetom Chowdhury ,Kevin Ulcena).
Web App is named CHAP_K.
We named it CHAP_K because it is an abbreviation of all our first names listed in the order 1 line above. 
Also, our web app has correlates to stories so CHAP_K sounds like Chapter and it goes with the gimmick of our web app.
-------------------------------------------------------------------------------------------------------------------

Frontend Responsibilties
1) Hardip Chander -> Setup Whole Dart Project and the Routes for the pages, and Created Welcome Page for App (main.dart, WelcomePage.dart, imgs folder). 
Made the Welcome Page as responsive as possiable. Added the logo Kevin created, as a favicon to the project screen. 
Complete 70% of the README.md file so the Project Details are available. 

2) Kevin Ulcena -> Worked on Login Page (Login.dart). Created the logo for the web app.

3) Anyeli Rodriguez -> Used Figma to design the project. Worked on Sign Up page and made it responsive. Fixed issue with adding empty stories that prevented the homepage from loading. 

4) Calvin Wang -> Used Figma to design the project. Worked on Home Page (Home.dart) Added extra page to view    each story in fullscreen. Added navigation to sign out button, write button, and each container of stories. Made Home Page responsive using math, constraints, etc.

5) Preetom Chowdhury -> Helped create Figma to design frames for project. Worked on Write Page and made it responsive. (Write.dart) 

Backend Responsibilties
1) Hardip Chander -> Created the Firebase project on the Firebase Console. Connected the Firebase Project with the Web App. Helped Calvin and Preetom 
with the Firestore database even though do he does not have any commits related to the database.Taught the group how to deploy the web app. Read documentation together.

2) Kevin Ulcena -> Authentication Login/Sign Up

3) Anyeli Rodriguez -> Authentication -> Added a widget to display errors with authentication

4) Calvin Wang -> Created the database on firestore. Home Page is now able to get all of the stories from firestore database and store them into each contianer in the ListView builder.

5) Preetom Chowdhury -> Added ability to post stories into the database to be later pulled into the Home page.

-------------------------------------------------------------------------------------------------------------------

General Project Information
Our Web App starts in the Welcome Page where the user can press the login button to login or press the Get Started button to sign up.
They create an account (or click to go to sign in page) and are led into the homepage where they can view other people's stories, 
change the language, and write a post of their own.
The posts are stored in the FireStore database and the accounts are stored and authenticated by Firebase Auth.
