require_relative 'runner'

class RunFiber < Runner
  def download
    Fiber.new { run }
  end
end
