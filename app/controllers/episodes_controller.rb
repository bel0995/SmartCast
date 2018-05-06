class EpisodesController < ApplicationController

	before_action :find_podcast, only: [:show, :index, :create, :new]

	def index
		@episodes= Episode.all
	end

	def new
		@episode = @podcast.episodes.new
	end
	def show 
		@episode = Episode.find(params[:id])
		@comments = @episode.comments
	end
  def edit 
    @episode = Episode.find(params[:id])
  end

	def destroy
		    @pod = Episode.find(params[:id]).podcast
    		Episode.find(params[:id]).destroy
    		redirect_to podcast_path(@pod),notice: "You deleted your episode"
  	end
  	def update
      @pod = Episode.find(params[:id]).podcast
   	 @episode = Episode.find(params[:id])
    	if @episode.update_attributes(episode_params)
    	  
     	 redirect_to podcast_path(@pod),notice: "You updated your episode"
    	else
      		render 'edit', notice: "Oops, something went wrong"
   	 end
	  end

	def create
		@episode= Episode.new
		if (!params[:episode][:name].present? or params[:episode][:description].nil?)
        
      		flash[:danger] = "Error in creating the episode!"
  			render 'new', notice: "Oops, something went wrong"
	  	else
	    	#@episode = current_user.podcasts.create(podcast_params)
	    	#@episode = @podcast.episodes.create(episode_params)
	    	  	@podcast = Podcast.find(params[:podcast_id])
  				input = episode_params.merge(podcast: @podcast)
				@episode = @podcast.episodes.build(input)
	    	#@podcast.user_id= current_user.id
	    if @episode.save
	    	flash[:success] = "Your episode was created!"
	      	redirect_to podcast_path(@podcast), notice: "You added a new episode!"
	    end
	end
	
end



def vote
    @episode = Episode.find(params[:id])
    type = params[:type]
    val = params[:v]
    
    @episode.votes.each do |v|
        if v.value == val.to_i && v.user == current_user
            redirect_to :back, notice: "You already voted in this way " + @episode.name
            return
        elsif v.user == current_user
            @episode.votes.destroy(v)
            redirect_to :back, notice: "You deleted your vote for " + @episode.name
            return
        end
    end
      
    
    @vote = Vote.new(:value => val.to_i, :user => current_user, :episode => @episode)
    
    if @vote.save
          redirect_to :back, notice: "You voted! " + @episode.name
    else
        redirect_to root_path
    end
  end


private
	def episode_params
		params.require(:episode).permit(:name, :description, :mp3, :image)
	end

	def find_podcast
		@podcast = Podcast.find(params[:podcast_id])
	end
end
