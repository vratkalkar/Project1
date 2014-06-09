class ContactForm < MailForm::Base
 attribute :name,  :validate => true
 attribute :email
 attribute :file,  :attachment => true

 attribute :message

 validates :name, :email, :message, presence: true


 def headers
  {
    subject: 'Post/Rank contact',
    to:      'vratkalkar@live.com',
    from:     %("#{name}" <#{email}>)
  }
  end
 end
