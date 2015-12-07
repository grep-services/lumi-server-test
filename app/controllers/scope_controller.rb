class ScopeController < ApiBaseController
    skip_before_filter :require_valid_token, only: :public

    def public
        @message = 'public'
        render "result/message", :formats => [:json], :handlers => [:jbuilder]
    end

    def author
        @message = 'authorized'
        render "result/message", :formats => [:json], :handlers => [:jbuilder]
    end
    
end         #ScopeController