require_relative 'runner'

class RunMultiThread < Runner
  def download
    Thread.new { run }
  end
end
