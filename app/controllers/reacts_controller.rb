class ReactsController < ApplicationController
  def create_or_update
    @comment = Comment.find(params[:comment_id])
    @post = @comment.post
    emoji = params[:emoji]
    existing_react = @comment.reacts.find_by(user: current_user)

    if existing_react
      if existing_react.emoji == emoji
        existing_react.destroy
      else
        existing_react.update(emoji: emoji)
        @react = existing_react
      end
    else
      @react = @comment.reacts.create(
        emoji: emoji,
        user: current_user
      )

    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post, notice: "Emoji updated" }
    end
  end
end
