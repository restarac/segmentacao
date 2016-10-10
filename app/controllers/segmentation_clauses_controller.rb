class SegmentationClausesController < ApplicationController
  before_action :set_segmentation_clause, only: [:show, :edit, :update, :destroy]

  # GET /segmentation_clauses
  # GET /segmentation_clauses.json
  def index
    @segmentation_clauses = SegmentationClause.all
  end

  # GET /segmentation_clauses/1
  # GET /segmentation_clauses/1.json
  def show
  end

  # GET /segmentation_clauses/new
  def new
    @segmentation_clause = SegmentationClause.new
    @filters = Number.new
  end

  # GET /segmentation_clauses/1/edit
  def edit
  end

  # POST /segmentation_clauses
  # POST /segmentation_clauses.json
  def create
    @segmentation_clause = SegmentationClause.new(segmentation_clause_params)

    respond_to do |format|
      if @segmentation_clause.save
        format.html { redirect_to @segmentation_clause, notice: 'Segmentation clause was successfully created.' }
        format.json { render :show, status: :created, location: @segmentation_clause }
      else
        format.html { render :new }
        format.json { render json: @segmentation_clause.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /segmentation_clauses/1
  # PATCH/PUT /segmentation_clauses/1.json
  def update
    respond_to do |format|
      if @segmentation_clause.update(segmentation_clause_params)
        format.html { redirect_to @segmentation_clause, notice: 'Segmentation clause was successfully updated.' }
        format.json { render :show, status: :ok, location: @segmentation_clause }
      else
        format.html { render :edit }
        format.json { render json: @segmentation_clause.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segmentation_clauses/1
  # DELETE /segmentation_clauses/1.json
  def destroy
    @segmentation_clause.destroy
    respond_to do |format|
      format.html { redirect_to segmentation_clauses_url, notice: 'Segmentation clause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_segmentation_clause
      @segmentation_clause = SegmentationClause.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def segmentation_clause_params
      params.require(:segmentation_clause).permit(:compare_field, :compare_value, :segmentation_id, :segmentation_filter_id)
    end
end
