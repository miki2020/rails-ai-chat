class ChatsController < ApplicationController
  before_action :require_authentication
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to chats_url, alert: "Try again later." }

  # GET /chats
  # GET /chats.json

  def new
    @chat = Current.user.chats.new(model_id: "ollama3.2:3b", provider: "ollama")
  end

  def index
    @chats = Current.user.chats
    @chats = @chats.order(created_at: :desc) # Order chats by creation date

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chats }
    end
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    @chat = Current.user.chats.find(params[:id])
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = Current.user.chats.new(chat_params)

    if @chat.save
      redirect_to @chat, notice: 'Chat was successfully created.'
    else
      render :new
    end
  end

  def edit
    @chat = Current.user.chats.find(params[:id])
  end

  def update
    @chat = Current.user.chats.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render :edit
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:model_id, :provider)
  end
end
