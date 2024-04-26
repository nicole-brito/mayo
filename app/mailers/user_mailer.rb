class UserMailer
  def self.password_reset(user)
    Mail.deliver do
      to      user.email
      from    'nicolem.britto@gmail.com'
      subject I18n.t('user_mailer.password_reset.subject')

      text_part do
        body I18n.t('user_mailer.password_reset.text_body')
      end

      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>#{I18n.t('user_mailer.password_reset.html_body')}</p>"
      end
    end
  end
end

mail(to: user.email, subject: default_i18n_subject(user: user.name))
