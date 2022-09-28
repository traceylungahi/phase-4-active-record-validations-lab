class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { within: ["Fiction", "Non-Fiction"]}
    validate :title_is_clickbait
    

    def title_is_clickbait
        unless title = ("Won't Believe" "Secret" "Top [number]" "Guess")
            errors.add(:title, "Not enough clickbait")
        end    
    end 
end
