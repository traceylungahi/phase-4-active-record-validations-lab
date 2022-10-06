class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { within: ["Fiction", "Non-Fiction"]}
    validate :title_is_clickbait

    TITLE_DOES_NOT_CONTAIN = [
        /Won't Believe/i,
        /Guess/i,
        /Top/i,
        /Guess/i
    ]
    

    def title_is_clickbait
        if TITLE_DOES_NOT_CONTAIN.none? {|word| word.match title}
            errors.add(:title, "Not enough clickbait")
        end    
    end 
end
