class DownloadsController < ApplicationController
  def index
    @downloads = Download.all
  end

  def new
    @download = Download.new
  end
end
