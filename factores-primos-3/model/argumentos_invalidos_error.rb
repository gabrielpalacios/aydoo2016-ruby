class ArgumentosInvalidosError < StandardError

  def initialize(msg="Ingreso de argumentos incorrectos, solo se aceptan format, sort y output-file")
    super
  end

end