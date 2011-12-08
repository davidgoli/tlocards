class DownloadsController < ApplicationController
  def index
    @downloads = Download.all
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(params[:download])
    if @download.save
      redirect_to(downloads_path, :notice => "Download '#{@download.title}' created")
    else
      render :action => new
    end
  end
end
