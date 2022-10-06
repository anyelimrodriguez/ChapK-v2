# Group-Project-One-Team-2
-------------------------------------------------------------------------------------------------------------------
Group Members are (Calvin Wang, Hardip Chander, Anyeli Rodriguez, Preetom Chowdhury ,Kevin Ulcena).
Web App is named CHAP_K.
We named it CHAP_K because it is an abbreviation of all our first names listed in the order 1 line above. 
Also, our web app has correlates to stories so CHAP_K sounds like Chapter and it goes with the gimmick of our web app.
-------------------------------------------------------------------------------------------------------------------
General Project Information
Deployed Link: https://chap-k.web.app/#/
Our Web App starts in the Welcome Page where the user can press the login button to login or press the Get Started button to sign up. After successfully creating an account or signing in, they are led into the homepage where they can view other people's stories, change the language, and/or write a post of their own. The posts are stored in the Firestore database and the accounts are stored and authenticated by Firebase Auth.
-------------------------------------------------------------------------------------------------------------------
Frontend Responsibilties
1) Hardip Chander -> Setup Whole Dart Project and the Routes for the pages, and Created Welcome Page for App (main.dart, WelcomePage.dart, imgs folder). 
Made the Welcome Page as responsive as possible. Added the logo Kevin created, as a favicon to the project screen. 
Complete 70% of the README.md file so the Project Details are available. 

2) Kevin Ulcena -> Worked on Login Page (Login.dart). Created the logo for the web app.

3) Anyeli Rodriguez -> Used Figma to design the project. Worked on Sign Up page and made the layout of the page change depending on the screen size. 

4) Calvin Wang -> Used Figma to design the project. Worked on Home Page (Home.dart) Added extra page to view    each story in fullscreen. Added navigation to sign out button, write button, and each container of stories. Made Home Page responsive using math, constraints, etc.

5) Preetom Chowdhury -> Helped create Figma to design frames for project. Worked on Write Page and made it responsive. (Write.dart) 

Backend Responsibilties
1) Hardip Chander -> Created the Firebase project on the Firebase Console. Connected the Firebase Project with the Web App. Helped Calvin and Preetom with the Firestore database even though do he does not have any commits related to the database.Taught the group how to deploy the web app. Read documentation together.

2) Kevin Ulcena -> Added Firebase Authentication for the Login/Sign Up pages 

3) Anyeli Rodriguez -> Looked into authentication with Kevin-> Added a widget to display on the front-end errors received from the backend  authentication. Helped in the homepage and write pages by fixing an issue with adding empty stories that prevented the entire homepage from loading. (Did this by preventing empty stories to be posted in write page + modifying the async function (in the home page) that translates, into a try and catch so that errors don't stop the entire homepage from loading).

4) Calvin Wang -> Created the database on firestore. Home Page is now able to get all of the stories from firestore database and store them into each contianer in the ListView builder.

5) Preetom Chowdhury -> Added ability to post stories into the database to be later pulled into the Home page.




