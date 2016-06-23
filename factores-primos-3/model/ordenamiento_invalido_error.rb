class OrdenamientoInvalidoError < StandardError

  def initialize(msg="Ingreso de ordenamiento incorrecto, solo se acepta asc o des. Reintente")
    super
  end

end