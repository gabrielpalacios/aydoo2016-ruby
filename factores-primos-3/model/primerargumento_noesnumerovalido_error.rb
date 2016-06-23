class PrimerArgumentoNoEsNumeroValidoError < StandardError

  def initialize(msg="El primer Argumento debe ser un numero mayor a 1. Reintente")
    super
  end

end