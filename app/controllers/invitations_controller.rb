class InvitationsController < ApplicationController
    #before_action :logged_in?
    
    def index
        @user = current_user
        @recieved_invitations = @user.upcoming_events
        @sent_invitations = @user.previous_events
    end
    
    def new
        @invitation = Invitation.new
        @list_of_users = User.where.not("username = ?", current_user.username)
        @list_of_current_users_events = current_user.created_events
    end

    def create
        #Check for duplicate invitations
        @invitation = current_user.sent_invitation.build(invitation_params)
        if @invitation.save
            redirect_to @invitation
        else
            render 'new'
        end
    end

    def show
        @invitation = Invitation.find(params[:id])
    end

    def edit
        @invitation = Invitation.find(params[:id])
        @user = current_user

        if @user.id == @invitation.invitee_id
            render 'edit'
        else
            render 'new'
        end
    end

    def update
        @invitation = Invitation.find(params[:id])
        
        if params[:invitation][:attending] == '1'
            @invitation.update_attribute(:attending, 1)
            redirect_to @invitation
        else
            @invitation.update_attribute(:attending, 0)
            redirect_to @invitation
        end
    end

    private

        def invitation_params
            params.require(:invitation).permit(:invitee_id, :invited_events_id)
        end

end
