class Project < ActiveRecord::Base
  belongs_to :coder
  has_many :snippets, dependent: :destroy
end
