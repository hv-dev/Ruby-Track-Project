This Repository was built by Harry Verrall

# Project Requirements

### Option One - Data Analytics Project

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have at minimum three models including one join model. This means you must have a many-to-many relationship.
3. You should seed your database using data that you collect either from a CSV, a website by scraping, or an API.
4. Your models should have methods that answer interesting questions about the data. For example, if you've collected info about movie reviews, what is the most popular movie? What movie has the most reviews?
5. You should provide a CLI to display the return values of your interesting methods.  
6. Use good OO design patterns. You should have separate classes for your models and CLI interface.

  **Resource:** [Easy Access APIs](https://github.com/learn-co-curriculum/easy-access-apis)

### Option Two - Command Line CRUD App

1. Access a Sqlite3 Database using ActiveRecord.
2. You should have a minimum of three models.
3. You should build out a CLI to give your user full CRUD ability for at least one of your resources. For example, build out a command line To-Do list. A user should be able to create a new to-do, see all todos, update a todo item, and delete a todo. Todos can be grouped into categories, so that a to-do has many categories and categories have many to-dos.
4. Use good OO design patterns. You should have separate models for your runner and CLI interface.

### Brainstorming and Proposing a Project Idea

Projects need to be approved prior to launching into them, so take some time to brainstorm project options that will fulfill the requirements above.  You must have a minimum of four [user stories](https://en.wikipedia.org/wiki/User_story) to help explain how a user will interact with your app.  A user story should follow the general structure of `"As a <role>, I want <goal/desire> so that <benefit>"`. In example, if we were creating an app to randomly choose nearby restaurants on Yelp, we might write:

* As a user, I want to be able to enter my name to retrieve my records
* As a user, I want to enter a location and be given a random nearby restaurant suggestion
* As a user, I should be able to reject a suggestion and not see that restaurant suggestion again
* As a user, I want to be able to save to and retrieve a list of favorite restaurant suggestions

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Be prepared to present your project to your peers (3 - 5 minutes) 
  * _See below for instructions_
6. *OPTIONAL* Prepare a video demo (narration helps!) describing how a user would interact with your working project.
7. *OPTIONAL*: Write a blog post about the project and process.

## Short Presentation Requirements

Presenting to others on a technical topic is something you will do several times throughout your experience. This will allow you to practice exercising some important skills. 

#### Technical Presentation Requirements
Having built your project on your own or with a partner, you are the expert on it! Even though that's the case, talking about techincal topics can be challenging. Do your best to communicate what you have learned in a way others can digest.
  - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
  - Discuss 3 things you learned in the process of working on this project.
  - Address, if anything, what you would change or add to what you have today?
  - Present any code you would like to highlight.   
  - Be prepared to answer questions from your peers!

---
### Common Questions:
- How do I turn off my SQL logger?
```ruby
# in config/environment.rb add this line:
ActiveRecord::Base.logger = nil
```

### Useful links:
- [Sinatra ActiveRecord Usage](https://www.rubydoc.info/gems/sinatra-activerecord)
- [Activerecord Basics](https://guides.rubyonrails.org/active_record_basics.html)
