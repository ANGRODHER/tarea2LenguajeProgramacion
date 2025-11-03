# pruebas/test_evaluador_expresiones.rb
require_relative '../evaluador_expresiones'
require 'rspec'

RSpec.describe EvaluadorExpresiones do
  describe '.evaluar' do
    it 'evalúa correctamente una expresión pre-fija' do
      expect(described_class.evaluar('PRE', '+ * + 3 4 5 7')).to eq(42)
    end

    it 'evalúa correctamente una expresión post-fija' do
      expect(described_class.evaluar('POST', '8 3 - 8 4 4 + * +')).to eq(69)
    end

    it 'lanza un error si el orden no es válido' do
      expect { described_class.evaluar('INVALID', '+ 1 2') }.to raise_error(ArgumentError)
    end
  end

  describe '.mostrar' do
    it 'convierte correctamente una expresión pre-fija a in-fija' do
      expect(described_class.mostrar('PRE', '+ * + 3 4 5 7')).to eq('((3 + 4) * 5) + 7')
    end

    it 'convierte correctamente una expresión post-fija a in-fija' do
      expect(described_class.mostrar('POST', '8 3 - 8 4 4 + * +')).to eq('((8 - 3) + (8 * (4 + 4)))')
    end
  end
end
