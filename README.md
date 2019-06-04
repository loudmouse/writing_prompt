# This is DailyPrompt

DailyPrompt empowers a user to practice **object writing** on a daily basis.

**[Write something today at DailyPrompt](https://quiet-sea-41663.herokuapp.com/)**



## What is object writing?

Object writing is a daily exercise where you write about an object for 5 minutes. It's often used for songwriting and is a great way for creating a daily writing habit. You'll write about a single word/object in a free flow manner using your 5 senses - sight, touch, taste, smell, and sound. When the timer goes off you're done until the next day's daily writing prompt.

#### Features

- daily word generated from a word bank
- definitions from a 3rd party API
- a writing timer
- daily SMS reminders to write

#### The Tech

DailyPrompt is built with Ruby on Rails, Postgres, Wordnik, Twilio, and is hosted with Heroku.


### Done

- [x] add a timer
- [x] get timer to start with click of a button
- [x] show word from api
- [x] show definition
- [x] migration to add publish_date column to word model
- [x] increase Word.count to 365 (1/day)
- [x] give each word a publish_date
- [x] create a scope to access 'word of the day'
- [x] display definition on show
- [x] create list of 365 quality words
- [x] create rake task to instantiate word instances from a list of words in a csv file, and then persist these to the database.
- [x] delete old words
- [x] delete old prompts
- [x] add new words
- [x] add publish date to new words
- [x] update gemfile to use postgres for production db
- [x] deploy to heroku
- [x] migrate database
- [x] run rake task on heroku to import 365 words from csv and instantiate as words on production db
- [x] update the publish_date of each word on production db
- [x] update wordnik api key in ENV for deployment to heroku
- [x] updated heroku timezone so the word of the day changes according to local (chicago) time
- [x] update create account / login links
- [x] fixed bug where new prompt timer wouldn't start unless page was refreshed first. Related to the JS/Turbolinks not loading, see: https://stackoverflow.com/questions/17317816/rails-javascript-only-works-after-reload
- [x] moved timer into a partial
- [x] created singular resource for users#show to create a profile route
- [x] setup edit/update actions in the prompt controller
- [x] add edit button on prompt show page
- [x] setup a destroy action in the prompt controller - only allow prompt owner to delete
- [x] add delete button to the prompt show view - only allow prompt owner to view this button
- [x] style sign up / log in / edit
- [x] move word_count logic from controller into a method in the prompt model
- [x] use helper methods for the ivars currently in my controller
- [x] create a private method with a before_action in the prompt controller to prevent a user from editing/updating another user's prompt
- [x] add bootstrap .container to views for responsive width
- [x] add stats to user dashboard
- [x] total words written
- [x] make posted by text list username instead of email
- [x] redirect user to his/her prompt after creation
- [x] add field for username, city, and bio to sign up and edit forms
- [x] validate username at signup
- [x] add validation to bio to keep it at 200 characters max
- [x] add validation to ensure usernames are all unique
- [x] setup a tabbed form so user can write on the word of the day or a 'freewrite'
- [x] setup a user dashboard
- [x] display new prompt button on user's dashboard if they've not written today
- [x] display list of prompts on a user's home page
- [x] notify user via sms when it's time to write (using twilio)
- [x] stats: total prompts, total users, latest user to write prompt, total words written by all users


### Todo

- [ ] maybe use charts.js to display above stats on user dashboard
- [ ] FAQ's page
- [ ] show word type
- [ ] show word usage
- [ ] show synonyms
- [ ] related image
- [ ] add brown noise audio option
- [ ] timer alert in styled modal
- [ ] how could natural language processing be used? Analysis of part of speech? Sentiment of a prompt? http://www.thagomizer.com/blog/2017/04/13/the-google-nlp-api-meets-ruby.html
- [ ] use musixmatch api to allow user to select a few of his/her favorite artists and save to account. Then display song lyrics from a song of a favorite artist each day across the header of the site.
- [ ] make validation errors look nicer on the eyes
- [ ] setup recurring sms reminders. maybe like this: http://nithinbekal.com/posts/rails-recurring-events/
