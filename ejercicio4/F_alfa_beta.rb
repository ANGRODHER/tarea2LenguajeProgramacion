# constamtes
X = 6
Y = 6
Z = 9

ALFA = ((X + Y) % 5) + 3
BETA = ((Y + Z) % 5) + 3

puts "Constantes calculadas:"
puts "α (alfa) = #{ALFA}"
puts "β (beta) = #{BETA}"

# (a) Recursiva directa
def f_alfa_beta(n, alfa, beta)
  limite = alfa * beta
  return n if n < limite

  suma = 0
  (1..alfa).each do |i|
    suma += f_alfa_beta(n - beta * i, alfa, beta)
  end
  suma
end

#Recursiva de cola (con memoización)
def f_alfa_beta_tail(n, alfa, beta, memo = {})
  limite = alfa * beta
  return n if n < limite
  return memo[n] if memo.key?(n)

  def helper(n, alfa, beta, i, acc, memo)
    return acc if i > alfa
    acc += f_alfa_beta_tail(n - beta * i, alfa, beta, memo)
    helper(n, alfa, beta, i + 1, acc, memo)
  end

  memo[n] = helper(n, alfa, beta, 1, 0, memo)
end

# Iterativa
def f_alfa_beta_iter(n, alfa, beta)
  limite = alfa * beta
  resultados = Array.new(n + 1, 0)

  (0...limite).each { |i| resultados[i] = i }

  (limite..n).each do |i|
    suma = 0
    (1..alfa).each do |j|
      suma += resultados[i - beta * j]
    end
    resultados[i] = suma
  end

  resultados[n]
end

n = 30
puts "Valor de entrada n = #{n}"

resultado_a = f_alfa_beta(n, ALFA, BETA)
puts "→ (a) Recursiva directa: #{resultado_a}"

resultado_b = f_alfa_beta_tail(n, ALFA, BETA)
puts "→ (b) Recursiva de cola: #{resultado_b}"

resultado_c = f_alfa_beta_iter(n, ALFA, BETA)
puts "→ (c) Iterativa: #{resultado_c}"

puts "-" * 40

# Verificación
if resultado_a == resultado_b && resultado_b == resultado_c
  puts "Todas las implementaciones producen el mismo resultado."
else
  puts "Las implementaciones producen resultados diferentes."
end



