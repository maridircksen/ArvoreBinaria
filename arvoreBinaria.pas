{
Acadêmicas: Julia Salvador e Mariana Dircksen 

Atividade que tem como objetivo criar um algoritmo para manipular elementos em uma Árvore Binária. Onde o algoritmo deve ter os seguintes métodos: inserir , 
remover, escrever folhas, contar folhas, contar os elementos, percorrer pré, in, pós ordem, verificar altura da árvore e identifica se a árvore é completa}

Program ArvoreBinaria ;
type 
	PonteiroNodaArvBin = ^NodaArvBin;
	NodaArvBin = record
	Conteudo:Integer;
	ArvEsq, ArvDir, Pai: PonteiroNodaArvBin;
End;
const ESQUERDA = 1;
const DIREITA = 2;
var Raiz: PonteiroNodaArvBin;


{Procedimento usado para percorrer a árvore e exibir os valores dos nós na ordem pré,ou seja, começando pelo 
nó raiz e continuando pelas subárvores da esquerda para a direita.

nil - usado para representar a ausência de um nó ou ponteiro válido na árvore 
}

Procedure PreOrdem (Raiz: PonteiroNodaArvBin);
	begin
		if (Raiz <> nil) then //verifica se o nó Raiz não é nulo antes de realizar operação.
		begin
			write(Raiz^.conteudo, '-');
			PreOrdem(Raiz^.Arvesq);
			PreOrdem(Raiz^.Arvdir);
		end;
	end;

{Procedimento usado para percorrer a árvore e exibir os valores dos nós na ordem "in-order", o que resulta em uma 
listagem ordenada dos valores da árvore.}
 
Procedure EmOrdem (Raiz: PonteiroNodaArvBin);
    begin
        if (raiz <> nil) then 
        begin
            EmOrdem(Raiz^.Arvesq);
            write(raiz^.conteudo, '-');
            EmOrdem(Raiz^.Arvdir);
        end;
    end;

{Procedimento responsável por percorrer a árvore binária e exibir os valores dos nós na ordem "pós-ordem", 
o que significa que os valores da árvore são listados a partir das folhas em direção à raiz.}

Procedure PosOrdem (Raiz: PonteiroNodaArvBin);
    begin
        if (raiz <> nil) then 
        begin
            PosOrdem(Raiz^.Arvesq);
            PosOrdem(Raiz^.Arvdir);
            write(raiz^.conteudo, '-');
        end;
    end;
	
{Procedimento tem como objetivo dar inicio a árvore, partindo de uma Raiz Nula. Desta forma, criando uma árvore vazia
pronta para receber inserções de nós. Isto é, quando chamado, define a raiz da árvore como nula, indicando que a 
árvore está vazia e não contém nenhum nó.}

Procedure InicializaArvBin (var Raiz:PonteiroNodaArvBin);
	begin
		Raiz:= nil;
	end;
	
{Procedimento é responsável por exibir os valores dos nós folhas da árvore.Isto é, aqueles que não têm filhos.}

Procedure MostraNosFolhas (Raiz:PonteiroNodaArvBin);
	begin 
		if (Raiz <> nil) then
		begin
			if (Raiz^.ArvEsq = nil) and (Raiz^.ArvDir = nil) then 
				write(raiz^.conteudo, '-');
				MostraNosFolhas(Raiz^.Arvesq);
				MostraNosFolhas(Raiz^.Arvdir);
		end;
	end;

{Procedimento responsável por liberar a memória alocada para todos os nós da árvore binária.}

Procedure ApagaArvBin (Raiz:PonteiroNodaArvBin);
	begin
		if (Raiz <> nil) then
		begin
			ApagaArvBin(Raiz^.ArvEsq);
	    ApagaArvBin(Raiz^.ArvDir);
	    Dispose(Raiz); // Libera a memória associada ao nó Raiz 
		end;
	end;

{Procedimento é responsável por contar o número de nós da árvore}

Procedure ContaNos (Raiz:PonteiroNodaArvBin; var Cont:integer);
	begin
		if(Raiz <> nil) then
		begin
			inc(Cont);
			ContaNos(Raiz^.ArvEsq,Cont);
			ContaNos(Raiz^.ArvDir,Cont);//Conta o número de nós na árvore. Ou seja, cada vez que um nó é encontrado e contabilizado a variável Cont é adicionado 1.
		end;
	end;

{Procedimento responsável por calcular a soma dos valores de todos os nós da árvore}

Procedure SomaNos (Raiz:PonteiroNodaArvBin; var Soma:Integer);
	begin
		if (Raiz <> nil) then
			begin
				Soma:= Soma + Raiz^.conteudo;
				SomaNos(Raiz^.ArvEsq, Soma);
				SomaNos(Raiz^.ArvDir, Soma);
			end;
	end;

{Função usada para realizar busca dentro da árvore. }

Function PesquisaArvBin (Raiz:PonteiroNodaArvBin; x:Integer):PonteiroNodaArvBin;
var ponteiro:PonteiroNodaArvBin;
	begin
		ponteiro:=Raiz;
		while (ponteiro <> nil) and (ponteiro^.conteudo <> x) do
			if (x > ponteiro^.conteudo) then
				ponteiro:=ponteiro^.ArvDir
			else
				ponteiro:=ponteiro^.ArvEsq;
				PesquisaArvBin:=ponteiro;
	end;


{Função que irá localizar e retornar o nó que contém o menor valor na árvore, seguindo sempre para a subárvore 
esquerda até que não haja mais nós menores a serem explorados.}

Function MenorValor (Raiz:PonteiroNodaArvBin):PonteiroNodaArvBin;
	begin
		if (Raiz^.ArvEsq <> nil) then
			MenorValor:=MenorValor(Raiz^.ArvEsq)
		else
			MenorValor:=Raiz;
	end;

{Função utilizada para localizar e retornar o nó que contém o maior valor na árvore binária, seguindo sempre para a subárvore 
direita até que não haja mais nós maiores a serem explorados.}

Function MaiorValor (Raiz:PonteiroNodaArvBin):PonteiroNodaArvBin;
	begin
		if (Raiz^.ArvDir <> nil) then
			MaiorValor:=MaiorValor(Raiz^.ArvDir)
		else
			MaiorValor:=Raiz;
	end;
	
{Função usada para determinar em qual nível (profundidade) da árvore determinado valor a qual se encontra.}

Function Nivel (arv: PonteiroNodaArvBin; valor,n:integer; var achou:boolean):integer;
	begin
		if not (achou) then
			if (arv <> nil) then
				if (arv^.conteudo = valor) then
					begin
						achou:= true;
						Nivel:= n;
					end
			else
				begin
					Nivel:=Nivel(arv^.Arvesq, valor, n +1, achou);
					if not (achou) then
						Nivel := Nivel(arv^.Arvdir, valor, n+1, achou);
				end
			else 
				nivel:= -1; //-1 se o valor não estiver na árvore.
	end;

{Função utilizada para o cálculo da altura da árvore}

Function Maior (a,b:integer):integer;
	begin
		if (a > b) then
			Maior:= a
		else
			Maior:= b;
	end;

{Função que calcula a Altura da árvore}
Function Altura (Raiz:PonteiroNodaArvBin):integer;
	begin
		if (Raiz = nil) then
			Altura :=-1
		else 
			Altura := 1 + Maior(altura(Raiz^.ArvEsq), altura(Raiz^.ArvDir));
	end;

{Procedimento para exibir a arvore}

Procedure MostraArvore (Raiz:PonteiroNodaArvBin; linha, coluna, colunaAnterior:integer);
	begin
		if (Raiz <> nil) then
		begin
			MostraArvore(Raiz^.ArvEsq, linha+1, coluna - abs(colunaAnterior-coluna) div 2, coluna);  //Abs - usada para calcular a diferença entre coluna e colunaAnterior e garantir que o resultado seja sempre positivo.
			gotoxy(coluna,linha);
			write(Raiz^.Conteudo);
			MostraArvore(Raiz^.ArvDir, linha+1, coluna + abs(colunaAnterior-coluna) div 2, coluna);
		end;
	end;

{Função para determinar o caminho mais longo da árvore binária}

Function MaiorCaminho (Raiz:PonteiroNodaArvBin):String;
	begin
		if (raiz <> nil) then
			MaiorCaminho:= ''
			else 
				if (altura(raiz) = 0) then
					MaiorCaminho:=''
				else 
					if (altura(raiz^.ArvEsq) > altura(raiz^.ArvDir)) then 
          	MaiorCaminho:='Esquerda' + MaiorCaminho(raiz^.ArvEsq)
          else 
        		MaiorCaminho:='Direita' + MaiorCaminho(raiz^.ArvDir);
	end;


{Procedimento para processar novos nós a árvore}

Procedure processaInclusao (var No:PonteiroNodaArvBin; noValor:integer; noLado:integer);
var novoNo:PonteiroNodaArvBin;
	begin
		new(novoNo);
		novoNo^.conteudo:=noValor;
		novoNo^.ArvEsq:=nil;
		novoNo^.ArvDir:=nil;
		novoNo^.Pai:= No;
		if (noLado = ESQUERDA) then
			No^.ArvEsq:=novoNo
		else
			No^.ArvDir:=novoNo;
	end;
	
{Procedimento utilizado para adicionar o primeiro nó na árvore quando árvore está vazia}

Procedure processaPrimeiraInclusao (var No:PonteiroNodaArvBin; noValor:integer);
var novoNo:PonteiroNodaArvBin;
	begin
		new(novoNo);
		novoNo^.conteudo:=noValor;
		novoNo^.ArvEsq:=nil;
		novoNo^.ArvDir:=nil;
		novoNo^.Pai:=nil;
		No:=novoNo;
	end;

{Procedimento utilizado para adicionar um novo nó a uma árvore binária}

Procedure Inserir (var No:PonteiroNodaArvBin; noValor:integer);
	begin
		if (No = nil) then
			processaPrimeiraInclusao(No, noValor)
		else
			if (No^.conteudo > noValor) then
				if (No^.ArvEsq = nil) then 
					processaInclusao(No, noValor, ESQUERDA)
				else
					Inserir(No^.ArvEsq, noValor)
				else
					if (No^.ArvDir = nil) then
						processaInclusao(No, noValor, DIREITA)
					else
						Inserir(No^.ArvDir, noValor);
		
	end;
	
{Função utilizada juntamente com o procedimento anterior, onde permite ao usuário adicione novos elementos à árvore.}

Function insereNovoValor():integer;
var iNumero: integer;
	begin
		writeln('Digite um número.');
		readln(iNumero);
		insereNovoValor:=iNumero;	
	end;

{Função para verificar se a árvore é uma uma árvore binária completa}

Function isComplete(Raiz:PonteiroNodaArvBin):boolean;
var retorno, possuiRamo:boolean;
	begin
		if (Raiz = nil) then
			isComplete:=true
		else
			begin
				possuiRamo:=false;
				retorno:=false;
				if ((Raiz^.ArvEsq = nil) and (Raiz^.ArvDir = nil)) then
					begin
						retorno:=true
					end
				else
					if ((Raiz^.ArvEsq <> nil) and (Raiz^.ArvDir <> nil)) then
						begin
							if (isComplete(Raiz^.ArvEsq) = false) then
								possuiRamo:=true;
							if (isComplete(Raiz^.ArvDir) = false) then
								possuiRamo:=true;
							if not (possuiRamo) then
								retorno:=true;
						end;
						isComplete:=retorno;
			end;
	end;

{Função responsável por encontrar o valor mínimo em uma subárvore a partir de um nó específico. Ela inicia 
com o nó especificado, compara os valores entre os nós da subárvore e retorna o valor mínimo encontrado.}

Function MenorSubArv(var No:PonteiroNodaArvBin):integer;
var iMenor,iRetorno:integer;
	begin
		iRetorno:=No^.conteudo;
		iMenor:=No^.conteudo;
		
		if (No^.ArvDir <> nil) then
			iRetorno := MenorSubArv (No^.ArvDir); 
		
		if (iMenor > iRetorno) then
			iMenor:= iRetorno;
			
		if (No^.ArvEsq <> nil) then
			iRetorno := MenorSubArv(No^.ArvEsq);
		
		if (iMenor > iRetorno) then
			iMenor:= iRetorno;
			
		MenorSubArv:=iMenor;
			
	end;

{Procedimento usado para remover um nó com um valor específico da árvore}

procedure excluir(var No:PonteiroNodaArvBin; iNumero:integer);
var auxiliar:PonteiroNodaArvBin;
var iMenor:integer;
	begin
    if (iNumero > No^.conteudo) then
		    begin
		        excluir(No^.ArvDir, iNumero);
		    end
		else if (iNumero < No^.conteudo) then 
		    begin
		        excluir(No^.ArvEsq, iNumero);
		    end
		else if (iNumero = No^.conteudo) then
	    begin
		    if (No^.ArvDir <> nil) and (No^.ArvEsq <> nil) then
		          begin
		              iMenor := MenorSubArv(No^.ArvDir);
		              No^.conteudo := iMenor;
		              excluir(No^.ArvDir, iMenor);
		          end
	        else if (No^.ArvDir <> nil) then
	            begin
	                No^.ArvDir^.Pai:= No^.Pai;
	                if (No^.Pai^.conteudo > No^.conteudo) then
	                    No^.Pai^.ArvEsq:= No^.ArvDir
	                else
	                    No^.Pai^.ArvDir:= No^.ArvDir;
	                Dispose(No^.ArvDir);
	            end
	        else if (No^.ArvEsq <> nil) then
	            begin
	                No^.ArvEsq^.Pai:= No^.Pai;
	                if (No^.Pai^.conteudo > No^.conteudo) then
	                    No^.Pai^.ArvEsq:= No^.ArvEsq
	                else
	                    No^.Pai^.ArvDir:= No^.ArvEsq;
	                Dispose(No^.ArvEsq);
	            end
	        else 
	            begin
	                if (No^.Pai^.conteudo > No^.conteudo) then
	                    No^.Pai^.ArvEsq:= nil
	                else
	                    No^.Pai^.ArvDir:= nil;
	                Dispose(No);
	            end;  
      end;
	end;

{Procedimento que monta o Menu da Tela}
Procedure MenuTela();
var i: integer;
var No:PonteiroNodaArvBin;
var iQuantidade:integer;
	begin
		InicializaArvBin(Raiz);
		i:=1;
		while(i <> 0) do
			begin
				clrscr;
				writeln('1. Inserir novo elemento(Nó)');
				writeln('2. Mostrar Número de Folhas');
				writeln('3. Contar número de Nós');
				writeln('4. In Order');
				writeln('5. Pré Order');
				writeln('6. Pós Order');
				writeln('7. Altura da Árvore');
				writeln('8. Árvore Completa');
				writeln('9. Exibir Árvore');
				writeln('10. Excluir um elemento');
				writeln('0. Sair');
				readln(i);
				if (i = 1) then
					Inserir(Raiz, insereNovoValor())
				else if (i = 2) then
					MostraNosFolhas(Raiz)
				else if (i = 3) then
					begin
						iQuantidade:=0;
						ContaNos(Raiz, iQuantidade);
						Writeln(iQuantidade, 'números');
					end
				else if (i = 4) then
					EmOrdem(Raiz)
				else if (i = 5) then
					PreOrdem(Raiz)
				else if (i = 6) then
					PosOrdem(Raiz)
				else if (i = 7) then
					writeln(Altura(Raiz))
				else if (i = 8) then
					writeln(isComplete(Raiz))
				else if (i = 9) then
					MostraArvore(Raiz, 0,0,0)
				else if (i = 10) then
					excluir(Raiz, insereNovoValor());
				readkey;
			end;
	end;

Begin
  menuTela();
End.