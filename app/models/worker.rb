class Worker < ApplicationRecord
    validates :name,:date,:shift , presence: true
    before_create :check_for_name_and_date

    
    def check_for_name_and_date
        if Worker.find_by(name: self.name ,date: self.date)
            self.name = nil
            self.date = nil
        end
    end
end
