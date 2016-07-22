class Note < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true, length: { maximum: 150 }
    validates :notes, presence: true, uniqueness: true, length: { maximum: 10000 }
    validates :user_id, presence: true
    
    belongs_to :user
    
    default_scope -> { order(created_at: :desc) } # newest notes
    
    def self.search(search)
      if search
        Note.where("title like ?", "%#{search}%")
      else
        Note.all
      end
    end
end
