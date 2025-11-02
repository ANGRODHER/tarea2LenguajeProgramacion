# collatz.rb
# Calcula la cantidad de pasos necesarios para llegar a 1 según la conjetura de Collatz.

# Método que calcula la distancia de Collatz para un número n.
# @param n [Integer] Número inicial.
# @return [Integer] Cantidad de pasos para llegar a 1.
# @raise [ArgumentError] Si n no es un entero positivo.
def collatz_distance(n)
  raise ArgumentError, "El argumento debe ser un entero positivo." unless n.is_a?(Integer) && n > 0

  steps = 0
  while n != 1
    n = n.even? ? n / 2 : 3 * n + 1
    steps += 1
  end
  steps
end

# Ejemplo de uso:
if __FILE__ == $0
  puts "Ingrese un número entero positivo:"
  input = gets.chomp.to_i
  begin
    distance = collatz_distance(input)
    puts "La distancia de Collatz para #{input} es: #{distance}"
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end
