class Device < ActiveRecord::Base
    belongs_to :users, :dependent => :destroy
end
