---
layout: post
title: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
date: '2014-10-29T18:01:00.000-07:00'
description: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
main-class: 'C'
color: '#3465a4'
tags:
- Linguagem C
modified_time: '2014-10-29T18:01:36.537-07:00'
thumbnail: http://2.bp.blogspot.com/-ALBejyjhrGI/UaKms_oM2hI/AAAAAAAABok/uhtHGNuBjM8/s72-c/function+c.jpg
twitter_text: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
introduction: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
---

## fread()

Podemos escrever e ler blocos de dados. Para tanto, temos as funções fread() e fwrite(). O protótipo de fread() é:

<sub>unsigned fread (void *buffer, int numero_de_bytes, int count, FILE *fp);</sub>
  
O buffer é a região de memória na qual serão armazenados os dados lidos. O número de bytes é o tamanho da unidade a ser lida. count indica quantas unidades devem ser lidas. Isto significa que o número total de bytes lidos é:

>numero_de_bytes*count
      
A função retorna o número de unidades efetivamente lidas. Este número pode ser menor que count quando o fim do arquivo for encontrado ou ocorrer algum erro.
Quando o arquivo for aberto para dados binários, fread pode ler qualquer tipo de dados.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>

int main()
{
// Declaramos um ponteiro(link para o endereço da memória) para o arquivo de nome: 'pf'
FILE *pf;
char conteudo[100];

pf = fopen("arquivos/texto.txt", "rb"); /* Abre o arquivo novamente para leitura */

fread(&conteudo, sizeof(char), 100,pf); /* Le em conteudo o valor da variável armazenada anteriormente pf */

printf("\nO conteúdo do arquivo é':\n %s \n", conteudo);

fclose(pf);

return(0);
}
{% endhighlight %}

## fwrite()

A função fwrite() funciona como a sua companheira fread(), porém escrevendo no arquivo. Seu protótipo é:

<sub>unsigned fwrite(void *buffer,int numero_de_bytes,int count,FILE *fp);</sub>
         
A função retorna o número de itens escritos. Este valor será igual a count a menos que ocorra algum erro.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
int main()
{
FILE *pf;
int NUM = 88;
int pilido;
if((pf = fopen("arquivos/arquivo.bin", "wb")) == NULL) /* Abre arquivo binário para escrita */
{
printf("Erro na abertura do arquivo");
exit(1);
}
if(fwrite(&NUM, sizeof(int), 1,pf) != 1)     /* Escreve a variável NUM | o operador sizeof, que retorna o tamanho em bytes da variável ou do tipo de dados. */
printf("Erro na escrita do arquivo");
fclose(pf);                                    /* Fecha o arquivo */
if((pf = fopen("arquivos/arquivo.bin", "rb")) == NULL) /* Abre o arquivo novamente para leitura */
{
printf("Erro na abertura do arquivo");
exit(1);
}
if(fread(&pilido, sizeof(int), 1,pf) != 1) /* Le em pilido o valor da variável armazenada anteriormente */
printf("Erro na leitura do arquivo");
printf("\nO valor de NUM, lido do arquivo e': %d \n\n", pilido);
fclose(pf);
return(0);
}
{% endhighlight %}

## remove()
  

Protótipo:

>int remove (char *nome_do_arquivo);
   
Apaga um arquivo especificado.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{      
    /*  0(zero) é verdadeiro(true), e 1(um) é falso(false), em C usa-se números! */
    if(remove("arquivo_a_ser_removido.txt") == 0){
    printf("Arquivo removido com sucesso!\n");
  }else{
      printf("Não removido, talvez não exista.\n");
    }
return(0);
}
{% endhighlight %}


# fprintf() e fscanf()

Os fluxos padrão em arquivos permitem ao programador ler e escrever em arquivos da maneira padrão com a qual o já líamos e escrevíamos na tela.

## fprintf():

A função *fprintf()* funciona como a *função printf()*. A diferença é que a saída de *fprintf()* é um arquivo e não a tela do computador. 

Protótipo:
>int fprintf (FILE *fp,char *str,...);

Como já poderíamos esperar, a única diferença do protótipo de *fprintf()* para o de *printf()* é a especificação do arquivo destino através do ponteiro de arquivo.

## fscanf():

A função [fscanf()] funciona como a função [scanf()]. A diferença é que [fscanf()] lê de um arquivo e não do teclado do computador.


Exemplo de fprintf e fscanf:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
int main()
{
  FILE *p;
  char str[80],c;
  /* Le um nome para o arquivo a ser aberto: */
  printf("\n\n Entre com um nome para o arquivo:\n");
  scanf("%s", &str); /* não se usa a função gets() e sim scanf dessa forma */
  if (!(p = fopen(str,"w"))) /* Caso ocorra algum erro na abertura do arquivo..*/
  {                            /* o programa aborta automaticamente */
           printf("Erro! Impossivel abrir o arquivo!\n");
           exit(1);
  }
  /* Se nao houve erro, imprime no arquivo, fecha ...*/
  fprintf(p,"Este e um arquivo chamado(com ou sem caminho e formato):\n%s\n", str);
  fclose(p);
  /* abre novamente para a leitura   */
  p = fopen(str,"r");
  while (!feof(p))
  {
           fscanf(p,"%c",&c);
           printf("%c",c);
  }
  fclose(p);
  return(0);
}
{% endhighlight %}

## fputs()

Os C biblioteca de funções int fputs (const char * str, FILE * stream) escreve uma string para o fluxo especificado até, mas não incluindo o caractere nulo.

*Declaração*

Segue-se a declaração para a função fputs ():

> int fputs (const char * str, FILE * stream)

Parâmetros

>    str - Este é um array contendo a seqüência de terminação nula de caracteres a serem escritos.

>    fluxo - Este é o ponteiro para um objeto de arquivo que identifica o fluxo onde a corda está a ser escrito.

Valor de retorno

Escreve uma string num arquivo.
Esta função retorna um valor não-negativo mais, em caso de erro devolve EOF.


Exemplo:

{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
FILE *fp;

fp = fopen("arquivos/fputs.txt", "w+");

fputs("Esta é a programação c.", fp);
fputs("Esta é uma linguagem de programação do sistema.", fp);

fclose(fp);

return(0);
}
{% endhighlight %}

Vamos compilar e executar o programa acima, isso vai criar um arquivo.txt arquivo com o seguinte conteúdo: 
Esta é a programação c.Esta é uma linguagem de programação do sistema.

## fgets()

Para se ler uma string num arquivo podemos usar fgets() cujo protótipo é:

>char *fgets (char *str, int tamanho,FILE *fp);
                    
A função recebe 3 argumentos: a string a ser lida, o limite máximo de caracteres a serem lidos e o ponteiro para FILE, que está associado ao arquivo de onde a string será lida.A função lê a string até que um caracter de nova linha seja lido ou tamanho-1 caracteres tenham sido lidos. Se o caracter de nova linha ('\n') for lido, ele fará parte da string, o que não acontecia com gets. A string resultante sempre terminará com '\0' (por isto somente tamanho-1 caracteres, no máximo, serão lidos). A função fgets é semelhante à função gets(), porém, além dela poder fazer a leitura a partir de um arquivo de dados e incluir o caracter de nova linha na string, ela ainda especifica o tamanho máximo da string de entrada. Como vimos, a função gets não tinha este controle, o que poderia acarretar erros de "estouro de buffer". Portanto, levando em conta que o ponteiro fp pode ser substituído por stdin, como vimos acima, uma alternativa ao uso de gets é usar a seguinte construção:

>fgets (str, tamanho, stdin);
                        
onde str e' a string que se está lendo e tamanho deve ser igual ao tamanho alocado para a string subtraído de 1, por causa do '\0'.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
    FILE *p;
    char str[30], frase[] = "Este e um arquivo chamado: ", resposta[80];
    int i;
    /* Le um nome para o arquivo a ser aberto: */
    printf("\n\n Entre com um nome para o arquivo:\n");
    fgets(str,29,stdin);                                    /* Usa fgets como se fosse gets */
    for(i=0; str[i]; i++) if(str[i]=='\n') str[i]=0;        /* Elimina o \n da string lida */
    if (!(p = fopen(str,"w")))                              /* Caso ocorra algum erro na abertura do arquivo..*/
    {                                                       /* o programa aborta automaticamente */
             printf("Erro! Impossivel abrir o arquivo!\n");
             exit(1);
    }
    /* Se nao houve erro, imprime no arquivo, e o fecha ...*/
    fputs(frase, p);
    fputs(str,p);
    fclose(p);
    /* abre novamente e le */
    p = fopen(str,"r");
    fgets(resposta, 79, p);
    printf("\n\n%s\n", resposta);
    fclose(p);                       /* Fecha o arquivo */
    remove(str);                     /* Apaga o arquivo */
    return(0);
}
{% endhighlight %}


## ferror() e perror()

Protótipo de ferror:


>int ferror (FILE *fp);
A função retorna zero, se nenhum erro ocorreu e um número diferente de zero se algum erro ocorreu durante o acesso ao arquivo.
ferror() se torna muito útil quando queremos verificar se cada acesso a um arquivo teve sucesso, de modo que consigamos garantir a integridade dos nossos dados. Na maioria dos casos, se um arquivo pode ser aberto, ele pode ser lido ou gravado. Porém, existem situações em que isto não ocorre. Por exemplo, pode acabar o espaço em disco enquanto gravamos, ou o disco pode estar com problemas e não conseguimos ler, etc. Uma função que pode ser usada em conjunto com ferror() é a função __perror() (print error)__, cujo argumento é uma string que normalmente indica em que parte do programa o problema ocorreu.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main()
{
FILE *pf;
char string[100];
if((pf = fopen("arquivo.txt","w")) ==NULL)
{
  printf("\nNao consigo abrir o arquivo ! ");
  exit(1);
}
do
{
  printf("\nDigite uma nova string. Para terminar, digite <enter>: ");
  scanf("%s", &string); /* não se usa a função gets() e sim scanf dessa forma */
  fputs(string, pf);
  putc('\n', pf);
  if(ferror(pf))
  {
      perror("Erro na gravacao");
      fclose(pf);
      exit(1);
  }
} while (strlen(string) > 0);
fclose(pf);
}
{% endhighlight %}


## fseek()

Para se fazer procuras e acessos randômicos em arquivos usa-se a função fseek(). Esta move a posição corrente de leitura ou escrita no arquivo de um valor especificado, a partir de um ponto especificado. Seu protótipo é:

>int fseek (FILE *fp,long numbytes,int origem);
                 
O parâmetro origem determina a partir de onde os numbytes de movimentação serão contados. Os valores possíveis são definidos por macros em stdio.h e são:


>Nome    Valor       Significado
>
>SEEK_SET       0        Início do arquivo
>SEEK_CUR       1        Ponto corrente no arquivo
>SEEK_END       2        Fim do arquivo
                                                       
Tendo-se definido a partir de onde irá se contar, numbytes determina quantos bytes de deslocamento serão dados na posição atual.

## rewind()

A função rewind() de protótipo:

>void rewind (FILE *fp);
  
retorna a posição corrente do arquivo para o início.




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

