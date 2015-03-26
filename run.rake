require 'benchmark/ips'

namespace :benchmark do
  task :run do
    number_of_task = 20
    main = Main.new(number_of_task)

    Benchmark.ips do |x|
      x.time = 5
      x.warmup = 2

      x.report("single thread") { main.run_single_thread }
      x.report("multithread") { main.run_multithread }
      x.report("fiber") { main.run_fiber }

      x.compare!
    end
  end
end
