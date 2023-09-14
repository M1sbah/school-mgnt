class Teacher < ApplicationRecord
	paginates_per 9
	validates :name, :email, :address, :contact, presence: true
	validates :email, uniqueness: true
	validates :subject_id , presence: true
	has_one_attached :image
	belongs_to :subject
	validate :subject_present, :phone_validate

	 def self.ransackable_attributes(auth_object = nil)
	 	%w(name)   
	 end

	 private
	 def subject_present
	 	errors.add(:subject_id, "must be present") if subject_id.blank?
	 end

	 def phone_validate
	 	if contact.present?
	 		errors.add(:contact, "number incorrect") if contact.digits.length != 10
	 	end
	 end
end
