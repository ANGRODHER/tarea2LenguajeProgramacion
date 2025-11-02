# mergesort.rb
# Implementación del algoritmo de ordenamiento MergeSort en Ruby.

# Método principal que ordena un arreglo usando MergeSort.
# @param array [Array] Arreglo a ordenar.
# @return [Array] Arreglo ordenado.
def mergesort(array)
  return array if array.length <= 1 # Caso base: arreglo de 0 o 1 elemento ya está ordenado

  # Divide el arreglo en dos mitades
  mid = array.length / 2
  left = array[0...mid]
  right = array[mid..-1]

  # Ordena cada mitad recursivamente
  left = mergesort(left)
  right = mergesort(right)

  # Combina las mitades ordenadas
  merge(left, right)
end

# Método auxiliar que fusiona dos arreglos ordenados.
# @param left [Array] Primera mitad ordenada.
# @param right [Array] Segunda mitad ordenada.
# @return [Array] Arreglo fusionado y ordenado.
def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    # Compara los primeros elementos de cada mitad y selecciona el menor
    sorted << (left.first <= right.first ? left.shift : right.shift)
  end
  # Agrega los elementos restantes (si los hay)
  sorted + left + right
end

# Ejemplo de uso:
if __FILE__ == $0
  puts "Ingrese una lista de números separados por espacios:"
  input = gets.chomp.split.map(&:to_i)
  sorted_array = mergesort(input)
  puts "Arreglo ordenado: #{sorted_array}"

end
