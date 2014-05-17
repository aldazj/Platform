class Comment < ActiveRecord::Base
  belongs_to :videoitem
  belongs_to :person
end
