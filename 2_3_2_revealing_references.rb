class RevealingRefernces
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  # これで誰でもwheelにrimとtireを送ることができる
  Wheel = Struct.new(:rim, :tire)
  # wheelifyはrimとtireのメッセージに応答する小さなオブジェクトを作っている
  # wheelifyで Wheelクラスのオブジェクトの配列を作っている
  def wheelify(data)
    data.collect { |cell|
      Wheel.new(cell[0], cell[1])
    }
  end
end