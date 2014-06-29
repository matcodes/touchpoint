ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :authentication => :login,
    :user_name => "touchpointsoftware",
    :password => "phish123",
    :enable_starttls_auto => true
}