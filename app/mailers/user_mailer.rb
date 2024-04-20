class UserMailer
  def self.password_reset(user)
    Mail.deliver do
      to      user.email
      from    'nicolem.britto@gmail.com'
      subject 'Password Reset Instructions'

      text_part do
        body 'Here are your password reset instructions...'
      end

      html_part do
        content_type 'text/html; charset=UTF-8'
        body '<p>Here are your password reset instructions...</p>'
      end
    end
  end
end