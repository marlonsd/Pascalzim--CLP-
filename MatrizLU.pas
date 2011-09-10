// -------------------------------------------------------------
// Trabalho Conceitos de Linguagens de Programação
// Integrantes: Andre Peil, Daniel Retzlaff, Marlon Dias
// -------------------------------------------------------------

Program MatrizLU;

 Var mComp, mLow, mUp : array [ 1..4 , 1..4 ] of integer;
     i,j : integer;

 Begin

  // Leitura da matriz completa
  For i := 1 to 3 do
    For j := 1 to 3 do
     Begin
       writeln('adsadasda[',i, ',',j, ']:');
       readln(mComp[i, j]);
     End;

	
  // Calcula e insere valores nas matrizes auxiliares
  For i:= 1 to 3  do
    For j:= 1 to 3 do
     Begin
  // Se i e j forem diferentes entao
       if (i <> j) then 
		Begin 
  // se i for maior que j entao preenche a matriz low     
          if (i > j) then
             mLow[i, j] := mComp[i, j]
  // senao preenche com 1 (parte de cima)
           else
             mLow[i, j] := 1;
  // se i for menor que j entao preenche a matriz up          
          if (i < j) then
             mUp[i, j] := mComp[i, j]
  // senao preenche com 1 (parte de baixo)
          else
             mUp[i, j] := 1;
  // senao, se i e j forem igual recebe 0
        end
        else
        Begin
        mLow[i, j] := 0;
        mUp[i, j] := 0;
	   end;
	end;
  // Impressao das matrizes
  writeln('Matriz Comp: ');
  For i:= 1 to 3 do
     writeln(mComp[i,1]:4, mComp[i,2]:4, mComp[i,3]:4);
  
  writeln('Matriz Low: ');
  
  For i:= 1 to 3 do
     writeln(mLow[i,1]:4, mLow[i,2]:4, mLow[i,3]:4);
  writeln('Matriz Up: ');
  
  For i:= 1 to 3 do
     writeln(mUp[i,1]:4, mUp[i,2]:4, mUp[i,3]:4);
  

  
  


 End.
 
 
 
 
 
