class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    if params[:chapter_id].present?
      @chapter = Chapter.find(params[:chapter_id])
    end
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update  
    @content = Content.find(params[:id])
    
    if @content.present?
      if @content.summernote_content.present?
        if params[:content][:content].present? || params[:content][:content_files].present?
          params[:content][:summernote_content] = nil
        end
      elsif @content.content.present?
        if params[:content][:summernote_content].present? || params[:content][:content_files].present?
          params[:content][:content] = nil
        end
      elsif @content.content_files.present?
        if params[:content][:summernote_content].present? || params[:content][:content].present?
          params[:content][:content_files] = nil
        end
      end      
    end
    
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def download
    @content = Content.find(params[:id])    
    filepath = @content.content_files.current_path
    stat = File::stat(filepath)
    send_file(filepath, :filename => @content.content_files_identifier, :length => stat.size)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:title, :cont_order, :content, :chapter_id, :created_at, :updated_at, :content_files, :content_type, :summernote_content)
    end
end
