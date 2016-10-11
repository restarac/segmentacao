class SegmentationClausesController < ApplicationController
  before_action :find_clause, only: [:update, :edit, :destroy]
  before_action :new_clause, only: [:new, :create]
  before_action :fill_fields, only: [:new, :edit]

  def show
  end

  def new
  end

  def edit
  end

  def create
    respond_to do |format|
      if @segmentation_clause.save
        format.html { redirect_to new_segmentation_clause_path, notice: 'Segmentation clause was successfully created.' }
        format.json { render :show, status: :created, location: @segmentation_clause }
      else
        format.html { render :new }
        format.json { render json: @segmentation_clause.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @segmentation_clause.update(segmentation_clause_params)
        format.html { redirect_to new_segmentation_clause_path, notice: 'Segmentation clause was successfully updated.' }
        format.json { render :show, status: :ok, location: @segmentation_clause }
      else
        format.html { render :edit }
        format.json { render json: @segmentation_clause.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @segmentation_clause.destroy
    respond_to do |format|
      format.html { redirect_to new_segmentation_clause_path, notice: 'Segmentation clause was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_clause
      @segmentation_clause = SegmentationClause.find(params[:id])
    end

    def new_clause
      @segmentation_clause = SegmentationClause.new
      @segmentation_clause.segmentation = Segmentation.find(params[:segmentation_id])
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def segmentation_clause_params
      params.require(:segmentation_clause).permit(:compare_field, :compare_value, :segmentation_id, :segmentation_filter_id)
    end

    def fill_fields
      @segmentation_other_clauses = @segmentation_clause.segmentation.segmentation_clauses
      @filters = NumberSegmentationFilter.all.collect { |number| ["Number - #{number.name}", number.id] }
      @filters += TextSegmentationFilter.all.collect { |text| ["Text - #{text.name}", text.id] }
    end
end
