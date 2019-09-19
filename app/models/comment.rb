class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :place
	after_create :send_comment_email

	RATINGS = {
		'One Star ★': '★',
		'Two Stars ★★': '★★',
		'Three Stars ★★★': '★★★',
		'Four Stars ★★★★': '★★★★',
		'Five Stars ★★★★★': '★★★★★'
	}

	def humanized_rating
		RATINGS.invert[self.rating]
	end

	def send_comment_email
		NotificationMailer.comment_added(self).deliver_now
	end
end
