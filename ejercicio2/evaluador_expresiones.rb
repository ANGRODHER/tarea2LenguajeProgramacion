class EvaluadorExpresiones
  def self.evaluar(orden, expr)
    tokens = expr.split
    if orden == 'PRE'
      evaluar_prefija(tokens)
    elsif orden == 'POST'
      evaluar_postfija(tokens)
    else
      raise ArgumentError, "Orden no válido. Use 'PRE' o 'POST'."
    end
  end

  def self.evaluar_prefija(tokens)
    pila = []
    tokens.reverse.each do |token|
      if operador?(token)
        op1 = pila.pop
        op2 = pila.pop
        resultado = aplicar_operador(token, op1, op2)
        pila.push(resultado)
      else
        pila.push(token.to_i)
      end
    end
    pila.pop
  end

  def self.evaluar_postfija(tokens)
    pila = []
    tokens.each do |token|
      if operador?(token)
        op2 = pila.pop
        op1 = pila.pop
        resultado = aplicar_operador(token, op1, op2)
        pila.push(resultado)
      else
        pila.push(token.to_i)
      end
    end
    pila.pop
  end

  def self.mostrar(orden, expr)
  tokens = expr.split
  if orden == 'PRE'
    infija = convertir_prefija_a_infija(tokens)
  elsif orden == 'POST'
    infija = convertir_postfija_a_infija(tokens)
  else
    raise ArgumentError, "Orden no válido. Use 'PRE' o 'POST'."
  end
  eliminar_parentesis_innecesarios(infija)
end

  def self.convertir_prefija_a_infija(tokens)
    pila = []
    tokens.reverse.each do |token|
      if operador?(token)
        op1 = pila.pop
        op2 = pila.pop
        expr = "(#{op1} #{token} #{op2})"
        pila.push(expr)
      else
        pila.push(token)
      end
    end
    pila.pop
  end

  def self.convertir_postfija_a_infija(tokens)
    pila = []
    tokens.each do |token|
      if operador?(token)
        op2 = pila.pop
        op1 = pila.pop
        expr = "(#{op1} #{token} #{op2})"
        pila.push(expr)
      else
        pila.push(token)
      end
    end
    pila.pop
  end

  def self.aplicar_operador(operador, op1, op2)
    case operador
    when '+'
      op1 + op2
    when '-'
      op1 - op2
    when '*'
      op1 * op2
    when '/'
      op1 / op2
    else
      raise ArgumentError, "Operador no válido: #{operador}"
    end
  end

  def self.operador?(token)
    %w[+ - * /].include?(token)
  end

  def self.eliminar_parentesis_innecesarios(expr)
  # Eliminar paréntesis externos redundantes
  while expr.start_with?('(') && expr.end_with?(')') && expresion_balanceada?(expr[1..-2])
    expr = expr[1..-2]
  end
  expr
end

  def self.expresion_balanceada?(expr)
    balance = 0
    expr.each_char do |char| 
      balance += 1 if char == '('
      balance -= 1 if char == ')'
      return false if balance < 0
    end
    balance.zero?
  end
end
