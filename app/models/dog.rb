class Dog < ActiveRecord::Base
    validates :name, :age, presence: true
end
