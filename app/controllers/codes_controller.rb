class CodesController < ApplicationController
  before_filter :assign_download, :except => [:redeem, :do_redeem, :show, :attachment]
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
      wants.html do
        render 'index'
      end

      wants.pdf do
        render :pdf => 'index',
            :layout => 'layouts/application.pdf.haml',
            :margin => { :top => 0, # default 10 (mm)
                         :bottom => 0,
                         :left   => 0,
                         :right  => 0 }
      end
    end
  end

  def redeem
    @date = DateTime.now
    @code = DownloadCode.new
  end

  def show
    @code = DownloadCode.first(:conditions => {:code => params[:code] })
    @download = @code.download
  end

  def do_redeem
    code = DownloadCode.first(:conditions => {:code => params[:download_code][:code]})

    error = if code.nil?
      "Code '#{params[:download_code][:code]}' not found!"
    elsif code.expired?
      "Code '#{code.code}' already used!"
    end

    redirect_to redeem_download_code_path, :alert => error and return if error

    if code.redeemed? || code.update_attributes(params[:download_code].merge(:user_ip => request.remote_ip))
      redirect_to download_code_path(code.code)
    else
      @code = code
      render redeem
    end
  end

  def attachment
    code = DownloadCode.first(:conditions => {:code => params[:code] })
    @download = code.download
    send_file @download.zipfile.path, :type => 'application/zip'
  end

  private
  def assign_download
    @download = Download.find(params[:download_id])
  end
end
