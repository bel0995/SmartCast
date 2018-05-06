class CommentsController < ApplicationController

before_action :find_episode, only: [:show, :index, :create, :new]

  def create
  	@episode = Episode.find(params[:episode_id])
  	input = comment_params.merge(episode: @episode)
    	@comment = current_user.comments.build(input)
	@comment = @episode.comments.build(input)
	@comment.user=current_user
    if @comment.save
      redirect_to podcast_episode_path(@episode.podcast, @episode),notice: "You added a new comment!"
    else
      render 'new',notice: "Oops, something went wrong"
    end
  end

    def destroy
      @episode = Comment.find(params[:id]).episode
    Comment.find(params[:id]).destroy
    redirect_to podcast_episode_path(@episode.podcast, @episode),notice: "You deleted your comment!"
  end
	def new
		@comment = Comment.new
	end


  def show
  	@comment = Comment.find(params[:id])
  	
  end

  def edit 
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update_attributes(comment_params)
      redirect_to podcast_episode_path(@comment.episode.podcast, @comment.episode),notice: "You edited your comment!"
    else
      redirect_to root_path,notice: "Oops, something went wrong"
    end
  end


  private

    def comment_params
      params.require(:comment).permit(:content)
    end

def find_episode
		@episode = Episode.find(params[:episode_id])
	end
end

