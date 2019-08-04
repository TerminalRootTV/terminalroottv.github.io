---
layout: post
title: "transfer.sh - Guarde seus Arquivos na Nuvem Gratuitamente via Linha de Comando"
date: 2019-08-04 14:44:50
image: '/assets/img/terminal/transfer.sh.jpg)'
description: 'Com transfer.sh você faz upload de arquivos texto, compactados e outros.'
main-class: 'bash'
tags:
- transfer
- comandos
- terminal
---

![transfer.sh](/assets/img/terminal/transfer.sh.jpg)

[transfer.sh](https://transfer.sh/) é um serviço gratuito que você pode guardar seus arquivos na internet fazendo uppload via linha de comando, ou até mesmo pelo site via upload ou drag-and-drop.

Para usar o serviço é bem simples, basta você usar o [curl](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=curl) com o parâmetro `--upload-file` para transferir. Exemplo supondo que você tenha um arquivo de nome *arquivo.txt* e deseja fazer o upload e obter um endereço para poder acessá-lo de onde você quiser, o comando seria:

{% highlight bash %}
echo "Teste Terminal Root" > arquivo.txt
curl --upload-file arquivo.txt https://transfer.sh/arquivo.txt
https://transfer.sh/10D9rh/arquivo.txt
{% endhighlight %}

O endereço gerado pelo transfer foi: <https://transfer.sh/10D9rh/arquivo.txt> . Se for um arquivo texto (como nesse exemplo) automáticamente exibe o conteúdo:

![Transfer](/assets/img/terminal/transfer-1.jpg)

O conteúdo não apareceria se fosse um arquivo compactado, exemplo:

{% highlight bash %}
tar czvf arquivo-terminalroot.tar.gz arquivo.txt 
curl --upload-file arquivo-terminalroot.tar.gz https://transfer.sh/terminalroot.tar.gz
https://transfer.sh/ToyXz/terminalroot.tar.gz
{% endhighlight %}

A saída ficou assim:

![Transfer](/assets/img/terminal/transfer-2.jpg)

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

Além da URL ser única o que dificulta alguém obter acesso aos seus arquivos (descobrir o código da URL, é tão difícil quanto acertar os números da [Mega-Sena](http://cse.google.com.br/cse?cx=004473188612396442360:qs2ekmnkweq&q=mega-sena) ) , mas caso você deseje ainda mais segurança, você pode criptografar seus arquivos com gpg e depois fazer o upload:

{% highlight bash %}
gpg -c arquivo-terminalroot.tar.gz 
curl --upload-file arquivo-terminalroot.tar.gz.gpg https://transfer.sh/arquivo-marcos-cripto.gpg
https://transfer.sh/13ZIJp/arquivo-marcos-cripto.gpg
{% endhighlight %}

> Lembrando que o [GPG](https://gnupg.org/) pedirá para você criar uma senha e depois confirmá-la, e para descriptografar basta rodar o mesmo comando sem o parâmetro `-c` e em seguida indicar o arquivo `.gpg`

Acessando a url gerada pelo transfer, ficou assim:

![Transfer](/assets/img/terminal/transfer-6.jpg)


Se você quiser você pode criar um alias ou uma função no seu `~/.bashrc` ou do [Shell](https://terminalroot.com.br/shell) que você utiliza para ser um simples comando:

{% highlight bash %}
transfer(){
	if [[ -z "$1" ]]; then
		echo "É necessário informar o nome do arquivo."
		exit 1
	else
		curl --upload-file $1 https://transfer.sh/$1
		echo
	fi
}
{% endhighlight %}

Nesse caso eu criei uma função e tratei os parâmetros além de usar o *echo* final para a saída não colar com o prompt. Após fechar e abrir o terminal ou simplesmente usar o comando `source ~/.bashrc` toda vez que eu quiser enviar um arquivo basta usar o comando **transfer**, exemplo:

{% highlight bash %}
transfer file.ext
{% endhighlight %}

Simples, né ?!

Quer acrescentar alguma informação, então use nosso campo de comentários!

### Página do transfer.sh: <https://transfer.sh/>

Abraços!    
