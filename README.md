# README

- [x] migration to add publish_date column to word model
- [x] increase Word.count to 365 (1/day)
- [x] give each word a publish_date
- [x] create a scope to access 'word of the day'
- [x] show word from api
- [x] show definition
- [x] show word type
- [ ] show word usage
- [ ] show synonyms
- [x] add a timer
- [x] get timer to start with click of a button
- [ ] app styling
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
