class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
     includes(boats: :classifications).where(classifications: {name: 'Catamaran'})
   end

   def self.sailors
     includes(boats: :classifications).where(classifications: {name: 'Sailboat'}).uniq
   end

   def self.talented_seafarers
     includes(boats: :classifications).where(classifications: {name: 'Motorboat'}).uniq & sailors
   end

   def self.non_sailors
     all - sailors
   end
 end
