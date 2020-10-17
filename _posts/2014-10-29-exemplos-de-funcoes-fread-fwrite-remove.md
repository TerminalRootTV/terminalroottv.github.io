---
layout: post
title: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
date: '2014-10-29T18:01:00.000-07:00'
image: '/assets/img/c/clang.jpg'
description: 'Exemplos de funções: fread(), fwrite(), remove() e outras em C'
tags:
- linguagemc
- clang
- linguagemc
- programacao
- code
---

![Exemplos de funções: fread(), fwrite(), remove() e outras em C](/assets/img/c/clang.jpg)

---

# 🇨 `fread()`

Podemos escrever e ler blocos de dados. Para tanto, temos as funções `fread()` e `fwrite()`. O protótipo de `fread()` é:

{% highlight bash %}
unsigned fread (void *buffer, int numero_de_bytes, int count, FILE *fp);
{% endhighlight %}

O *buffer* é a região de memória na qual serão armazenados os dados lidos. O número de bytes é o tamanho da unidade a ser lida. count indica quantas unidades devem ser lidas. Isto significa que o número total de bytes lidos é:
{% highlight bash %}
numero_de_bytes*count
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

A função retorna o número de unidades efetivamente lidas. Este número pode ser menor que `count` quando o fim do arquivo for encontrado ou ocorrer algum erro.
Quando o arquivo for aberto para dados binários, `fread` pode ler qualquer tipo de dados.

Exemplo `main.c`:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>

int main( int argc, char** argv ){

    if( argc > 1 ){
        // Declaramos um ponteiro(link para o endereço da memória) para o arquivo de nome: 'pf'
        FILE *pf;
        char conteudo[100];

        //Abre o arquivo novamente para leitura
        pf = fopen(argv[1], "rb");

        // Le em conteudo o valor da variável armazenada anteriormente pf
        fread(&conteudo, sizeof(char), 100,pf);

        // Imprime o conteúdo, se existir, do arquivo informado
        printf("\nO CONTEÚDO DO ARQUIVO É:\n %s \n", conteudo);

        fclose(pf);
    }else{
        printf("Informe o arquivo. Ex.: ./program arquivo.txt\n");
    }

    return(0);
}
{% endhighlight %}

Compile:
{% highlight c %}
gcc main.c -o program
{% endhighlight %}

Use:
{% highlight c %}
echo "Bla bla bla" > arquivo.txt
# Exemplo:
./program arquivo.txt
{% endhighlight %}

---

# 🇨 `fwrite()`

A função `fwrite()` funciona como a sua companheira `fread()`, porém escrevendo no arquivo. Seu protótipo é:

{% highlight c %}
unsigned fwrite(void *buffer,int numero_de_bytes,int count,FILE *fp);
{% endhighlight %}

A função retorna o número de itens escritos. Este valor será igual a `count` a menos que ocorra algum erro.

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Exemplo:
{% highlight c %}
#include<stdio.h>

int main(){
   FILE *fp;
   char str[] = "Terminal Root na veia!\n";
   fp = fopen( "arquivo.txt" , "w" );
   fwrite(str , 1 , sizeof(str) , fp );
   fclose(fp);
   return(0);
}
{% endhighlight %}

Usando:
{% highlight bash %}
gcc main.c -o program
./program
cat arquivo.txt
#Terminal Root na veia!
{% endhighlight %}

---

# 🇨 `remove()`
Protótipo:
{% highlight c %}
int remove (char *nome_do_arquivo);
{% endhighlight %}

Apaga um arquivo especificado.

Exemplo:
{% highlight c %}
#include <stdio.h>

int main( int argc, char** argv ){
    if( argc > 1 ){
        if(remove(argv[1]) == 0){
            printf("Arquivo removido com sucesso!\n");
        }else{
            printf("Não removido, talvez não exista.\n");
        }
    }else{
        printf("Use: ./rm [nome_do_arquivo]\n");
    }

    return(0);
}
{% endhighlight %}

Usando:
{% highlight bash %}
gcc main.c -o rm
touch arquivo_exemplo.txt
./rm arquivo_exemplo.txt
#Arquivo removido com sucesso!
{% endhighlight %}

<!-- MINI ANÚNCIO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- Games Root -->
<ins class="adsbygoogle"
style="display:inline-block;width:730px;height:95px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 🇨 `fprintf()` e `fscanf()`

Os fluxos padrão em arquivos permitem ao programador ler e escrever em arquivos da maneira padrão com a qual o já líamos e escrevíamos na tela.

## `fprintf()`

A função `fprintf()` funciona como a função `printf()`. A diferença é que a saída de `fprintf()` é um arquivo e não a tela do computador.

Protótipo:
{% highlight c %}
int fprintf (FILE *fp,char *str,...);
{% endhighlight %}

Como já poderíamos esperar, a única diferença do protótipo de `fprintf()` para o de `printf()` é a especificação do arquivo destino através do ponteiro de arquivo.

##`fscanf()`

A função `fscanf()` funciona como a função `scanf()`. A diferença é que `fscanf()` lê de um arquivo e não do teclado do computador.

Exemplo de fprintf e fscanf:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>

int main(){

    FILE *p;
    char str[80],c;
    // Le um nome para o arquivo a ser aberto
    printf("Entre com um nome para o arquivo: ");

    // não se usa a função gets() e sim scanf dessa forma
    scanf("%s", str);

    // Caso ocorra algum erro na abertura do arquivo
    // o programa aborta automaticamente
    if (!(p = fopen(str,"w"))){
        printf("Erro! Impossivel abrir o arquivo!\n");
        exit(1);
    }

    // Se nao houve erro, imprime no arquivo, fecha
    // O usu dessa linha: \e[1m%s\e[m , é pra ficar em negrito
    fprintf(p,"O arquivo informado foi: \e[1m%s\e[m\n", str);
    fclose(p);

    // abre novamente para a leitura
    p = fopen(str,"r");
    while (!feof(p)){
        fscanf(p,"%c",&c);
        printf("%c",c);
    }
    fclose(p);

    return(0);
}
{% endhighlight %}

<!-- RETANGULO LARGO 2 -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:block; text-align:center;"
data-ad-layout="in-article"
data-ad-format="fluid"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="8549252987"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Usando:
{% highlight bash %}
gcc main.c -o program
./program
Entre com um nome para o arquivo: teste.txt
O arquivo informado foi: teste.txt
{% endhighlight %}

---

# 🇨 `fputs()`

As bibliotecas de funções do **C** escreve uma string para o fluxo especificado até, mas não incluindo o caractere nulo.

Protótipo de `fputs()`:
{% highlight c %}
int fputs (const char * str, FILE * stream)
{% endhighlight %}

Parâmetros
+ `str` - Este é um array contendo a seqüência de terminação nula de caracteres a serem escritos;
+ `stream` - Este é o ponteiro para um objeto de arquivo que identifica o fluxo onde a string será escrita.

Exemplo:

{% highlight c %}
#include <stdio.h>
#include <unistd.h>

int main(){
    char fname[] = "arquivo.txt";

    // Verifica se o arquivo existe
    if( access( fname, F_OK ) != -1 ) {
        FILE *fp;

        fp = fopen(fname, "w+");

        // Escreve(Sobscreve) isso dentro do arquivo
        fputs("Esta é a programação c.\n", fp);
        fputs("Esta é uma linguagem de programação do sistema.\n", fp);

        fclose(fp);
    } else {
        printf("Arquivo não existe.\n");
    }

    return(0);
}
{% endhighlight %}

Usando:
{% highlight bash %}
gcc main.c -o program
./program
Arquivo não existe.
touch arquivo.txt
./program
cat arquivo.txt
Esta é a programação c.
Esta é uma linguagem de programação do sistema.
{% endhighlight %}

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

# 🇨 `fgets()`

Para se ler uma string num arquivo podemos usar `fgets()` cujo protótipo é:

{% highlight c %}
char *fgets (char *str, int tamanho,FILE *fp);
{% endhighlight %}

A função recebe 3 argumentos:
> a string a ser lida, o limite máximo de caracteres a serem lidos e o ponteiro para FILE, que está associado ao arquivo de onde a string será lida.

A função lê a string até que um caractere de nova linha seja lido ou tamanho `-1 char` tenham sido lidos. Se o caractere de nova linha ('\n') for lido, ele fará parte da string, o que não acontecia com `gets`. A string resultante sempre terminará com '\0' (por isto somente tamanho `-1 caracteres`, no máximo, serão lidos).

A função `fgets` é semelhante à função `gets()`, porém, além dela poder fazer a leitura a partir de um arquivo de dados e incluir o caracter de nova linha na string, ela ainda especifica o tamanho máximo da string de entrada.

Como vimos, a função `gets` não tinha este controle, o que poderia acarretar erros de "estouro de buffer". Portanto, levando em conta que o ponteiro `fp` pode ser substituído por `stdin`, como vimos acima, uma alternativa ao uso de `gets` é usar a seguinte construção:

{% highlight c %}
fgets (str, tamanho, stdin);
{% endhighlight %}

onde `str` é a string que se está lendo e tamanho deve ser igual ao tamanho alocado para a string subtraído de 1, por causa do '\0'.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>

int main(){
    FILE *p;
    char str[30], frase[] = "Este é um arquivo chamado: ", resposta[80];
    int i;
    // Le um nome para o arquivo a ser aberto
    printf("Informe um nome de arquivo: ");

    // Usa fgets como se fosse gets
    fgets(str,29,stdin);

    // Elimina o \n da string lida
    for(i=0; str[i]; i++) if(str[i]=='\n') str[i]=0;

    // Caso ocorra algum erro na abertura do arquivo
    // O programa aborta automaticamente
    if (!(p = fopen(str,"w"))){
             printf("Erro! Impossivel abrir o arquivo!\n");
             exit(1);
    }

    // Se nao houve erro, imprime no arquivo, e o fecha
    fputs(frase, p);
    fputs(str,p);
    fclose(p);

    // abre novamente e lê
    p = fopen(str,"r");
    fgets(resposta, 79, p);
    printf("%s\n", resposta);

    // Fecha o arquivo
    fclose(p);
    // Apaga o arquivo
    remove(str);
    return(0);
}
{% endhighlight %}

Usando:
{% highlight bash %}
gcc main.c -o program
./program
Informe um nome de arquivo: teste.doc
Este é um arquivo chamado: teste.doc
{% endhighlight %}

---

# 🇨 `ferror()` e `perror()`

Protótipo de ferror:
{% highlight c %}
int ferror (FILE *fp);
{% endhighlight %}

A função retorna zero, se nenhum erro ocorrer e um número diferente de zero se algum erro ocorreu durante o acesso ao arquivo.

`ferror()` se torna muito útil quando queremos verificar se cada acesso a um arquivo teve sucesso, de modo que consigamos garantir a integridade dos nossos dados.

<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

Na maioria dos casos, se um arquivo pode ser aberto, ele pode ser lido ou gravado. Porém, existem situações em que isto não ocorre. Por exemplo, pode acabar o espaço em disco enquanto gravamos, ou o disco pode estar com problemas e não conseguimos ler, etc.

Uma função que pode ser usada em conjunto com `ferror()` é a função `perror()`(print error), cujo argumento é uma string que normalmente indica em que parte do programa o problema ocorreu.


Exemplo:
{% highlight c %}
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    FILE *pf;
    char string[100];
    if((pf = fopen("arquivo.txt","w")) ==NULL){
        printf("\nNao consigo abrir o arquivo ! ");
        exit(1);
    } do {
        printf("\nDigite uma nova string. Para terminar, digite <enter>: ");
         // não se usa a função gets() e sim scanf dessa forma
        scanf("%s", string);
        fputs(string, pf);
        putc('\n', pf);
        if(ferror(pf)){
            perror("Erro na gravacao");
            fclose(pf);
            exit(1);
        }
    } while (strlen(string) > 0);
    fclose(pf);
}
{% endhighlight %}

> Após compilar e testar, use **Ctrl + c** para sair do programa.

---

# 🇨 `fseek()`

Para se fazer procuras e acessos randômicos em arquivos usa-se a função `fseek()`. Ela move a posição corrente de leitura ou escrita no arquivo de um valor especificado, a partir de um ponto especificado. Seu protótipo é:

{% highlight c %}
int fseek (FILE *fp,long numbytes,int origem);
{% endhighlight %}

O parâmetro origem determina a partir de onde os `numbytes` de movimentação serão contados. Os valores possíveis são definidos por macros em `stdio.h` e são:

{% highlight c %}
Nome    Valor       Significado

SEEK_SET       0        Início do arquivo
SEEK_CUR       1        Ponto corrente no arquivo
SEEK_END       2        Fim do arquivo
{% endhighlight %}

Tendo-se definido a partir de onde irá se contar, `numbytes` determina quantos bytes de deslocamento serão dados na posição atual.

---

# 🇨 `rewind()`

A função `rewind()` de protótipo:
{% highlight c %}
void rewind (FILE *fp);
{% endhighlight %}

Retorna a posição corrente do arquivo para o início.

<!-- RETANGULO LARGO -->
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


