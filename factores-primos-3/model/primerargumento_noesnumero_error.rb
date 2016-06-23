class PrimerArgumentoNoEsNumeroError < StandardError

  def initialize(msg="El primer Argumento debe ser un numero. Reintente")
    super
  end

end