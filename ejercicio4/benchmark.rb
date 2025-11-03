# benchmark.rb
require 'benchmark'
require_relative 'F_alfa_beta'

ALFA = ((6 + 6) % 5) + 3  # => 5
BETA = ((6 + 9) % 5) + 3  # => 3
N = 30

Benchmark.bm do |x|
  x.report("Recursiva directa") { f_alfa_beta(N, ALFA, BETA) }
  x.report("Recursiva de cola") { f_alfa_beta_tail(N, ALFA, BETA) }
  x.report("Iterativa")          { f_alfa_beta_iter(N, ALFA, BETA) }
end
