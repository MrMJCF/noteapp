class Note < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :notes, presence: true, uniqueness: true, length: { maximum: 10000 }
    belongs_to :user
    
    def self.search(search)
      if search
        Note.where("title like ?", "%#{search}%")
      else
        Note.all
      end
    end
end
