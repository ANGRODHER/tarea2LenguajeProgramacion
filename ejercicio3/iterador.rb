def ordenar_iterador(lista)
  lista_ordenada = lista.dup
  n = lista_ordenada.length
  (0...n).each do |i|
    (0...(n - i - 1)).each do |j|
      if lista_ordenada[j] > lista_ordenada[j + 1]
        lista_ordenada[j], lista_ordenada[j + 1] = lista_ordenada[j + 1], lista_ordenada[j]
      end
    end
  end
  lista_ordenada.each { |elemento| yield elemento }
end

lista = [1, 3, 3, 2, 1]
ordenar_iterador(lista) { |elemento| puts elemento }
