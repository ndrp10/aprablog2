class Article < ActiveRecord::Base
    include UrlsForHumans 
    require 'csv'  

    validates :title, presence: true, length: { minimum: 6, maximum: 150}
    validates :subtitle, presence: true, length: { minimum: 6, maximum: 150}
    validates :typetag, presence: true
    validates :private, presence: true
    validates :photo, presence: true
    validates :rich_body, presence: true

    has_one_attached :photo
    has_rich_text :rich_body
    urls_for_humans :title

    TAGS = ["Article", "Event", "Newsletter"]
    ANSWERS = ["Yes", "No"]
    validates :typetag, inclusion: {in: TAGS}  
    
    
    def self.to_csv
    users = all
    CSV.generate do |csv|
    csv << column_names
    users.each do |post|
        csv << post.attributes.values_at(*column_names)
            end
        end
    end

end