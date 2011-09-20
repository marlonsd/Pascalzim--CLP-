// -------------------------------------------------------------
// Trabalho Conceito e Linguagens de Programacao
// Integrantes: Andre Peil, Daniel Retzlaff, Marlon Dias
// -------------------------------------------------------------

Program MatrizLU;
Type matriz = Record
	a: array[1..3 , 1..3] of real;
	upper: array [1..3 , 1..3] of real;
	lower: array [1..3 , 1..3] of real;
End;


 Var mat: matriz;
     i,j : integer;



 Procedure decompLU (var mat: matriz);
	Var temp: real;
		k: integer;
	Begin 				
		For i:= 1 to 3 do
			Begin
				For j:= 1 to 3 do
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

  writeln('Matriz A: ');

  // Leitura da matriz A e inicializacao de matris LU
  For i := 1 to 3 do
    Begin
		For j := 1 to 3 do

		Begin
			write('A [',i, ',',j, ']: ');
			readln(mat.a[i, j]);
			mat.lower[i, j] := 0;
			mat.upper[i, j] := 0;
		End;
    mat.lower[i, i] := 1;
	End;
	
	// Decomposicao LU
	decompLU(mat);

  // Impressao das matrizes
  writeln('Matriz Comp: ');
  For i:= 1 to 3 do
     writeln(mat.a[i,1]:2:1,'  ', mat.a[i,2]:2:1,'  ', mat.a[i,3]:2:1);

  writeln('Matriz Low: ');

  For i:= 1 to 3 do
     writeln(mat.lower[i,1]:2:1,'  ',mat.lower[i,2]:2:1,'  ',mat.lower[i,3]:2:1);
  writeln('Matriz Up: ');

  For i:= 1 to 3 do
     writeln(mat.upper[i,1]:2:1,'  ',mat.upper[i,2]:2:1,'  ',mat.upper[i,3]:2:1);


 End.





