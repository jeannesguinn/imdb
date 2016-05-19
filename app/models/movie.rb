class Movie < ActiveRecord::Base
  has_and_belongs_to_many :actors

  def as_json(options={})
     super(:include => {:movies => {:only => [:title]}},
       except: [:created_at, :updated_at])
  end

  def self.search(search)
  where("title ILIKE ? OR title ILIKE ?", "%#{search}%", "%#{search}%") 
  end

end
