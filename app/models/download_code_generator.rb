class DownloadCodeGenerator
  def initialize(download)
    @download = download
  end

  def generate(count)
    target_count = @download.download_codes.length + count
    while @download.download_codes.length < target_count
      @download.download_codes.build(:code => random_code)
    end
  end

  def random_code
    rand(36**8).to_s(36)
  end
end
