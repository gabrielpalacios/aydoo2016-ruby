class ManejoDeArchivos

  def self.crearArchivo(nombre_archivo, retorno)
    # Crea un nuevo fichero, y escribe
    #retorno = false
    begin
      File.open(nombre_archivo, 'w') do |f2|
        f2.puts retorno
      end
      return true
    rescue Exception => msg
      # dispone el mensaje de error
      print "Error al intentar escribir archivo: "
      puts msg
    end
    return false
  end

  def self.leerArchivo(nombre_archivo)

    retortno = ""
    File.open(nombre_archivo, 'r') do |archivo|
      while linea = archivo.gets
        retortno = retortno + linea
      end
    end
    return retortno
  end


end