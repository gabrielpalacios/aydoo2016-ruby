class SinArgumentosError < StandardError

  def initialize(msg="No ha ingresado ningun parametro de entrada. Reintente")
    super
  end

end