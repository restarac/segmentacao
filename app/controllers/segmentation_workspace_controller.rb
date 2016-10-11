class SegmentationWorkspaceController < ApplicationController
  def index
    @segmentations = Segmentation.all
  end

  def run
    @segmentation = Segmentation.find(params[:id])
    @contacts = @segmentation.search! "Contact"
  end
end
