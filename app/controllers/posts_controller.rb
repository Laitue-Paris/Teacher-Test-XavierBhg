class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def show
    @comment = Comment.new
    @comments = @post.comments
    @react = React.new

  end

  def update
    existing_vote = @post.votes.find_by(user: current_user)
    if existing_vote
      existing_vote.destroy
      @post.decrement!(:vote_count)
    else
      @post.votes.create(user: current_user)
      @post.increment!(:vote_count)
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post, notice: "Vote updated" }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
