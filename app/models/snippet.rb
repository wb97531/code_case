class Snippet < ActiveRecord::Base
  belongs_to :coder
  belongs_to :project
end
