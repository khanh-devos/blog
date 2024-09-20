class TopicsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: %i[ index show ]

  before_action :authorize_admin_for_topic, only: %i[ new create edit update destroy ]
  
  before_action :set_topic, only: %i[ show edit update destroy ]

  # GET /topics or /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1 or /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics or /topics.json
  def create
    @topic = current_user.function.topics.build(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully created." }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1 or /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to topic_url(@topic), notice: "Topic was successfully updated." }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1 or /topics/1.json
  def destroy
    @topic.destroy!

    respond_to do |format|
      format.html { redirect_to topics_url, notice: "Topic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:title, :img_url, :content)
  end

  # Check if the current user is an admin with permission to control topics
  def authorize_admin_for_topic
    unless current_user.function.is_a?(Admin) && current_user.function.can_control_topic?
      redirect_to root_path, alert: "You are not authorized to manage topics."
    end
  end


end
