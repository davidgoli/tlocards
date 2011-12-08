class DownloadCodeGenerator
  def initialize(download)
    @download = download
  end

  def generate(count)
    while @download.download_codes.length < count
      @download.download_codes.build(:code => random_code)
    end
  end

  def random_code
    'abc'
  end
end
