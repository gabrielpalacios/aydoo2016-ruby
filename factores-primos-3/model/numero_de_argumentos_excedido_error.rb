class NumeroDeArgumentosExcedidoError < StandardError

  def initialize(msg="Ha ingresado mas de 4 argumentos. Reintente")
    super
  end

end