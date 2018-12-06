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
- [ ] delete old words
- [ ] assign publish_date to the new words
- [ ] display list of prompts on a user's home page
- [ ] notify user via sms when it's time to write
- [ ] stats: total prompts, total users, latest user to write prompt, total words written by all users
- [ ] FAQ's page
- [ ] show word type
- [ ] show word usage
- [ ] show synonyms
- [ ] related image
- [ ] add brown noise audio option
- [ ] timer alert in styled modal


# How to give each word object a publish date

  words = Word.all
  date = Date.today

  words.count.times do |i|
    word = words[i]
    word.update_attributes!(publish_date: date)
    date = date + 1.day
  end

# Things I'm Learning / Have Learned

- memoization
- encapsulating logic in the model
- Abstract Base Model Classes
- creating a rake task
- using CSV to import data from a csv file and persist it to the database
- using a scope to access the word of the day
- making a call to the Wordnik API to get the definition of a word 
