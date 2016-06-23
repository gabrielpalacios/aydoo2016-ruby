class SinNombreDeArchivoError < StandardError

  def initialize(msg="No ha especificado el nombre del archivo en parametro. Reintente")
    super
  end

end