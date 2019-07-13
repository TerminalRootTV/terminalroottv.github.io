---
layout: post
title: "Curso Certificação Linux LPI-102: Criptografia de Dados"
date: '2013-04-07T06:21:00.000-07:00'
image: '/assets/img/lpi/criptografia-xyz.jpg'
description: "O gpg (GNU pgp, versão livre da ferramenta pgp) permite encriptar dados, adicionalmente poderá verificar se a origem dos dados é confiável, através da assinatura de arquivos."
main-class: 'linux'
tags:
- Linux
- LPI
---

![Criptografia de Dados](/assets/img/lpi/criptografia-xyz.jpg "Criptografia de Dados")


## Usando pgp (gpg)para criptografia de arquivos

> O __gpg__ (__GNU pgp__, versão livre da ferramenta __pgp__ ) permite encriptar dados, assim somente o destinatário terá acesso aos dados, adicionalmente poderá verificar se a origem dos dados é confiável (através da assinatura de arquivos). __O sistema PGP__ se baseia no conceito de chave pública e privada: Sua chave pública é distribuída para as pessoas que deseja trocar dados/mensagens e a chave privada fica em sua máquina (ela não pode ser distribuída). As chaves públicas e privadas são armazenadas nos arquivos __pubring.gpg e secring.gpg__ respectivamente, dentro do subdiretório __~/.gnupg__ . Os dados que recebe de outra pessoa são criptografados usando sua chave pública e somente você (de posse da chave privada) poderá desencriptar os dados. Quando assina um arquivo usando o __pgp__, ele faz isto usando sua chave privada, o destinatário de posse da chave pública poderá então confirmar que a origem dos dados é confiável. O gpg vem largamente sendo usado para transmissão segura de dados via internet. Muitos programas de e-mails como o mutt e sylpheed incluem o suporte a pgp embutido para envio de mensagens assinadas/encriptadas (__MIME__ não tem uma codificação segura e não garante que a mensagem vem de quem realmente diz ser). Um servidor de e-mail no __Linux__ configurado como as mesmas configurações/endereços do provedor da vítima pode enganar com sucesso um usuário passando-se por outro.

## Instalando o PGP

{% highlight bash %}
apt-get install gnupg
{% endhighlight %}

Após instalar o __gnupg__, execute o comando gpg para criar o diretório __~/.gnupg__ que armazenará as chaves pública e privada.

## Criando um par de chaves pública/privada
Para gerar um par de chaves pessoais use o comando gpg __--gen-key__. Ele executará os seguintes passos
* Chave criptográfica - Selecione __DS__A e __ELGamal__ a não ser que tenha necessidades específicas.
* Tamanho da chave __- 1024 bits__ traz uma boa combinação de __proteção/velocidade__.
* Validade da chave __- 0__ a chave não expira. Um número positivo tem o valor de dias, que pode ser seguido das letras __w (semanas), m (meses) ou y (anos)__. Por exemplo, __"7m", "2y", "60"__.

Após a validade, a chave será considerada inválida.

* __Nome de usuário__ - Nome para identificar a chave
* __E-mail__ - E-mail do dono da chave
* __comentário__ - Uma descrição sobre a chave do usuário.
* __Confirmação__ - Tecle "O" para confirmar os dados ou uma das outras letras para modificar os dados de sua chave.

Digite a __FraseSenha__ - Senha que irá identificá-lo(a) como proprietário da chave privada. É chamada de __FraseSenha__ pois pode conter espaços e não há limite de caracteres.Confirme e aguarde a geração da chave pública/privada.

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

## Encriptando dados

Use o comando __gpg -e__ arquivo faz a encriptação de dados

{% highlight bash %}
gpg -e arquivo.txt
{% endhighlight %}

Será pedida a identificação de usuário, digite o nome que usou para criar a chave. O arquivo criado será encriptado usando a chave pública do usuário (__~/.gnupg/pubring.gpg__) e terá a extensão __.gpg__ adicionada (__arquivo.txt.gpg__). Além de criptografado, este arquivo é compactado (recomendável para grande quantidade de textos). A opção -a é usada para criar um arquivo criptografado com saída __ASCII 7 bits__

{% highlight bash %}
gpg -e -a arquivo.txt
{% endhighlight %}

O arquivo gerado terá a extensão __.asc__ acrescentada (__arquivo.txt.asc__) e não será compactado. A opção __-a__ é muito usada para o envio de e-mails. Para criptografar o arquivo para ser enviado a outro usuário, você deverá ter a chave pública do usuário cadastrado no seu chaveiro e especificar a opção __-r__ seguida do __nome/e-mail/ID__ da chave pública

{% highlight bash %}
gpg -r kov -e arquivo.txt
{% endhighlight %}

> O exemplo acima utiliza a chave pública de __kov__ para encriptar o arquivo __arquivo.txt__ (somente ele poderá decriptar a mensagem usando sua chave privada). 

> OBS: É recomendável especificar o nome de arquivo sempre como último argumento.

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

## Decriptando dados com o gpg

Agora vamos fazer a operação reversa da acima, a opção __-d__ é usada para decriptar os dados usando a chave privada
 
{% highlight bash %}
gpg -d arquivo.txt.asc >arquivo.txt
gpg -d arquivo.txt.gpg >arquivo.txt
{% endhighlight %}

Descriptografa os arquivos __arquivo.txt.asc__ e __arquivo.txt.gpg__ recuperando seu conteúdo original. A sua "__FraseSenha__" será pedida para descriptografar os dados usando a chave privada (__~/.gnupg/secring.gpg__).

## Assinando arquivos

Assinar um arquivo é garantir que você é a pessoa que realmente enviou aquele arquivo. Use a opção __-s__ para assinar arquivos usando sua __chave privada__
 
{% highlight bash %}
gpg -s arquivo.txt
{% endhighlight %}

A "__FraseSenha__" será pedida para assinar os dados usando sua chave privada. Será gerado um arquivo a__rquivo.txt.gpg__ (assinado e compactado). Adicionalmente a opção __--clearsign__ poderá ser usada para fazer uma assinatura em um texto plano, este é um recurso muito usado por programas de e-mails com suporte ao __gpg__
 
{% highlight bash %}
gpg -s --clearsign arquivo.txt
{% endhighlight %}

Será criado um arquivo chamado __arquivo.txt.asc__ contendo o arquivo assinado e sem compactação.

## Checando assinaturas

A checagem de assinatura consiste em verificar que quem nos enviou o arquivo é realmente quem diz ser e se os dados foram de alguma forma alterados. Você deverá ter a chave pública do usuário no seu chaveiro para fazer esta checagem . Para verificar os dados assinados acima usamos a opção __--verify__
 
{% highlight bash %}
gpg --verify arquivo.txt.asc
{% endhighlight %}

* Se a saída for "__Assinatura Correta__", significa que a origem do arquivo é segura e que ele não foi de qualquer forma modificado.
 
{% highlight bash %}
gpg --verify arquivo.txt.gpg
{% endhighlight %}

* Se a saída for "__Assinatura INCORRETA__" significa que ou o usuário que enviou o arquivo não confere ou o arquivo enviado foi de alguma forma modificado.

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

## Extraindo sua chave pública do chaveiro

Sua chave pública deve ser distribuída a outros usuários para que possam enviar dados criptografados ou checar a autenticidade de seus arquivos. Para exportar sua chave pública em um arquivo que será distribuído a outras pessoas ou servidores de chaves na Internet, use a opção __--export__
 
{% highlight bash %}
gpg --export -a usuario > chave-pub.txt
{% endhighlight %}

> Ao invés do nome do usuário, poderá ser usado seu e-mail, ID da chave, etc. A opção -a permite que os dados sejam gerados usando bits ASCII 7.

## Adicionando chaves públicas ao seu chaveiro pessoal

Isto é necessário para o envio de dados criptografados e checagem de assinatura do usuário, use a opção __--import__
 
{% highlight bash %}
gpg --import chave-pub-usuario.txt
{% endhighlight %}

Assumindo que o arquivo __chave-pub-usuario.txt__ contém a chave pública do usuário criada em. O gpg detecta chaves públicas dentro de textos e faz a extração corretamente. Minha chave pública pode ser encontrada em __http://pgp.ai.mit.edu__.

## Listando chaves de seu chaveiro

Use o comando

{% highlight bash %}
gpg --list-keys
{% endhighlight %}

> Para listar as chaves pública do seu chaveiro. O comando __gpg --list-secret-keys__ lista suas chaves privadas.

## Apagando chaves de seu chaveiro

> Quando uma chave pública é modificada ou por qualquer outro motivo deseja retira-la do seu chaveiro público, utilize a opção __--delete-key__
 
{% highlight bash %}
gpg --delete-key usuario
{% endhighlight %}

Pode ser especificado o nome de usuário, e-mail IDchave ou qualquer outro detalhe que confira com a chave pública do usuário. Será pedida a confirmação para excluir a chave pública. 

> OBS: A chave privada pode ser excluída com a opção -__-delete-secret-key__. Utilize-a com o máximo de atenção para excluir chaves secretas que não utiliza (caso use mais de uma), a exclusão acidental de sua chave secreta significa é como perder a chave de um cofre de banco: você não poderá descriptografar os arquivos enviados a você e não poderá enviar arquivos assinados. Mesmo assim se isto acontecer acidentalmente, você poderá recuperar o último backup da chave privada em __~/.gnupg/secring.gpg~__.

## Mudando sua FraseSenha

Execute o comando __gpg --edit-key__ usuário, quando o programa entrar em modo de comandos, digite __passwd__. Será lhe pedida a "__Frase Senha__" atual e a __nova__ "__Frase Senha__". Digite "save" para sair e salvar as alterações ou "__quit__" para sair e abandonar o que foi feito. O __gpg --edit-key__ permite gerenciar diversos aspectos de suas chaves é interessante explora-lo digitando "__?__" para exibir todas as opções disponíveis.

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

## Assinando uma chave digital

A assinatura de chaves é um meio de criar laços de confiança entre usuários __PGP__. Assinar uma chave de alguém é algo sério, você deve ter noção do que isto significa e das consequências que isto pode trazer antes de sair assinando chaves de qualquer um. O próprio teste para desenvolvedor da distribuição __Debian__ requer como primeiro passo a identificação do candidato, caso sua __chave pgp__ seja assinada por algum desenvolvedor desta distribuição, imediatamente o teste de identificação é completado. A partir disso você deve ter uma noção básica do que isto significa. 

Para assinar uma chave siga os seguintes passos

* Importe a chave pública do usuário.
* Execute o comando __gpg --edit-key__ usuario (onde usuario é o nome do usuário/e-mail/IDchave da chave pública importada).
* Digite list, e selecione a chave pública (pub) do usuário com o comando __uid [numero_chave]__. Para assinar todas as chaves públicas do usuário, não selecione qualquer chave com o comando uid.
* Para assinar a chave pública do usuário digite sign, será perguntado se deseja realmente assinar a chave do usuário e então pedida a "FraseSenha" de sua chave privada.
* Digite "__list__", repare que existe um campo chamado __trust__: __n/q__ no lado direito. O primeiro parâmetro do "__trust__" indica o valor de confiança do dono e o segundo (após a __/__) o valor de confiança calculado automaticamente na chave. As seguintes possuem o seguinte significado
* __-__ - Nenhum dono encontrado/confiança não calculada.
* __e__ - Chave expirada/falha na checagem de confiança.
* __q__ - Quando não conhece o usuário.
* __n__ - Quando não confia no usuário (é o padrão).
* __m__ - Pouca confiança no usuário.
* __f__ - Totalmente confiável.
* __u__ - Indiscutivelmente confiável. Somente usado para especificar a chave pública do próprio usuário.

O valor de confiança da chave pode ser modificado com o comando trust e selecionando uma das opções de confiança. Os valores de confiança para a chave pública pessoal é __-/u__ (não é necessário calcular a confiança/indiscutivelmente confiável).

## Listando assinaturas digitais

Execute o comando __gpg --list-sigs__ para listas todas as assinaturas existentes no seu chaveiro. Opcionalmente pode ser especificado um parâmetro para fazer referência a assinatura de um usuário:gpg --list-sigs usuario. O comando __gpg --check-sigs__ adicionalmente faz a checagem de assinaturas.

## Recomendações para a assinatura de chaves gpg

__Este texto foi divulgado por uma pessoa que pediu para permanecer anônima__ na lista __debian-user-portuguese@lists.debian.org__ explicando os procedimentos de segurança para a troca de chaves públicas individuais e em grupo de usuários. Ele é um pouco longo mas a pessoa é especializada no assunto, e seu foco é a segurança na troca de chaves e o que isto significa. Após consulta ao autor do texto, o texto foi reproduzido na íntegra, mantendo os padrões de formatação da mensagem.


## Trocando assinaturas de chaves digitais

 Direitos de republicação cedidos ao domínio público, contanto que o texto seja reproduzido em sua íntegra, sem modificações de quaisquer espécie, e incluindo o título e nome do autor.
 
* 1. Assinaturas digitais
* 2. Chaves digitais e a teia de confiança
* 3. Trocando assinaturas de chaves digitais com um grupo de pessoas

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

## Criando arquivos .tar.gz com senha

> Aqui vai uma dica para deixar seus arquivos compactados em tar.gz com senha, na verdade o arquivo será transformado num __.gpg__, segue

__Para compactar__

* Cria o tar(__-cf__, __C__ de __C__ reate) e (__f__ de __F__ iles), logo (__-cf Create Files__, serve pra memorizar)

{% highlight bash %}
tar -cf nome_que_vc_escolher.tar arquivo_ou_pasta
{% endhighlight %}

* Agora transforma ele em __tar.gz__

{% highlight bash %}
$gzip -9 arquivo_que_vc_criou.tar
{% endhighlight %}

* e agora usa-se o __gpg__ pôr senha

{% highlight bash %}
gpg -c arquivo.tar.gz
{% endhighlight %}

* __Descompactando__ , é preciso pôr a senha pré criada, quando ele solicitar

{% highlight bash %}
gpg arquivo.tar.gz.gpg
{% endhighlight %}

* Agora extrair(__-xf__ X de e __X__ tract e F de __F__ iles, __eXtract Files__)

{% highlight bash %}
tar -xf arquivo.tar.gz
{% endhighlight %}

## Pronto!

<iframe width="920" height="400" src="https://www.youtube.com/embed/Rwyf04a1tAc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Fonte: http://pt.wikibooks.org/wiki/Guia_do_Linux/Avançado
