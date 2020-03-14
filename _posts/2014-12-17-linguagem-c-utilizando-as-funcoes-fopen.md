---
layout: post
title: "Linguagem C: Utilizando as funções: fopen() , fputs() e fclose()"
date: '2014-12-17T12:30:00.002-08:00'
image: '/assets/img/c/c.jpg'
description: "O sistema de entrada e saída do ANSI C é composto por uma série de funções, cujos protótipos estão reunidos em stdio.h."
tags:
- linguagem c
---
![Linguagem C: Utilizando as funções: fopen() , fputs() e fclose()](/assets/img/c/c.jpg "Linguagem C: Utilizando as funções: fopen() , fputs() e fclose()")

O sistema de entrada e saída do __ANSI C__ é composto por uma série de funções, cujos protótipos estão reunidos em __stdio.h__. Todas estas funções trabalham com o __conceito de "ponteiro de arquivo"__. Este não é um tipo propriamente dito, mas uma definição usando o comando __typedef__. Esta definição também está no arquivo __stdio.h__. Podemos declarar um ponteiro de arquivo da seguinte maneira

> FILE *p;

__p__ será então um ponteiro para um arquivo. É usando este tipo de ponteiro que vamos poder manipular arquivos no __C__.

## fopen()

Esta é a função de abertura de arquivos. Seu protótipo é

> FILE *fopen (char *nome_do_arquivo,char *modo);

O __nome_do_arquivo__ determina qual arquivo deverá ser aberto. Este nome deve ser __válido no sistema operacional__ que estiver sendo utilizado. O modo de abertura diz à função __fopen()__ que tipo de uso você vai fazer do arquivo. A tabela abaixo mostra os valores de modo válidos:

<table border="1">
<tbody>
<tr>
<td><b><span style="color: blue;">Modo</span></b></td>  <td><b><span style="color: blue;">Significado</span></b></td>
</tr>
<tr>
<td><b>"r" </b></td>  <td><b>Abre um arquivo texto para leitura. O arquivo deve existir antes de ser aberto.</b></td>
</tr>
<tr>
<td><b>"w"</b></td>  <td><b>Abrir um arquivo texto para gravação. Se o arquivo não existir, ele será criado. Se já existir, o conteúdo anterior será destruído.
        Abrir um arquivo texto para gravação. Os dados serão adicionados no fim do arquivo ("append"), se ele já existir, ou um novo arquivo será criado, no caso de arquivo não</b></td></tr>
<tr>
<td><b>"a"</b></td>  <td><b>existente anteriormente.</b></td></tr>
<tr>
<td><b>"rb"</b></td>  <td><b>Abre um arquivo binário para leitura. Igual ao modo "r" anterior, só que o arquivo é binário.</b></td></tr>
<tr><td><b>"ab"</b></td>  <td><b>Acrescenta dados binários no fim do arquivo, como no modo "a" anterior, só que o arquivo é binário.</b></td></tr>
<tr><td><b>"r+"</b></td>  <td><b>Abre um arquivo texto para leitura e gravação. O arquivo deve existir e pode ser modificado.</b></td></tr>
<tr><td><b>"w+"</b></td>  <td><b>Cria um arquivo texto para leitura e gravação. Se o arquivo existir, o conteúdo anterior será destruído. Se não existir, será criado.
        Abre um arquivo texto para gravação e leitura. Os dados serão adicionados no fim do arquivo se ele já existir, ou um novo arquivo será criado, no caso de arquivo não</b></td></tr>
<tr><td><b>"a+"</b></td>  <td><b>existente anteriormente.</b></td></tr>
<tr><td><b>"r+b"</b></td>  <td><b>Abre um arquivo binário para leitura e escrita. O mesmo que "r+" acima, só que o arquivo é binário.</b></td></tr>
<tr><td><b>"w+b"</b></td>  <td><b>Cria um arquivo binário para leitura e escrita. O mesmo que "w+" acima, só que o arquivo é binário.</b></td></tr>
<tr><td><b>"a+b"</b></td>  <td><b>Acrescenta dados ou cria uma arquivo binário para leitura e escrita. O mesmo que "a+" acima, só que o arquivo é binário</b></td></tr>
</tbody></table>

## fputs()
> Escreve uma string num arquivo.
 
## fclose()
> Fecha o arquivo. 

{% highlight c %}
#include <stdio.h>
int main(){
		/* Declaramos as variáveis que serão utilizadas */
		char arquivo[100];
		char texto[100];
		
		/* Declaramos um ponteiro(link para o endereço da memória) para o arquivo de nome: 'pFile'*/
		FILE * pFile;
		
		/* Escrevemos na tela a pergunta para o arquivo e/ou caminho do arquivo */
		printf("Informe o arquivo(COM CAMINHO) que você deseja escrever: \n");
		
		/* Gravamos o que o usuário digitar (caminho/arquivo)*/
		scanf("%s", &arquivo);
		
		/* Esta é a função de abertura de arquivos. Com modo 'w'(Abrir um arquivo texto para gravação. Se o arquivo não existir, ele será criado. 
			Se já existir, o conteúdo anterior será destruído.) */
		pFile = fopen(arquivo , "w");
		
		/* Se o arquivo for não-vazio */
		if(pFile!=NULL){
		
		/* Escrevemos na tela a pergunta para o que deseja ler no arquivo (ESPAÇOS EM BRANCO FINALIZARÁ o texto) */
		printf("Digite o que você deseja pôr no arquivo(SEM ESPAÇOS): \n");
		
		/* Gravamos o que o usuário digitar e guardamos na variável 'texto' */
		scanf("%s", &texto);
		
		/*Escreve uma string(da variável 'texto') num arquivo. */
		fputs(texto, pFile);
		
		/* Quando acabamos de usar um arquivo que abrimos, devemos fechá-lo. Para tanto usa-se a função fclose() */
		fclose(pFile);		
	} 
	return 0; 
}
{% endhighlight %}

### Modo Resumido 
{% highlight bash %}
#include <stdio.h>
// ################## -- MODO Resumido -- ###################
int main(){
  // Declaramos um ponteiro(link para o endereço da memória) para o arquivo de nome: 'pFile' 
  FILE * pFile;
  
  // Esta é a função de abertura de arquivos. Com modo 'w'(Abrir um arquivo texto para gravação. Se o arquivo não existir, ele será criado. 
  // Se já existir, o conteúdo anterior será destruído.) 
  pFile = fopen( "pasta/arquivo.txt" , "w" );
  
  //Se o arquivo for não-vazio 
  if(pFile!=NULL){
  
  // Escreve uma string(da variável 'texto') num arquivo. 
  fputs( "fopen example" ,pFile); 
  fclose(pFile);
 } 
 return 0; 
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

