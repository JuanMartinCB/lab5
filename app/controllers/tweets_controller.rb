class TweetsController < ApplicationController
    # GET /tweets
    def index
        @tweets = Tweet.all.order(:created_at => :desc)
    end

    #show all the info of a tweet
    def show
        @tweet = Tweet.find(params[:id])
    end

    #create a new tweet
    def new
        @tweet = Tweet.new
    end

    #create action for a new tweet
    def create
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to @tweet, notice: "Se ha creado el Tweet correctamente!"
        else
            render :new
        end
    end

    #private method for the tweet_params
    private
    def tweet_params
      params.require(:tweet).permit(:content, :monster_id)
    end    
end