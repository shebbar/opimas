class Company < ActiveRecord::Base
  has_many :users
  before_save :normalize_email
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, allow_nil: true, :unless => Proc.new {|c| c.email.blank?}

  protected
    def normalize_email
      unless self.email.blank?
        self.email = email.downcase
      end
    end
end
