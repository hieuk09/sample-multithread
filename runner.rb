class Runner
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def run
    puts "Downloading #{url}"
    sleep 0.1
  end
end
