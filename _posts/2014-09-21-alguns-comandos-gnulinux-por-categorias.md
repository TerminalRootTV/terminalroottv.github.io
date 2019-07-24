---
layout: post
title: "Alguns comandos GNU/Linux por Categorias"
date: '2014-09-21T09:58:00.001-07:00'
image: '/assets/img/bash/comandos-linux.jpg'
description: "Uma lista completa de comandos GNU/Linux"
main-class: 'bash'
tags:
- Linux
- GNU
- Terminal
- Comandos
---

![Alguns comandos GNU/Linux por Categorias](/assets/img/bash/comandos-linux.jpg "Alguns comandos GNU/Linux por Categorias" ){:height="450px" width="800px"}


## Comandos de Controle e Acesso

+ __exit__ ➜ Terminar a sessão, ou seja, a __shell__ (mais ajuda digitando __man sh__ ou __man csh__)
+ __logout__ ➜ Deslogar, ou seja, terminar a sessão actual, mas apenas na __C shell__ e na __bash shell__
+ __passwd__ ➜ Mudar a __password__ do nosso utilizador
+ __rlogin__ ➜ Logar de forma segura noutro sistema __Unix/Linux__
+ __ssh__ ➜ Sessão segura, vem de __secure shell__, e permite-nos logar num servidor através do protocolo __ssh__
+ __slogin__ ➜ Versão segura do __rlogin__
+ __yppasswd__ ➜ Mudar a __password__ do nosso utilizador nas páginas amarelas (__yellow pages__)


## Comandos de Comunicações

+ __mail__ ➜ Enviar e receber emails
+ __mesg__ ➜ Permitir ou negar mensagens de terminal e pedidos de conversação (__talk requests__)
+ __pine__ ➜ Outra forma de enviar e receber emails, uma ferramenta rápida e prática
+ __talk__ ➜ Falar com outros utilizadores que estejam logados no momento
+ __write__ ➜ Escrever para outros utilizadores que estejam logados no momento


## Comandos de Ajuda e Documentação

+ __apropos__ ➜ Localiza comandos por pesquisa de palavra-chave
+ __find__ ➜ Localizar ficheiros, como por exemplo: __find . -name *.txt -print__, para pesquisa de ficheiros de texto por entre os ficheiros da directoria actual
+ __info__ ➜ Lança o explorador de informações
+ __man__ ➜ Manual muito completo, pesquisa informação acerca de todos os comandos que necessitemos de saber, como por exemplo __man find__
+ __whatis__ ➜ Descreve o que um determinado comando é
+ __whereis__ ➜ Localizar a página de ajuda (__man page__), código fonte, ou ficheiros binários, de um determinado programa


## Comandos de Edição de Texto

+ __emacs__ ➜ Editor de texto __screen-oriented__
+ __pico__ ➜ Editor de texto __screen-oriented__, também chamado de __nano__
+ __sed__ ➜ Editor de texto __stream-oriented__
+ __vi__ ➜ Editor de texto __full-screen__
+ __vim__ ➜ Editor de texto __full-screen__ melhorado (__vi improved__)


## Comandos de Gestão de Ficheiros e Directorias

+ __cd__ ➜ Mudar de directoria actual, como por exemplo __cd directoria__, __cd ..__, __cd /__
+ __chmod__ ➜ Mudar a protecção de um ficheiro ou directoria, como por exemplo __chmod 777__, parecido com o __attrib__ do __MS-DOS__
+ __chown__ ➜ Mudar o dono ou grupo de um ficheiro ou directoria, vem de __change owner__
+ __chgrp__ ➜ Mudar o grupo de um ficheiro ou directoria
+ __cmp__ ➜ Compara dois ficheiros
+ __comm__ ➜ Selecciona ou rejeita linhas comuns a dois ficheiros seleccionados
+ __cp__ ➜ Copia ficheiros, como o __copy__ do __MS-DOS__
+ __crypt__ ➜ Encripta ou Desencripta ficheiros (apenas __CCWF__)
+ __diff__ ➜ Compara o conteúdo de dois ficheiros __ASCII__
+ __file__ ➜ Determina o tipo de ficheiro
+ __grep__ ➜ Procura um ficheiro por um padrão, sendo um filtro muito útil e usado, por exemplo um __cat a.txt | grep ola__ irá mostrar-nos apenas as linhas do ficheiro a.txt que contenham a palavra “ola”
+ __gzip__ ➜ Comprime ou expande ficheiros
+ __ln__ ➜ Cria um __link__ a um ficheiro
+ __ls__ ➜ Lista o conteúdo de uma directoria, semelhante ao comando __dir__ no __MS-DOS__
+ __lsof__ ➜ Lista os ficheiros abertos, vem de __list open files__
+ __mkdir__ ➜ Cria uma directoria, vem de __make directory”__
+ __mv__ ➜ Move ou renomeia ficheiros ou directorias
+ __pwd__ ➜ Mostra-nos o caminho por inteiro da directoria em que nos encontramos em dado momento, ou seja a __pathname__
+ __quota__ ➜ Mostra-nos o uso do disco e os limites
+ __rm__ ➜ Apaga ficheiros, vem de __remove__, e é semelhante ao comando __del__ no __MS-DOS__, é preciso ter cuidado com o comando __rm *__ pois apaga tudo sem confirmação por defeito
+ __rmdir__ ➜ Apaga directorias, vem de __remove directory__
+ __stat__ ➜ Mostra o estado de um ficheiro, útil para saber por exemplo a hora e data do último acesso ao mesmo
+ __sync__ ➜ Faz um __flush__ aos __buffers__ do sistema de ficheiros, sincroniza os dados no disco com a memória, ou seja escreve todos os dados presentes nos __buffers__ da memória para o disco
+ __sort__ ➜ Ordena, une ou 
compara texto, podendo ser usado para extrair informações dos ficheiros 
de texto ou mesmo para ordenar dados de outros comandos como por exemplo
 listar ficheiros ordenados pelo nome
+ __tar__ ➜ Cria ou extrai arquivos, muito usado como programa de backup ou compressão de ficheiros
+ __tee__ ➜ Copia o __input__ para um __standard output__ e outros ficheiros
+ __tr__ ➜ Traduz caracteres
+ __umask__ ➜ Muda as protecções de ficheiros por defeito
+ __uncompress__ ➜ Restaura um ficheiro comprimido
+ __uniq__ ➜ Reporta ou apaga linhas repetidas num ficheiro
+ __wc__ ➜ Conta linhas, palavras e mesmo caracteres num ficheiro


## Exibição ou Impressão de Ficheiros

+ __cat__ ➜ Mostra o conteúdo de um ficheiro, como o comando __type__ do __MD-DOS__, e é muito usado também para concatenar ficheiros, como por exemplo fazendo __cat a.txt b.txt &gt; c.txt” para juntar o ficheiro a.txt e b.txt num único de nome c.txt__
+ __fold__ ➜ Encurta, ou seja, faz um __fold__ das linhas longas para caberem no dispositivo de __output__
+ __head__ ➜ Mostra as primeiras linhas de um ficheiro, como por exemplo com __head -10 a.txt__, ou usado como filtro para mostrar apenas os primeiros __x__ resultados de outro comando
+ __lpq__ ➜ Examina a __spooling queue__ da impressora
+ __lpr__ ➜ Imprime um ficheiro
+ __lprm__ ➜ Remove __jobs__ da __spooling queue__ da impressora
+ __more__ ➜ Mostra o conteúdo de um ficheiro, mas apenas um ecrã de cada vez, ou mesmo __output__ de outros comandos, como por exemplo __ls | more__
+ __less__ ➜ Funciona como o __more__, mas com menos __features__, menos características e potenciais usos
+ __page__ ➜ Funciona de forma parecida com o comando __more__, mas exibe os ecrãs de forma invertida ao comando __more__
+ __pr__ ➜ Pagina um ficheiro para posterior impressão
+ __tail__ ➜ Funciona de forma inversa ao comando __head__, mostra-nos as últimas linhas de um ficheiro ou mesmo do __output__ de outro comando, quando usado como filtro
+ __zcat__ ➜ Mostra-nos um ficheiro comprimido
+ __xv__ ➜ Serve para exibir, imprimir ou mesmo manipular imagens
+ __gv__ ➜ Exibe ficheiros __ps__ e __pdf__
+ __xpdf</b></td><td>Exibe ficheiros __pdf__, usa o __gv__


## Comandos de Transferência de Ficheiros

+ __ftp__ ➜ Vem de __file transfer protocol__, e permite-nos, usando o protocolo de transferência de ficheiros __ftp__, transferir ficheiros entre vários __hosts__ de uma rede, como aceder a um servidor de __ftp__ para enviar ou puxar ficheiros
+ __rsync__ ➜ Sincroniza de forma rápida e flexível dados entre dois computadores
+ __scp__ ➜ Versão segura do __rcp__


## Comandos de Notícias ou Rede

+ __netstat__ ➜ Mostra o estado da rede
+ __rsh__ ➜ Corre umam __shell__ em outros sistemas __UNIX__
+ __ssh__ ➜ Versão segura do __rsh__
+ __nmap</b></td><td>Poderoso __port-scan__, para visualizarmos portas abertas num dado __host__
+ __ifconfig</b></td><td>Visualizar os __ips__ da nossa máquina, entre outras funções relacionadas com __ips__
+ __ping</b></td><td>Pingar um determinado __host__, ou seja, enviar pacotes __icmp__ para um determinado __host__ e medir tempos de resposta, entre outras coisas


## Comandos de Controlo de Processos

+ __kill__ ➜ Mata um processo, como por exemplo __kill -kill 100__ ou __kill -9 100__ ou __kill -9 %1__
+ __bg__ ➜ Coloca um processo suspenso em __background__
+ __fg__ ➜ Ao contrário do comando __bg__, o __fg__ traz de volta um processo ao __foreground__
+ __jobs__ ➜ Permite-nos visualizar __jobs__ em execução, quando corremos uma aplicação em __background__, poderemos ver esse __job__ com este comando, e termina-lo com um comando __kill -9 %1__, se for o __job__ número 1, por exemplo
+ __top__ ➜ Lista os processos que mais __cpu__ usam, útil para verificar que processos estão a provocar um uso excessivo de memória, e quanta percentagem de __cpu__ cada um usa em dado momento
+ __^y__ ➜ Suspende o processo no próximo pedido de __input__
+ __^z__ ➜ Suspende o processo actual


## Comandos de Informação de Estado

+ __clock__ ➜ Define a hora do processador
+ __date__ ➜ Exibe a data e hora
+ __df__ ➜ Exibe um resumo do espaço livre em disco
+ __du__ ➜ Exibe um resumo do uso do espaço em disco
+ __env__ ➜ Exibe as variáveis de ambiente
+ __finger__ ➜ Pesquisa informações de utilizadores
+ __history__ ➜ Lista os 
últimos comandos usados, muito útil para lembrar também de que comandos 
foram usados para fazer determinada acção no passado ou o que foi feito 
em dada altura
+ __last__ ➜ Indica o último __login__ de utilizadores
+ __lpq__ ➜ Examina a __spool queue__
+ __manpath__ ➜ Mostra a __path__ de procura para as páginas do comando __man__
+ __printenv__ ➜ Imprime as variáveis de ambiente
+ __ps__ ➜ Lista a lista de processos em execução, útil para saber o __pid__ de um processo para o mandar abaixo com o comando __kill__, entre outras coisas
+ __pwd__ ➜ Mostra-nos o caminho por inteiro da directoria em que nos encontramos em dado momento, ou seja a __pathname__
+ __set__ ➜ Define variáveis da sessão, ou seja, da __shell__, na __C shell__, na __bash__ ou na __ksh__
+ __spend__ ➜ Lista os custos __ACITS UNIX__ até à data
+ __time__ ➜ Mede o tempo de execução de programas
+ __uptime__ ➜ Diz-nos há quanto tempo o sistema está funcional, quando foi ligado e o seu __uptime__
+ __w__ ➜ Mostra-nos quem está no sistema ou que comando cada __job__ está a executar
+ __who__ ➜ Mostra-nos quem está logado no sistema
+ __whois__ ➜ Serviço de 
directório de domínios da Internet, permite-nos saber informações sobre 
determinados domínios na Internet, quando um domínio foi registado, 
quando expira, etc
+ __whoami__ ➜ Diz-nos quem é o dono da __shell__


## Comandos de Processamento de Texto

+ __abiword__ ➜ Processador de Texto __Open Source__
+ __addbib__ ➜ Cria ou modifica bases de dados bibliográficas
+ __col__ ➜ Reverte o filtro a __line feeds__
+ __diction__ ➜ Identifica sentenças com palavras
+ __diffmk__ ➜ Marca diferenças entre ficheiros
+ __dvips__ ➜ Converte ficheiros __TeX DVI__ em ficheiros __PostScript__
+ __explain__ ➜ Explica frases encontradas pelo programa __diction__
+ __grap__ ➜ Preprocessador __pic__ para desenhar gráficos, usado em tarefas elementares de análises de dados
+ __hyphen__ ➜ Encontra palavras com hífenes
+ __ispell__ ➜ Verifica a ortografia de forma interactiva
+ __latex__ ➜ Formata texto em __LaTeX__, que é baseado no __TeX__
+ __pdfelatex__ ➜ Para documentos __LaTeX__ em formato __pdf__
+ __latex2html__ ➜ Converter __LaTeX__ para __html__
+ __lookbib__ ➜ Encontra referências bibliográficas
+ __macref__ ➜ Cria uma referência cruzada listando ficheiros de macros __nroff/troff__
+ __ndx__ ➜ Cria uma página de indexação para um documento
+ __neqn__ ➜ Formata matemáticas com __nroff__
+ __nroff__ ➜ Formata texto para exibição simples
+ __pic__ ➜ Produz simples imagens para __troff input__
+ __psdit__ ➜ Filtra um __output__ __troff__ para a __Apple LaserWriter__
+ __ptx__ ➜ Cria uma indexação permutada mas não em __CCWF__
+ __refer__ ➜ Insere referências de bases de dados bibliográficas
+ __roffbib__ ➜ Faz o __run off__ de uma base de dados bibliográfica
+ __sortbib__ ➜ Ordena uma base de dados bibliográfica
+ __spell__ ➜ Encontra erros de ortografia
+ __style__ ➜ Analisa as características superficiais de um documento
+ __tbl__ ➜ Formata tabelas para __nroff/troff__
+ __tex__ ➜ Formata texto
+ __tpic__ ➜ Converte ficheiros __pic source__ em comandos __TeX__
+ __wget__ ➜ Permite-nos fazer o
 download completo de páginas web, com todos os ficheiros, de forma 
fácil e não interactiva, sem exigir por isso presença do utilizador, 
respeitando também o ficheiro __robots.txt__


## Web

+ __html2ps__ ➜ Conversor de __html__ para __ps__
+ __latex2html__ ➜ Conversor de __LaTeX__ para __html__
+ __lynx__ ➜ Navegador __web__ baseado em modo de texto, ou seja, é um __web browser__ que nos permite abrir todo o tipo de páginas visualizando apenas os textos e __links__, não vendo assim as imagens, e sendo por isso bastante rápido, mas requere prática para ser manuseado
+ __netscape__ ➜ Navegador __web__ da __Netscape__
+ __sitecopy__ ➜ Aplicação que nos permite manter facil e remotamente __web sites__
+ __weblint__ ➜ Verificador de sintaxes e de estilos __html__



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

