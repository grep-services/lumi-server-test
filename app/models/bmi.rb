class Bmi < ActiveRecord::Base
    belongs_to :users, :dependent => :destroy
end
