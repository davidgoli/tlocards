class CodesController < ApplicationController
  before_filter :assign_download

  def new
  end

  def create
    code_generator = DownloadCodeGenerator.new(@download)
    code_generator.generate(params[:count].to_i)
    if @download.save
      redirect_to downloads_path
    else
      render new
    end
  end

  private
  def assign_download
    @download = Download.find(params[:download_id])
  end
end
