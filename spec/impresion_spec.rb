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


	# pasar este de java a rb!  @AfterClass
	# public static void test7leertest6() {
	# 	String recibo = "";
	# 	String reciboQuiet = "";
	# 	// The name of the file to open.
	# 	String fileName = "salida.txt";
	# 	String fileNameQuiet = "salidaquiet.txt";
	# 	// This will reference one line at a time
	# 	String line = null;
	# 	String line2 = null;
	# 	try {
	# 		// FileReader reads text files in the default encoding.
	# 		FileReader fileReader = new FileReader(fileName);
	# 		FileReader fileReaderQuiet = new FileReader(fileNameQuiet);
	# 		// Always wrap FileReader in BufferedReader.
	# 		BufferedReader bufferedReader = new BufferedReader(fileReader);
	# 		BufferedReader bufferedReaderQuiet = new BufferedReader(fileReaderQuiet);
	# 		while ((line = bufferedReader.readLine()) != null) {
	# 			recibo += line;
	# 		}
	# 		while ((line2 = bufferedReaderQuiet.readLine()) != null) {
	# 			reciboQuiet += line2 + "\n";
	# 		}
	# 		recibo += "\n";
	# 		// Always close files.
	# 		bufferedReader.close();
	# 		bufferedReaderQuiet.close();
	# 	} catch (FileNotFoundException ex) {
	# 		System.out.println("Unable to open file '" + fileName + "'");
	# 	} catch (IOException ex) {
	# 		System.out.println("Error reading file '" + fileName + "'");
	# 	}
	# 	System.out.println("test7leertest6recibo: " + recibo);
	# 	System.out.println("test7leertest6reciboQuiet: " + reciboQuiet);
	# 	String esperado = "Factores primos 360: 2 2 2 3 3 5 " + "\n";
	# 	String esperado2Quiet = "2" + "\n" + "2" + "\n" + "2" + "\n" + "3" + "\n" + "3" + "\n" + "5" + "\n";
	# 	Assert.assertEquals(esperado, recibo);
	# 	Assert.assertEquals(esperado2Quiet, reciboQuiet);
	# }

end