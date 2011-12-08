class CodesController < ApplicationController
  before_filter :assign_download, :except => [:redeem, :do_redeem]
  before_filter :authenticate_user!, :only => [:new, :create, :index]

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

  def index
    @codes = @download.download_codes
    respond_to do |wants|
      wants.pdf do
        render :pdf => 'index'
      end
    end
  end

  def redeem
    @date = DateTime.now
    @code = DownloadCode.new
  end

  def do_redeem
    code = DownloadCode.first(:conditions => {:code => params[:download_code][:code]})

    error = if code.nil?
      'Code not found'
    elsif code.redeemed?
      'Code already used'
    end

    redirect_to redeem_download_code_path, :alert => error and return if error

    if code.update_attributes(params[:download_code])
      redirect_to download_path
    else
      @code = code
      render redeem
    end
  end

  private
  def assign_download
    @download = Download.find(params[:download_id])
  end
end
