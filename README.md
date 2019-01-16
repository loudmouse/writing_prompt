# README

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
- [ ] ~~raise exception handling for unauthorized user 403 error - in edit and update actions on the prompt controller~~
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
- [ ] make validation errors look nicer on the eyes
- [x] setup a user dashboard
- [x] display new prompt button on user's dashboard if they've not written today
- [x] display list of prompts on a user's home page
- [ ] notify user via sms when it's time to write
- [x] stats: total prompts, total users, latest user to write prompt, total words written by all users
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


# To import words from csv file for dev env
  <!--  in terminal run -->
  rake import:words

# How to give each word object a publish date

<!-- in console run -->

  words = Word.all
  date = Date.today

  words.count.times do |i|
    word = words[i]
    word.update_attributes!(publish_date: date)
    date = date + 1.day
  end

# To setup Wordnik for daily word definitions
  - request a Wordnik api key
  - use figaro to save the api key securely
  - follow wordnik docs to add file to config/initializers and reference your wordknik api key as saved in the figaro file
  - restart rails server

# Things I'm Learning / Have Learned

- memoization
- encapsulating logic in the model
- Abstract Base Model Classes
- creating a rake task
- using CSV to import data from a csv file and persist it to the database
- using a scope to access the word of the day
- making a call to the Wordnik API to get the definition of a word
- method delegation

# What is a writing streak

what is a writing streak?

- the number of consecutive days you've saved a prompt
- how do you check if a prompt is saved?
 - if a prompt with a create_date == yesterday && a prompt with a create_date == today, then you are on a streak
 - streak = []
 - if streak == true, then add prompt to streak
- get streak.length
- longest_streak = 0
- if streak.length > longest_streak, then longest_streak = streak

# How to start watching for delayed jobs
in terminal type:
  bin/delayed_job start

# How to force a delayed job to run by id
in console type:
  Delayed::Job.find(:id).invoke_job
