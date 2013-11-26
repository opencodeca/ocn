# [nom].opencode.ca

<p align="center">
  <a href="https://codeclimate.com/github/opencodeqc/ocn"><img src="https://codeclimate.com/github/opencodeqc/ocn.png" /></a>
  <a href="https://travis-ci.org/opencodeqc/ocn"><img src="https://travis-ci.org/opencodeqc/ocn.png?branch=master" /></a>
</p>

## P'tit brief

#### Objectif

L'objectif est fort simple : Offrir une plateforme (*Hacker News style*) à la communauté francophone de l'OpenCode pour échanger sur divers sujets liés au code. Que ce soit pour discuter d'actualité, de nouvelles techniques, de nouveautés, de bonnes pratiques ou encore pour partager vos bons coups et vos projets.

Il est intéressant aussi de voir ce que la gang de développeurs de Québec peut accomplir s'ils travaillent tous ensemble à la réalisation d'un projet.

#### Spécifications

La plateforme est entièrement open-source et on compte sur vous pour nous aider à monter un outil qui sera utile à tous. Vous voyez un bug? *Fix it! :)*

###### Plus technique,

* C'est du Rails 4.0.1 avec Ruby 2.0.0.
* Ça va rouler sur Heroku avec PostgreSQL.
* Ça n'envoi pas de courriel, ni de notification.

Si vous n'avez jamais fait de Ruby, c'est une excellente opportunité pour commencer et être *coacher* par ceux qui ont un peu plus d'expérience derrière la cravate.

#### Fonctionnalités du MVP

* Inscription par GitHub.
* Affichage des *posts* par popularité.
* Affichage des *posts* par date de création.
* Affichage du profil d'un membre.
* Possibilité d'ajouter des *posts* (lien, Ask OC, Show OC, etc...)
* Possibilité que le membre modifie ses *posts*.
* Possibilité de commenter sur un *post*.
* Possibilité de commenter sur un commentaire.
* Upvote d'un *post*.
* Upvote d'un commentaire.
* Permettre à un modérateur de modifier un *post*.

#### Fonctionnalités futures

Seul l'avenir nous le dira, voyons voir quelles idées vous aurez pour améliorer l'expérience de tous :)

##### C'est pour quand? J'ai hâte de l'utiliser.

Dans un monde idéal, il serait intéressant mettre en ligne lors de la prochaine édition de l'OpenCode, soit **le 26 novembre**. Comme c'est un produit *community driven* autant pour le contenu que pour le code, on peut lancer le prototype et l'améliorer au fil des semaines.

Comme les interwebs disent, *Fuck it, ship it!*

## Bootstrap the application

```
# Install the dependencies
$ bundle install

# Copy the environment file to your local machine
$ cp .env.default .env

# Create and bootstrap the database
$ bundle exec rake db:setup

# Run the application processes
$ bundle exec foreman start
```

For development purpose, you can run `bundle exec rake hn:import` to populate `Post`. It will import the Hacker News frontpage.

## Environment variables

```
# The environment for Rails to use
RACK_ENV=development

# The port on which we want to run the server
PORT=3000

# The canonical hostname for the application
CANONICAL_HOST=0.0.0.0

# Sentry (optional)
SENTRY_DSN=

# GitHub client infos
# Create your application at https://github.com/settings/applications
GITHUB_CLIENT_ID=
GITHUB_CLIENT_SECRET=

# Database URL to use in non-development environment (remove otherwise)
# DATABASE_URL=

# Rails secret key (to hash session data)
SECRET_TOKEN=
```

## Run tests

```
# Run the test suite
$ bundle exec rake spec
```
