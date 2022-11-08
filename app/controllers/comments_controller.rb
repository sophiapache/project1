class CommentsController < ApplicationController
    def create
        @comment = @current_user.comments.new(comment_params)
        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end
        
        redirect_to event_path(@comment.event.ticket_id)
    end

    def destroy
        @comment = Comment.find(params[:event_id]).destroy
        redirect_to event_path(@comment.event.ticket_id)
    end

    private

    def comment_params
        params.require(:comment)
        .permit(:content)
        .merge(event_id: params[:event_id])
    end
end
