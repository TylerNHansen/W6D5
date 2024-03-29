class SecretsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @secret = Secret.new(secret_params)
    @secret.author = current_user
    @secret.tags = Tag.where(tag_params)


    if @secret.save
      redirect_to user_url(@secret.recipient_id)
    else
      redirect_to user_url(@secret.recipient_id)
    end
  end


  def secret_params
    params.require(:secret).permit(:recipient_id, :title)
  end

 # Parameters: "tags"=>{"body"=>["#yolo", "superYOLO"]}}



  def tag_params
    params.require(:tags).permit(body: [])
  end
end
