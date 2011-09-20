// -------------------------------------------------------------
// Trabalho Conceito e Linguagens de Programacao
// Integrantes: Andre Peil, Daniel Retzlaff, Marlon Dias
// -------------------------------------------------------------

Program MatrizLU;

 Var mComp, mL, mU : array [ 1..4 , 1..4 ] of real;
     temp : real;
     i,j,k : integer;

 Begin

  writeln('Matriz A: ');

  // Leitura da matriz A e inicializacao de matris LU
  For i := 1 to 3 do
    Begin
		For j := 1 to 3 do

		Begin
			write('A [',i, ',',j, ']: ');
			readln(mComp[i, j]);
			mL[i, j] := 0;
			mU[i, j] := 0;
		End;
    mL[i, i] := 1;
	End;
	
	// Decomposicao LU

	For i:= 1 to 3 do
		Begin
			For j:= 1 to 3 do
				Begin
				if (i <= j) then
					Begin
					temp := 0;
					For k := 1 to i do
						Begin
						temp := temp + (mL[i, k]*mU[k, j]);
						End;
					mU[i, j] := mComp[i, j] - temp;	
					End
					Else
						Begin
							temp := 0;
							For k := 1 to j do
								Begin
								temp := temp + (mL[i, k] * mU[k, j]);
								End;
							If (mU[j, j] = 0) then
								Begin
									writeln('Erro... Divisao por Zero');
									exit;
								End
								Else
									Begin
										mL[i, j] := (mComp[i, j] - temp) / mU [j, j];
									End;
						End;
					
				
				End;
		End;


  // Impressao das matrizes
  writeln('Matriz Comp: ');
  For i:= 1 to 3 do
     writeln(mComp[i,1]:2:1,'  ', mComp[i,2]:2:1,'  ', mComp[i,3]:2:1);

  writeln('Matriz Low: ');

  For i:= 1 to 3 do
     writeln(mL[i,1]:2:1,'  ',mL[i,2]:2:1,'  ',mL[i,3]:2:1);
  writeln('Matriz Up: ');

  For i:= 1 to 3 do
     writeln(mU[i,1]:2:1,'  ',mU[i,2]:2:1,'  ',mU[i,3]:2:1);


 End.





