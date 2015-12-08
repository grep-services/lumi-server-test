# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:user_activation, :reset_password]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|
  # -- core --
  # What controller action to call for non-authenticated users. You can also
  # override the 'not_authenticated' method of course.
  # Default: `:not_authenticated`
  #
  # config.not_authenticated_action =


  # When a non logged in user tries to enter a page that requires login, save
  # the URL he wanted to reach, and send him there after login, using 'redirect_back_or_to'.
  # Default: `true`
  #
  # config.save_return_to_url =


  # Set domain option for cookies; Useful for remember_me submodule.
  # Default: `nil`
  #
  # config.cookie_domain =


  # Allow the remember_me cookie to be set through AJAX
  # Default: `true`
  #
  # config.remember_me_httponly =


  # -- session timeout --
  # How long in seconds to keep the session alive.
  # Default: `3600`
  #
  # config.session_timeout =


  # Use the last action as the beginning of session timeout.
  # Default: `false`
  #
  # config.session_timeout_from_last_action =


  # -- http_basic_auth --
  # What realm to display for which controller name. For example {"My App" => "Application"}
  # Default: `{"application" => "Application"}`
  #
  # config.controller_to_realm_map =


  # -- activity logging --
  # will register the time of last user login, every login.
  # Default: `true`
  #
  # config.register_login_time =


  # will register the time of last user logout, every logout.
  # Default: `true`
  #
  # config.register_logout_time =


  # will register the time of last user action, every action.
  # Default: `true`
  #
  # config.register_last_activity_time =


  # -- external --
  # What providers are supported by this app, i.e. [:twitter, :facebook, :github, :linkedin, :xing, :google, :liveid, :salesforce] .
  # Default: `[]`
  #
  # config.external_providers =


  # You can change it by your local ca_file. i.e. '/etc/pki/tls/certs/ca-bundle.crt'
  # Path to ca_file. By default use a internal ca-bundle.crt.
  # Default: `'path/to/ca_file'`
  #
  # config.ca_file =


  # For information about LinkedIn API:
  # - user info fields go to https://developer.linkedin.com/documents/profile-fields
  # - access permissions go to https://developer.linkedin.com/documents/authentication#granting
  #
  # config.linkedin.key = ""
  # config.linkedin.secret = ""
  # config.linkedin.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=linkedin"
  # config.linkedin.user_info_fields = ['first-name', 'last-name']
  # config.linkedin.user_info_mapping = {first_name: "firstName", last_name: "lastName"}
  # config.linkedin.access_permissions = ['r_basicprofile']
  #
  #
  # For information about XING API:
  # - user info fields go to https://dev.xing.com/docs/get/users/me
  #
  # config.xing.key = ""
  # config.xing.secret = ""
  # config.xing.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=xing"
  # config.xing.user_info_mapping = {first_name: "first_name", last_name: "last_name"}
  #
  #
  # Twitter will not accept any requests nor redirect uri containing localhost,
  # make sure you use 0.0.0.0:3000 to access your app in development
  #
  # config.twitter.key = ""
  # config.twitter.secret = ""
  # config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  # config.twitter.user_info_mapping = {:email => "screen_name"}
  #
  # config.facebook.key = ""
  # config.facebook.secret = ""
  # config.facebook.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=facebook"
  # config.facebook.user_info_mapping = {:email => "name"}
  # config.facebook.access_permissions = ["email", "publish_actions"]
  # config.facebook.display = "page"
  # config.facebook.api_version = "v2.2"
  #
  # config.github.key = ""
  # config.github.secret = ""
  # config.github.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=github"
  # config.github.user_info_mapping = {:email => "name"}
  #
  # config.google.key = ""
  # config.google.secret = ""
  # config.google.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=google"
  # config.google.user_info_mapping = {:email => "email", :username => "name"}
  #
  # config.vk.key = ""
  # config.vk.secret = ""
  # config.vk.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=vk"
  # config.vk.user_info_mapping = {:login => "domain", :name => "full_name"}
  #
  # To use liveid in development mode you have to replace mydomain.com with
  # a valid domain even in development. To use a valid domain in development
  # simply add your domain in your /etc/hosts file in front of 127.0.0.1
  #
  # config.liveid.key = ""
  # config.liveid.secret = ""
  # config.liveid.callback_url = "http://mydomain.com:3000/oauth/callback?provider=liveid"
  # config.liveid.user_info_mapping = {:username => "name"}

  # For information about JIRA API:
  # https://developer.atlassian.com/display/JIRADEV/JIRA+REST+API+Example+-+OAuth+authentication
  # to obtain the consumer key and the public key you can use the jira-ruby gem https://github.com/sumoheavy/jira-ruby
  # or run openssl req -x509 -nodes -newkey rsa:1024 -sha1 -keyout rsakey.pem -out rsacert.pem to obtain the public key
  # Make sure you have configured the application link properly

  # config.jira.key = "1234567"
  # config.jira.secret = "jiraTest"
  # config.jira.site = "http://localhost:2990/jira/plugins/servlet/oauth"
  # config.jira.signature_method =  "RSA-SHA1"
  # config.jira.private_key_file = "rsakey.pem"

  # For information about Salesforce API:
  # https://developer.salesforce.com/signup &
  # https://www.salesforce.com/us/developer/docs/api_rest/
  # Salesforce callback_url must be https. You can run the following to generate self-signed ssl cert
  # openssl req -new -newkey rsa:2048 -sha1 -days 365 -nodes -x509 -keyout server.key -out server.crt
  # Make sure you have configured the application link properly
  # config.salesforce.key = '123123'
  # config.salesforce.secret = 'acb123'
  # config.salesforce.callback_url = "https://127.0.0.1:9292/oauth/callback?provider=salesforce"
  # config.salesforce.scope = "full"
  # config.salesforce.user_info_mapping = {:email => "email"}

  # --- user config ---
  config.user_config do |user|
    # -- core --
    # specify username attributes, for example: [:username, :email].
    # Default: `[:email]`
    #
    user.username_attribute_names = [:name, :email]
    user.downcase_username_before_authenticating = true

    # how many times to apply encryption to the password.
    # Default: `nil`
    #
    # user.stretches =


    # -- remember_me --
    # How long in seconds the session length will be
    # Default: `604800`
    #
    # user.remember_me_for =


    # -- user_activation --
    user.user_activation_mailer = UserMailer
    user.activation_success_email_method_name = nil
    
    # user.activation_token_expiration_period = 
    # user.activation_mailer_disabled =

    # -- reset_password --
    user.reset_password_mailer = UserMailer
    # 30Min
    user.reset_password_expiration_period = 1800

    # -- brute_force_protection --
    # Failed logins attribute name.
    # Default: `:failed_logins_count`
    #
    # user.failed_logins_count_attribute_name =


    # This field indicates whether user is banned and when it will be active again.
    # Default: `:lock_expires_at`
    #
    # user.lock_expires_at_attribute_name =


    # How many failed logins allowed.
    # Default: `50`
    #
    # user.consecutive_login_retries_amount_limit =


    # How long the user should be banned. in seconds. 0 for permanent.
    # Default: `60 * 60`
    #
    # user.login_lock_time_period =

    # Unlock token attribute name
    # Default: `:unlock_token`
    #
    # user.unlock_token_attribute_name =

    # Unlock token mailer method
    # Default: `:send_unlock_token_email`
    #
    # user.unlock_token_email_method_name =

    # when true sorcery will not automatically
    # send email with unlock token
    # Default: `false`
    #
    # user.unlock_token_mailer_disabled = true

    # Unlock token mailer class
    # Default: `nil`
    #
    # user.unlock_token_mailer = UserMailer

  end
  config.user_class = "User"
end
