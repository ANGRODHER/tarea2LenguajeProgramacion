# main.rb
require_relative 'evaluador_expresiones'

def menu
  puts "Seleccione una acción:"
  puts "1. EVAL <orden><expr>"
  puts "2. MOSTRAR <orden><expr>"
  puts "3. SALIR"
  print "> "
  gets.chomp
end

loop do
  accion = menu
  partes = accion.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '').split
  comando = partes[0]

  case comando
  when "EVAL"
    if partes.length < 3
      puts "Error: Formato incorrecto. Use EVAL <PRE|POST> <expresión>"
      next
    end
    orden = partes[1].upcase
    expr = partes[2..-1].join(" ")
    begin
      resultado = EvaluadorExpresiones.evaluar(orden, expr)
      puts "Resultado: #{resultado}"
    rescue => e
      puts "Error: #{e.message}"
    end
  when "MOSTRAR"
    if partes.length < 3
      puts "Error: Formato incorrecto. Use MOSTRAR <PRE|POST> <expresión>"
      next
    end
    orden = partes[1].upcase
    expr = partes[2..-1].join(" ")
    begin
      resultado = EvaluadorExpresiones.mostrar(orden, expr)
      puts "Expresión in-fija: #{resultado}"
    rescue => e
      puts "Error: #{e.message}"
    end
  when "SALIR"
    puts "Saliendo del programa..."
    break
  else
    puts "Acción no reconocida. Intente de nuevo."
  end
end
