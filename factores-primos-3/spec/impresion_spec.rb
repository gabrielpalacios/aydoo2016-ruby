require 'rspec' 
require_relative '../model/impresion'

describe 'Impresion' do

	 it 'testSoloConNroIdemPretty' do
	 	#'nro, array, formato_elegido, sort_elegido, nombre_archivo) '
	 	vec = [2, 2, 2, 3, 3, 5]
	 	#ok con objeto = Impresion.new 360, vec, "pretty", "asc", ""
	 	objeto = Impresion.new 360, vec, "", "", ""
	 	vectorEsperado = "Factores primos 360: 2 2 2 3 3 5 "
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test1NroMasPretty' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "pretty", "", ""
	 	vectorEsperado = "Factores primos 360: 2 2 2 3 3 5 "
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test2MasPrettyAsc' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "pretty", "asc", ""
	 	vectorEsperado = "Factores primos 360: 2 2 2 3 3 5 "
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test3quietSinNadaMasSeriaIdemAsc' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "", ""
	 	vectorEsperado = "2" + "\n" + "2" + "\n" + "2" + "\n" + "3" + "\n" + "3" + "\n" + "5" + "\n"
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test4quietSortDes' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "des", ""
	 	vectorEsperado = "5" + "\n" + "3" + "\n" + "3" + "\n" + "2" + "\n" + "2" + "\n" + "2" + "\n"
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test5quietSortAsc' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "asc", ""
	 	vectorEsperado = "2" + "\n" + "2" + "\n" + "2" + "\n" + "3" + "\n" + "3" + "\n" + "5" + "\n"
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test6QuietSortAscSalidaQuiet' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "asc", "salidaquiet.txt"
	 	vectorEsperado = nil
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test7MasPrettyOutput' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "pretty", "asc", "salidapretty.txt"
	 	vectorEsperado = nil
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test8quietSortDesMayuscula' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "DES", ""
	 	vectorEsperado = "5" + "\n" + "3" + "\n" + "3" + "\n" + "2" + "\n" + "2" + "\n" + "2" + "\n"
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test9quietMayusSortDesMayus' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "Quiet", "DES", ""
	 	vectorEsperado = "5" + "\n" + "3" + "\n" + "3" + "\n" + "2" + "\n" + "2" + "\n" + "2" + "\n"
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end
	
	 it 'test10AscQuietMalIngresado' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quietSaraza", "asc", ""
	 	vectorEsperado = "Formato no aceptado. Las opciones posibles son: pretty o quiet."
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end

	 it 'test11SortQuietAscMalIngresado' do
	 	vec = [2, 2, 2, 3, 3, 5]
	 	objeto = Impresion.new 360, vec, "quiet", "ascLALA", ""
	 	vectorEsperado = "Formato no aceptado. Las opciones posibles son: asc o des."
	 	expect(objeto.obtenerTextoAMostrar).to eq vectorEsperado
	 end


	 #after :all do
	 it 'test12RecuperoLecturaArchivoQuiet' do
	 	acumulo_linea = ""
		File.open('salidaquiet.txt', 'r') do |f1|
  			while linea = f1.gets
	    		acumulo_linea += linea 
  			end
		end
		vectorEsperado = "2" + "\n" + "2" + "\n" + "2" + "\n" + "3" + "\n" + "3" + "\n" + "5" + "\n"
	 	expect(acumulo_linea).to eq vectorEsperado
 	 end

 	  it 'test13RecuperoLecturaArchivoPretty' do
	 	acumulo_linea = ""
		File.open('salidapretty.txt', 'r') do |f1|
  			while linea = f1.gets
	    		acumulo_linea += linea 
  			end
		end
		vectorEsperado = "Factores primos 360: 2 2 2 3 3 5 \n"
	 	expect(acumulo_linea).to eq vectorEsperado
 	 end

 	 it 'test14NoRecuperoLecturaDeArchivoNoPresente' do
	 	acumulo_linea = ""
	 	begin
		File.open('ArchivoInventadoNoPresenteEnDisco.txt', 'r') do |f1|
  			while linea = f1.gets
	    		acumulo_linea += linea 
  			end
		end
		#expect(acumulo_linea).to eq raise_error
		rescue Exception => e
    		puts "Error al intentar leer archivo: "
    		puts "#{e}"
  		end
 	 end
end