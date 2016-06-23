class FormatoInvalidoError < StandardError

  def initialize(msg="Ingreso de formato incorrecto, solo se acepta pretty o quiet")
    super
  end

end