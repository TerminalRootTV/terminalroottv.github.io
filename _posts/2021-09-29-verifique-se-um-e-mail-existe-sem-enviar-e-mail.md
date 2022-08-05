---
layout: post
title: "Verifique se um e-mail existe sem enviar e-mail"
date: 2021-09-29 08:36:52
image: '/assets/img/rust/check-if-email-exists.jpg'
description: 'Além da validação de expressões regulares!'
icon: 'ion:terminal-sharp'
iconname: 'Rust'
tags:
- inutil
---

![Verifique se um e-mail existe sem enviar e-mail, escrito em Rust.](/assets/img/rust/check-if-email-exists.jpg)

Agora além de usar aquela sua [RegEx](https://terminalroot.com.br/regex) para verificar se o e-mail foi digitado dentro do padrão, agora você pode o **check-if-email-exists** para verificar se o mesmo existe, sem enviar nenhum e-mail!

É uma ferramenta muito interessante e fácil de usar .

---

# Instalação
Para instalar, você precisa de o [Rust](https://terminalroot.com.br/tags#rust) e p [Cargo](https://terminalroot.com.br/2021/07/como-criei-meu-primeiro-programa-em-rust.html) instalados, além do [Git](https://terminalroot.com.br/git), então rode os comandos:

{% highlight sh %}
git clone https://github.com/reacherhq/check-if-email-exists
cd check-if-email-exists
cargo build --release
sudo mv ./target/release/check_if_email_exists /usr/local/bin/
{% endhighlight %}

---

# Utilização
A utilização é muito intuitiva, para mais detalhes rode o comando `check_if_email_exists --help` a saída será similar ao conteúdo abaixo:


<!-- QUADRADO -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

{% highlight sh %}
Amaury <amaurym10@protonmail.com>

Check if an email address exists without sending any email.

USAGE:
    check_if_email_exists [FLAGS] [OPTIONS] [TO_EMAIL]

ARGS:
    <TO_EMAIL>    The email to check

FLAGS:
    -h, --help       Print help information
        --http       DEPRECATED. Runs a HTTP server. This option will be removed in v0.9.0
    -V, --version    Print version information

OPTIONS:
        --from-email <FROM_EMAIL>
...
{% endhighlight %}

Exemplo básico verificar se o e-mail: **oi@tchau.com** existe:

{% highlight sh %}
check_if_email_exists oi@tchau.com
{% endhighlight %}

A saída será em formato [JSON](https://terminalroot.com.br/2020/01/javascript.html):

{% highlight sh %}
[
  {
    "input": "oi@tchau.com",
    "is_reachable": "unknown",
    "misc": {
      "is_disposable": false,
      "is_role_account": false
    },
    "mx": {
      "accepts_mail": true,
      "records": [
        "localhost."
      ]
    },
    "smtp": {
      "error": {
        "type": "SmtpError",
        "message": "client: Connection closed"
      }
    },
    "syntax": {
      "address": "oi@tchau.com",
      "domain": "tchau.com",
      "is_valid_syntax": true,
      "username": "oi"
    }
  }
]
{% endhighlight %}

Note o elemento: **is_role_account": false** , se o e-mail existisse seria **true** .

Para mais informações consulte o [repositório do check-if-email-exists](https://github.com/reacherhq/check-if-email-exists) .

