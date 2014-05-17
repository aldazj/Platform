class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :signed_in_person
  before_filter :verify_access, only: [:index]


  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
      @videoitem = Videoitem.find(params[:videoitem_id])
      @comment = @videoitem.comments.new(comment_params)
      @comment.is_available = true
      @comment.date = Time.now.strftime("%Y-%d-%m %H:%M:%S %Z")
      @comment.person_id = current_person.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @videoitem, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @videoitem }
      else
        format.html { render action: 'new' }
        format.json { render json: @videoitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:id, :message, :is_available, :date, :url, :videoitem_id, :owner)
    end

    def verify_access
        if current_person.type != 'Admin'
            respond_to do |format|
                format.html { render :file => "#{Rails.root}/public/422.html", :status => :unprocessable_entity, :layout => false }
            end
        end
    end
end
