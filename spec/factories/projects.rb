FactoryGirl.define do
  factory :project do
    project_name { Faker::Name.first_name + "'s project" }
    github_link "git.first_project@github.com"
    deadline "2014-11-07"
    description "Website to show off what I'm working on"
    priority 1
    coder_id 1000
    current true
  end
end
