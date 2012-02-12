class DownloadsController < ApplicationController
  before_filter :authenticate_user!

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
      render :action => :new
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def update
    @download = Download.find(params[:id])
    if @download.update_attributes(params[:download])
      @download.zipfile = params[:download][:zipfile]

      p params[:download][:zipfile]
      if !@download.save
        render :action => :edit and return
      end

      redirect_to(downloads_path, :notice => "Download '#{@download.title}' saved")
    else
      render :action => :edit
    end
  end

  def attachment
    @download = Download.find(params[:id])
    send_file @download.zipfile.path, :type => 'application/zip'
  end
end
