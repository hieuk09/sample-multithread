require_relative 'run_multi_thread'
require_relative 'run_single_thread'
require_relative 'run_fiber'

class Main
  attr_reader :number_of_task

  def initialize(number_of_task)
    @number_of_task = number_of_task
  end

  def urls
    @urls = number_of_task.times.map do |index|
      "www.url_#{index}.com"
    end
  end

  def run_single_thread
    urls.each do |url|
      RunSingleThread.new(url).download
    end
  end

  def run_multithread
    threads = urls.map do |url|
      RunMultiThread.new(url).download
    end

    threads.each(&:join)
  end

  def run_fiber
    fibers = urls.map do |url|
      RunFiber.new(url).download
    end

    fibers.each(&:resume)
  end
end
