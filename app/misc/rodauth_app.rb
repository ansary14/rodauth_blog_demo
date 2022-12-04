# frozen_string_literal: true

class RodauthApp < Rodauth::Rails::App
  # primary configuration
  configure RodauthMain

  # secondary configuration
  # configure RodauthAdmin, :admin

  route do |r|
    rodauth.load_memory # autologin remembered users

    r.rodauth # route rodauth requests

    # require_authentication for posts
    rodauth.require_authentication if r.path.start_with?('/posts')

    # require MFA if the user is logged in and has MFA setup
    rodauth.require_two_factor_authenticated if rodauth.uses_two_factor_authentication?

    # ==> Authenticating requests
    # Call `rodauth.require_account` for requests that you want to
    # require authentication for. For example:
    #
    # # authenticate /dashboard/* and /account/* requests
    # if r.path.start_with?("/dashboard") || r.path.start_with?("/account")
    #   rodauth.require_account
    # end
    # ==> Secondary configurations
    # r.rodauth(:admin) # route admin rodauth requests
  end
end
