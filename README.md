# Final project: Building Facebook

This is Microverse's final project in Ruby on Rail's course. In this project, we build a social media page similar to [Facebook][facebook] where the users can create and edit an account, add other users as friends, post their thoughts, comment and like their friends and their own posts.

## Link to assignment

The assignment for this project is in the Odin Project's Ruby on Rails course that can be found [here][assignment].

This project was divided into 8 milestones:

* First: Preparation for the data architecture and documentation where the project as planned and an Entity Relationship Diagram was created.
* Second: Project setup as described in Odin Project.
* Third: Created the models with associations for users, posts, and likes in posts.
* Fourth: Created the model with the association for comments and likes in comments.
* Fifth: Started to implement friendship, allowing users to request, accept, reject and undo friendship with other users.
* Sixth: We implemented friendship with 2 rows for mutual friendship as described [here][friendship]
* Seventh: Login with a Facebook account using omniauth.
* Eighth: Deploy for Heroku

## Entity-Relationship Diagram

The Entity-Relationship Diagram (ERD) describes illustratively how the associations work in this project. Our final version can be seen below:

![ERD][ERD]

## Live version and github reppository

For a live version, you can visit https://friendsnet.herokuapp.com/

The Github repository is in https://github.com/alexawesomecode/facebook-clone-project

## Technologies used

In this project we used:
* Ruby on Rails
* HTML and CSS
* [Lucid chart][lucid-chart] in the creation of the ERD
* [Font Awesome][font-awesome] for the icons
* [Omniauth gem][omniauth] for the facebook integration
* [Devise gem][devise] in the creation of the Users model and controller
* [Bootstrap][bootstrap] for some CSS classes

## Contributors

Alejandro Andres - [GitHub][alex-github] - [Twitter][alex-twitter]

Raphael Cordeiro - [GitHub][rapha-github] - [Twitter][rapha-twitter]


<!-- Links -->
[facebook]: https://www.facebook.com/
[assignment]: https://www.theodinproject.com/courses/ruby-on-rails/lessons/final-project
[font-awesome]: https://fontawesome.com/
[omniauth]: https://github.com/omniauth/omniauth
[devise]: https://github.com/heartcombo/devise
[bootstrap]: https://getbootstrap.com/
[lucid-chart]: https://www.lucidchart.com/documents#/dashboard
[friendship]: https://explainextended.com/2009/03/07/selecting-friends/
[alex-github]: https://github.com/alexawesomecode
[alex-twitter]: https://twitter.com/alexcode0
[rapha-github]: https://github.com/phalado
[rapha-twitter]: https://twitter.com/phalado
[ERD]: https://raw.githubusercontent.com/alexawesomecode/facebook-clone-project/seventh-milestone/docs/Facebook-clone.png
