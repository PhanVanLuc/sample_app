# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.last
    user.activation_token = User.new_token
    user.activation_digest = User.digest(user.activation_token)
    user.save!
    UserMailer.account_activation(user)
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.last
    user.reset_token = User.new_token
    user.reset_digest = User.digest(user.reset_token)
    user.save!
    
    UserMailer.password_reset(user)
  end

end
