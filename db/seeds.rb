# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
######################################################################################################
Coder.create id: 500,
             coder_name: 'Wendy',
             password:  'codingisfun',
             password: 'codingisfun',
             email: 'wb9753@gmail.com'

Course.create title: 'Web Development with Ruby on Rails',
              completion_date: DateTime.new(2014,5,6),
              certificate: true,
              completed: true,
              coder_id: 500,
              place: 'DaVinci Institute',
              instructor: 'Daniel Stutzman',
              start_date: DateTime.new(2014,2,3),
              description: 'Beginner course covering: HTML, CSS, Ruby, Rails, REST & polymorphic routes, custom validation, model methods,  table association, gems, forms & partials'

Course.create title: 'Building the Toolbelt of a Junior Developer',
              completion_date: DateTime.new(2014,9,9),
              certificate: true,
              completed: true,
              coder_id: 500,
              place: 'DaVinci Institute',
              instructor: 'Jason Noble',
              start_date: DateTime.new(2014,6,5),
              description: 'Focus was on backend coding and covered: Ruby, TDD, Rspec, Rails, MVC, BDD, Capybara, Git, PivotalTracker, Agile,  API, JSON, Mailers, Scaffolds, Pair Programming'

Project.create project_name: 'Code Case',
               github_link: 'https://github.com/wb97531/code_case',
               deadline: DateTime.new(2014,12,30),
               description: 'An app to show what a coder has done and has been working on',
               priority: 1,
               coder_id: 500,
               current: true

Snippet.create objective: 'Give the dashboard associated collections for the dashboard view',
               image_name: 'https://gist.github.com/wb97531/30c3f42a9c0dbf3349e8.js',
               github_file_link: 'https://github.com/wb97531/code_case/blob/master/app/controllers/dashboards_controller.rb',
               project_id: 1,
               coder_id: 500

Snippet.create objective: 'Loading gist image on snippet show page',
               image_name: 'https://gist.github.com/wb97531/55761ed56412fc1a750a.js',
               github_file_link: 'https://github.com/wb97531/code_case/blob/master/app/views/snippets/show.html.erb',
               project_id: 1,
               coder_id: 500
