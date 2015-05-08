class Comment < ActiveRecord::Base
  belongs_to :movie
end
def self.descending
 order(:created_at => :desc)
end

