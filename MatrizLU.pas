// -------------------------------------------------------------
// Trabalho Conceito e Linguagens de Programacao
// Integrantes: Andre Peil, Daniel Retzlaff, Marlon Dias
// -------------------------------------------------------------

Program MatrizLU;
Type matriz = Record
	a: array[1..100 , 1..100] of real;
	upper: array [1..100 , 1..100] of real;
	lower: array [1..100 , 1..100] of real;
End;


 Var mat: matriz;
     i,j,flag, n : integer;



 Procedure decompLU ();
	Var temp: real;
		k: integer;
	
	Begin 				
		For i:= 1 to n do
			Begin
				For j:= 1 to n do
					Begin
					if (i <= j) then
						Begin
						temp := 0;
						For k := 1 to i do
							Begin
							temp := temp + (mat.lower[i, k]*mat.upper[k, j]);
							End;
						mat.upper[i, j] := mat.a[i, j] - temp;	
						End
						Else
							Begin
								temp := 0;
								For k := 1 to j do
									Begin
									temp := temp + (mat.lower[i, k] * mat.upper[k, j]);
									End;
								If (mat.upper[j, j] = 0) then
									Begin
										writeln('Erro... Divisao por Zero');
										flag:=1;
										exit;
									End
									Else
										Begin
											mat.lower[i, j] := (mat.a[i, j] - temp) / mat.upper [j, j];
										End;
							End;
						
					
					End;
			End;

		
	End;	
		
 Begin
	
	Repeat
		write('Tamanho da Matriz:');
		readln(n);
		if (n > 100) or (n <= 0) then
			writeln('erro... valores validos entre 1 e 100.');
			
	Until ((n <= 100) and (n > 0)); 
		
	
  writeln('Matriz A: ');
  // Leitura da matriz A e inicializacao de matris LU

  For i := 1 to n do
    Begin
		For j := 1 to n do

		Begin
			write('A [',i, ',',j, ']: ');
			readln(mat.a[i, j]);
			mat.lower[i, j] := 0;
			mat.upper[i, j] := 0;
		End;
    mat.lower[i, i] := 1;
	End;
	
	// Decomposicao LU
	flag:=0;
	decompLU();

  // Impressao das matrizes
  if (flag = 1) then
	exit;

writeln('');
	
  writeln('Matriz Comp: ');
  
  For i:= 1 to n do
	Begin
		writeln('');
		For j:= 1 to n do 
			write(mat.a[i,j]:2:1,'  ');
	End;
  writeln('');
  writeln('');
  
  writeln('Matriz Low: ');

  For i:= 1 to n do
	Begin
		writeln('');
		For j:= 1 to n do
			write(mat.lower[i,j]:2:1,'  ');
	End;
  
  writeln('');
  writeln('');
  writeln('Matriz Up: ');

   For i:= 1 to n do
	Begin
		writeln('');
		For j:= 1 to n do
			write(mat.upper[i,j]:2:1,'  ');
	End;

 End.





