class DownloadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @downloads = Download.all
  end

  def new
    @download = Download.new
  end

  def create
    @download = Download.new(download_params[:download])
    if @download.save
      redirect_to(downloads_path, :notice => "Download '#{@download.title}' created")
    else
      render :action => :new
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(download_params[:download])
      @download.zipfile = download_params[:download][:zipfile]

      p params[:download][:zipfile]
      if !@download.save
        render :action => :edit and return
      end

      redirect_to(downloads_path, :notice => "Download '#{@download.title}' saved")
    else
      render :action => :edit
    end
  end

  private

  def download_params
    params.permit(:download, :artist, :title, :release_date)
  end
end
