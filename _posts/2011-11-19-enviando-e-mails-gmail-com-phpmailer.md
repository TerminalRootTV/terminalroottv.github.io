---
layout: post
title: 'Enviando E-Mails (Gmail) com PHPMailer'
date: '2011-11-18T18:18:00.000-08:00'
description: 'Eu utilizei essa classe hoje pra configurar minha página de contato aqui do Blog'
tags:
- php
---

Eu utilizei essa classe hoje pra configurar minha página de contato aqui do Blog.

A classe __PHPMailer__ serve para envio de e-mails através do __PHP__ via conexão __SMTP__ ou __POP3__ muito utilizado por todo o mundo. Seu método de envio é largamente recomendado e é bem melhor do que o envio do __mail()__ ou __sendmail()__ ambas do PHP.

Esse processo é bem simples, e nesse caso vamos configurar também o envio de resposta pra quem __preencheu o formulário__.

Separei em dos arquivos, mas costumo usar tudo num só arquivo, os dois arquivos serão

> __index.php__

> __enviar.php__


Usarei como exemplo um e-mail do __Gmail__, primeiramente temos de baixar a classe __PHPMailer__ do site e descompactá-la no local onde está os arquivos criados aqui.

Agora vamos construir nosso __index.php__ que estará nosso form(nao usei tableless nesse exemplo, nem tá completo o arquivos faltando as tags de uma página HTML).


{% highlight php %}
<table border="1">
      <!--Informamos o arquivo PHP que irá processar o form e o método de envio, o POST-->
    <form action="enviar.php" method="post" enctype="multipart/form-data">
        <tr>
            <td>Nome:</td>
            <td>
                <input type="text" class="texto" name="nome" />
            </td>
        </tr>       
        <tr>
            <td>Email:</td>
            <td>
                <input type="text" class="texto" name="email" />
            </td>
        </tr>       
        <tr>
            <td>Assunto:</td>
            <td>
                <input type="text" class="texto" name="assunto" />
            </td>
        </tr>       
        <tr>
            <td>Mensagem</td>
            <td>
                <textarea name="mensagem"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <a href="index.php">Atualizar</a>
            </td>
            <td>
                <input type="submit" name="enviar" class="bottom"/>
            </td>
        </tr>   
    </form>
</table>
{% endhighlight %}

## enviar.php

{% highlight php %}
<?php
  /* se apertar em enviar dados entra no processo*/
  if(isset($_POST['enviar']))
  {
  /* extraimos o POST para criar as variaveis automaticamente pelo nome do FORM */
     extract($_POST);
  /* CASO ALGUM CAMPO ESTEJA VAZIO, aconselho não colocar mensagem por campo e sim completo por motivos de segurança */
     if(empty($nome)     ||
        empty($email)    ||
        empty($assunto)  ||
        empty($mensagem)
       )
     {
          echo 'Um ou mais campos está(ão) vazio(s).';
     }
     /* utilizando Expressão Regular, verificamos se o formato do email é válido, clique aqui pra saber mais sobre Expressões Regulares */
    
     else if(!preg_match("/^[a-z0-9_\.\-]+@[a-z0-9_\.\-]*[a-z0-9_\-]+\.[a-z]{2,4}$/i", $email))
     {
          echo 'Informe um email válido.';
     }
     else
     {
      /* preparamos o arquivo para envio */
          $corpo = 'Nome: '.$nome.'<br />Email: '.$email.'<br />Mensagem: <br /><br />'.$mensagem;

          /* criamos uma função para chamar os métodos da Classe PHPMailer */
          function sendMail($assunto,$corpo,$remetente,$nomeRemetente,$destino,$nomeDestino){
          /* Incluimos a class, lembrando que essa classe é o arquivo baixado e está dentro da pasta PHPMailer, renomei */
          require_once('PHPMailer/class.phpmailer.php');
          /* Instanciamos a class */
          $mail = new PHPMailer(); //inicia a classe
          /* Setamos os métodos necessários para o funcionamento */
          $mail->IsSMTP();
          $mail->SMTPAuth = true;
          $mail->Host = 'smtp.gmail.com';
          $mail->Port = '587';
          $mail->SMTPSecure = "tls";
          /* digite aqui o seu email que fará a autenticação de envio */
          $mail->Username = 'SEU_EMAIL@gmail.com';
          /* coloque a senha desse email */
          $mail->Password = 'SUA_SENHA_DO_EMAIL_ACIMA';
          $mail->From = $remetente;
          $mail->FromName = utf8_decode($nomeRemetente);
          $mail->IsHTML(true);
          $mail->Subject = utf8_decode($assunto); //assunto
          $mail->Body = utf8_decode($corpo); //mensagem
          $mail->AddAddress($destino,utf8_decode($nomeDestino)); //email e nome do destino
          /* caso haja erro no envio */
          if(!$mail->Send()){

          echo 'Erro ao enviar mensagem.';
          /* caso o envio esteja correto */
          }else{
         
          echo 'Sua mensagem foi enviada com sucesso!';
         
         }
         
    }

         /* preparamos a mensagem de resposta */
          $resposta = 'Olá '.$nome.'!<br />
                      Obrigado por entrar em contato!<br />
                      Em breve responderemos.<br />
                      Atenciosamente,<br /><br />
                      SUA ASSINATURA.<br />';

        /* envia o email para você */
        sendMail($assunto,$corpo,$email,$nome,'SEU_EMAIL@gmail.com','SUA MENSAGEM');
        /* envia o email de resposta */
        sendMail('Olá '.$nome.', recebemos sua mensagem',$resposta,'SEU_EMAIL@gmail.com','SEU TITULO',$email,$nome);

      }/* else dos campos vazios e da ExReg */
  }
?>
{% endhighlight %}


## Pronto, é isso, qualquer dúvida é só comentar

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

