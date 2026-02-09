require_relative '../lib/caesar_cipher'

describe CaesarCipher do
  describe '#encrypt' do
    # subject(:encryption) { described_class.new('abc', 1) }

    it 'return bcd for input abc and shift 1' do
      cipher = CaesarCipher.new('abc', 1)
      result = cipher.encrypt
      expect(result).to eq('bcd')
    end

    it 'return BCD for input ABC and shift 1' do
      cipher = CaesarCipher.new('ABC', 1)
      result = cipher.encrypt
      expect(result).to eq('BCD')
    end

    it 'return BcD for input AbC and shift 1' do
      cipher = CaesarCipher.new('AbC', 1)
      result = cipher.encrypt
      expect(result).to eq('BcD')
    end
    it 'return abc for input xyz and shift 3' do
      cipher = CaesarCipher.new('xyz', 3)
      result = cipher.encrypt
      expect(result).to eq('abc')
    end
  end
end
