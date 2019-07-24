---
layout: post
title: "Código de Linguagem C para Aprendizado"
date: 2017-01-28 21:58:07
image: '/assets/img/c/c.jpg'
description: "O código serve como estudos/lembrete para iniciantes que desejam aprender Linguagem C."
main-class: 'C'
color: '#3465a4'
tags:
- linguagem-c
categories:
twitter_text: "Código de Linguagem C para Aprendizado"
introduction: "O código serve como estudos/lembrete para iniciantes que desejam aprender Linguagem C."
---

![Linguagem C para Aprendizado](/assets/img/c/c.jpg)

O código serve como estudos/lembrete para iniciantes que desejam aprender Linguagem C. Nesse caso eu nomeei de __aprender-c.c__ . Para compilá-lo use o comando __gcc aprender-c.c -o aprender-c__ ou usando o __make aprender-c__ e terá a saída assim **cc     aprender-c.c   -o aprender-c** se não houver erro.

#### Segue o código abaixo
{% highlight c %}
#include <stdio.h>
#include <string.h>

int main(){

	char str1[]="isso",str2[]=" com aquilo";
	
	printf("\n");
	printf("[+] Surgiu na década de 70, criada por Dennis Ritchie.\n");
	printf("[+] C é uma linguagem ESTRUTURADA, ou seja, não há orientação a objetos.\n");
	printf("[+] C é Case Sensitive.\n");
	printf("[+] 1° define o cabeçalho/bibliotecas.\n");
	printf("[+] 2° define as variáveis globais, se houverem.\n");
	printf("[+] 3° define as funções extras, se houverem.\n");
	printf("[+] 3° define as funções extras, se houverem.\n");
	printf("[+] 4° define a função principal do programa.\n");
	printf("[+] Olá mundo em C, o básico:\n\n");
	printf("\t#include <stdio.h>\n\tint main(){\n\tprintf(\"Terminal Root\\n\");\n\treturn 0;\n\t}\n\n");
	printf("[+] No cabeçalho incluímos a biblioteca stdio.h entrada e saída I\\0 \n");
	printf("[+] A função main() é a função principal, e é do tipo inteira: int \n");
	printf("[+] Para imprimir usamos: printf(\"CONTEÚDO\");\n");
	printf("[+] Para escapar as aspas/barras, usamos uma barra \\ \n");
	printf("[+] O ponto e vírgula no final é necessário para sintaxe, o \\n , pula uma linha no prompt\n");
	printf("[+] return 0; Serve para informar ao compilador que ocorreu tudo certo com a função main(). \n");
	printf("[+] As funções ficam entre chaves {} \n");
	printf("[+] Salve o arquivo com o nome desejado, ex.: arquivo.c\n");
	printf("[+] Depois compile-o com o comando: gcc arquivo.c -o arquivo\n");
	printf("[+] E por fim, rode o aplicativo: ./arquivo\n");
	printf("[+] Comentários, podem ser de 2 formas: // barra barra ou /* barra asterisco, asterisco barra, para blocos de comentários */\n");
	printf("[+] Se houver um erro , o C informa a linha, experimente colocar uma barra sem escapar\n\taparecerá mais ou menos isso, referente a linha 25: \n\n");
	printf("\taprender-c.c:25:9: warning: unknown escape sequence: '040'\n\n");
	printf("[+] Tipos de Dados:\n\n\t• A linguagem C possuí 5 (cinco) tipos básicos de dados : char , int , float , void e double.\n\t• Para cada tipo de dado existem 			modificadores de tipo, estes são 4 (quatro) : signed , unsigned, long e short.\n\t• Lembre - se, para o float nenhum modificado pode ser aplicado ; 			assim como para o double podemos aplicar apenas o long.\n\n");
	printf("[+] Declarar Variável: tipo_da_variavel nome_da_variavel = valor_inicial_da_variavel;\n");
	printf("[+] Declarar várias Variáveis do mesmo tipo: tipo_da_variavel nome_var1 = valor1, nome_var2 = valor2;\n");
	
	int num1 = 10, num2 = 3;
	float result = num1 + num2;
	
	printf("Os  valores sao : % i, %i e %f",  num1, num2, result);
	printf("\n\n[+] Constantes de barra invertida\n\n\\b Retrocesso (back) \n\\f Alimentação de formulário (form feed) \n\\n Nova linha (new line) \n\\t 				Tabulação horizontal (tab) \n\\\" Aspas dupla \n\\\' Aspas simples \n\\0 Nulo (0 em decimal)  – Terminador \n\\\\ Barra invertida \n\\v Tabulação 				vertical \n\\a Sinal sonoro (beep) \n\\N Constante octal (N é o valor da constante) \n\\xN Constante hexadecimal (N é o valor da constante)\n\n");
	printf("[+] Criando uma simples função de soma em C:\n\n#include <stdio.h>\n\t\n\tint soma(int x,int y){\n\t return (x+y);\n\t}\n\t\n\tint main(){\n\t int saida;\n\t saida=soma(4,8);\n\t printf (\"O resultado da soma e: %%d \",saida);\n\t return(0);\n\t}\n\n");
	printf("[+] Perceba que escapamos o sinal de porcentagem com dois sinais, mas para formatar deve usar 1 só\n");
	printf("[+] Tabela de Formatos para o printf:\n\n");
	printf("Formato\t\t\tSaida\n");
	printf("c\t\t\tchar\n");
	printf("d\t\t\tsigned int\n");
	printf("i\t\t\tigual ao d\n");
	printf("e\t\t\tNotação Cientifica usando o caracter e\n");
	printf("E\t\t\tNotação Cientifica usando o caracter E\n");
	printf("f\t\t\tfloat\n");
	printf("g\t\t\tusa o menor numero possivel de f e e\n");
	printf("G\t\t\tusa o menor numero possivel de f e E\n");
	printf("o\t\t\tunsigned octal\n");
	printf("s\t\t\tstring\n");
	printf("u\t\t\tunsigned int\n");
	printf("x\t\t\tunsigned hexa\n");
	printf("X\t\t\tunsigned hexa com letras maiusculas\n");
	printf("p\t\t\tponteiro de endereço\n");
	printf("n\t\t\tNada impresso.\n");
	printf("%%\t\t\t%% seguido de outro %% irá printar %% na saida\n\n");
	printf("[+] Concatenando strings, ou seja, do tipo char:\n");
	printf("\tColocaremos uma biblioteca a mais no cabeçalho: #include <string.h>\n");
	printf("\tVamos declarar no início duas strings do tipo char como matrizes: char str1[]=\"isso\",str2[]=\" com aquilo\";\n");
	printf("\tE vamos usar a função: strcat(), e passar o %%s no printf \n");
	printf("\t\vEu vou juntar %s", strcat(str1,str2));
	printf("\n\n");
	printf("[+] Loop for:\n");
	
	int i;
 	char letra;
	printf("sequência de n°s de 1 a 10\n");
 	for(i=1;i<=10;i++)
 	printf("%d - ",i);
 	printf("\nsequência de letras de A a Z\n");
 	for(letra = 'A';letra<='Z';letra++)
 	printf("%c - ",letra);
	
	printf("\n\n");
	printf("[+] Loop while:\n");
	
	int z = 0;
 
 	while(i<=4){
	printf("%d\n",z);
		z++;
	}

	//Enquanto vc não digitar a letra 'p' e pressionar ENTER o loop não para.
	char Ch; 
	Ch='\0';
	while(Ch != 'p'){
		scanf("%c", &Ch);
	}
	
	printf("\n\n");
	printf("[+] IF, ELSE e ELSE IF:\n");
	
	int num; // definimos a variável num como inteira, a saída será %d
	
	printf("Digite um número: \n"); // imprimimos na tela a frase e pulamos uma linha com \n
	scanf("%d", &num); // Lêmos o número digitado e armazenamos na variável num
	if(num==0){ /* começamos a condição se o número for ZERO */
	 printf("O número é NULO\n"); // executamos o comando, nesse somente imprimimos uma mensagem na tela e pulamos um linha
	}else if(num<8){
	 printf("O número é Menor que 8\n"); // proxima condição
	}else if(num<11){
	 printf("O número é maior que 7\n"); // mais uma condição 
	}else{
	 printf("O número está fora das condições criadas\n"); // então finalizamos o bloco
	}
	
	printf("\n\n");
	printf("[+] Funções:\n");
	printf("A função soma está abaixo da main() e retornará os valores abaixo setados(9, 2) a soma deles:\n");
	//definimos a variável saida
	int saida;
	//setamos os valores que queremos
	saida=soma(9,2);
	//imprimimos na tela o resultado
	printf ("O resultado da soma e: %d\n",saida);
	
	printf("\n\n");
	printf("\n\n");
	printf("\n\n");
	printf("\n\n");
	return 0;
}

int soma(int x,int y)
{
 //efetuamos a operação
 return (x+y);
}
{% endhighlight %}


<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

<!-- Informat -->
<ins class="adsbygoogle"
 style="display:block"
 data-ad-client="ca-pub-2838251107855362"
 data-ad-slot="2327980059"
 data-ad-format="auto"
 data-full-width-responsive="true"></ins>

<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

