require 'test/unit'
require './calc'

class TestCalc < Test::Unit::TestCase

  def test_pow_mod
    calc = Calc.new
    expected = calc.pow_mod 2, 2, 100
    assert_equal expected, 4

    expected = calc.pow_mod 13, 2, 11
    assert_equal expected, 4

    expected = calc.pow_mod 2, 13, 11
    assert_equal expected, 8
  end
  
  def test_miller_rabin_pass
    calc = Calc.new
    expected = calc.miller_rabin_pass 221, 10
    assert_equal expected, false

    expected = calc.miller_rabin_pass 1567, 10
    assert_equal expected, true
  end

  def test_blum_blum_shub
    calc = Calc.new

    expected = calc.blum_blum_shub(13, 17, 10)
    assert_not_equal expected, 0
  end
end
