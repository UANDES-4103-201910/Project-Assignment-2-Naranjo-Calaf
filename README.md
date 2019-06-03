# WEB-TECHNOLOGIES-LAB-ASSIGNMENT-2

For this assignment, it has been developed a basic view of the web page of the project. 

//IMPORTANT//

1) The evaluation for this assignment, is a basic demonstration of few models of the complete project (is been this way, because this assignment don't require javascript). For this demonstartion, the models that are used are: User, Profile, Post, Dumpster, Blacklist, Registration and Session. 

The models like: Admin , comments, votes, etc. Are not used by the motive already explained. 

2) In the creation of a new User, if this one it is saved correctly, the page will be redirect to the layout that creates a new Profile. Here it is asked to put an User, for this it is required the recently created User ID. It is very probably that the value for this be 1. If not, it can be reviwed in the Rails console (we are actually working to fix this issue).

3)We failed to create an authentication with Google services, this is because we had a problem making the Project on google.developers, this cause that we can't ge the necessary KEYS for the authentication:
"Crear proyecto: Il Arrabiato
Error desconocido"
When we tried to access this Project, so we can have more information we get the following error:
 
"There was an error while loading /home/dashboard?project=silver-fragment-242522&folder=true&organizationId=true&supportedpurview=project. Please check that the project ID is valid and you have permissions to access it. Learn more

Vuelve a la página principal de la consola de Cloud Platform.
You are missing at least one of the following required permissions:

Proyecto

resourcemanager.projects.get"

4) There still few elements that we hope to have them ready for the final assignment (next week)

5) There are example users and admins already created. They have the following attributes to use:}
        email: admin1@asd.cl and password:123456789
        email: user1@asd.cl  and password:123456789
        email: admin2@asd.cl and password:123456789
        email: user2@asd.cl  and password:123456789
        email: admin3@asd.cl and password:123456789
        email: user3@asd.cl  and password:123456789
        
7) To start the evaluation, run in the terminal the next command:
            $ rails db:reset 