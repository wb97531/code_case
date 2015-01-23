# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
######################################################################################################
# Coder.create id: 500,
#              coder_name: 'Wendy',
#              password:  'codingisfun',
#              password: 'codingisfun',
#              email: 'wb9753@gmail.com'
#
# Course.create title: 'Web Development with Ruby on Rails',
#               completion_date: DateTime.new(2014,5,6),
#               certificate: true,
#               completed: true,
#               coder_id: 500,
#               place: 'DaVinci Institute',
#               instructor: 'Daniel Stutzman',
#               start_date: DateTime.new(2014,2,3),
#               description: 'Beginner course covering: HTML, CSS, Ruby, Rails, REST & polymorphic routes, custom validation, model methods,  table association, gems, forms & partials'
#
# Course.create title: 'Building the Toolbelt of a Junior Developer',
#               completion_date: DateTime.new(2014,9,9),
#               certificate: true,
#               completed: true,
#               coder_id: 500,
#               place: 'DaVinci Institute',
#               instructor: 'Jason Noble',
#               start_date: DateTime.new(2014,6,5),
#               description: 'Focus was on backend coding and covered: Ruby, TDD, Rspec, Rails, MVC, BDD, Capybara, Git, PivotalTracker, Agile,  API, JSON, Mailers, Scaffolds, Pair Programming'

Course.create title: 'Java Essential Training',
              completion_date: DateTime.new(2015,1,22),
              certificate: true,
              completed: true,
              coder_id: 500,
              place: 'lynda.com',
              instructor: 'David Gassner',
              start_date: DateTime.new(2011,1,5),
              description: 'lynda.com\'s description:  This course demonstrates how to install both Java and the Eclipse IDE and dives into the particulars of programming. The course also explains the fundamentals of Java, from creating simple variables, assigning values, and declaring methods to working with strings, arrays, and subclasses; reading and writing to text files; and implementing object oriented programming concepts.
Topics include:
Understanding the history and principles of Java
Installing Eclipse and Java
Compiling and running from the command line
Managing memory and performing garbage collection
Declaring and initializing variables
Writing conditional code
Building and parsing strings
Debugging and exception handling
Using simple arrays
Creating custom classes
Working with encapsulation, inheritance, and polymorphism
Managing files
Documenting code with Javadocs -- http://www.lynda.com/Java-tutorials/Essential-Training/86005-2.html'

# Project.create project_name: 'Code Case',
#                github_link: 'https://github.com/wb97531/code_case',
#                deadline: DateTime.new(2014,12,30),
#                description: 'An app to show what a coder has done and has been working on',
#                priority: 1,
#                coder_id: 500,
#                current: true,
#                browser_project_link: 'https://code-case.herokuapp.com/'
#
# Snippet.create objective: 'Give the dashboard associated collections for the dashboard view',
#                image_name: 'https://gist.github.com/wb97531/30c3f42a9c0dbf3349e8.js',
#                github_file_link: 'https://github.com/wb97531/code_case/blob/master/app/controllers/dashboards_controller.rb',
#                project_id: 1,
#                coder_id: 500
#
# Snippet.create objective: 'Loading gist image on snippet show page',
#                image_name: 'https://gist.github.com/wb97531/0bc8d43411866be3eaf1.js',
#                github_file_link: 'https://github.com/wb97531/code_case/blob/master/app/views/snippets/show.html.erb',
#                project_id: 1,
#                coder_id: 500
