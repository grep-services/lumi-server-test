class ScopeController < ApiBaseController
    skip_before_filter :require_valid_token, only: :public

    def public
        @message = 'public'
    end

    def restrict
        @message = 'authorized'
    end
    
end         #ScopeController