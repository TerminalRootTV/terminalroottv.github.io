---
layout: post
title: "Limpe suas URLs dos Parâmetros das Redes Sociais e Outros"
date: 2019-09-24 20:05:46
image: '/assets/img/firefox/limpe-sua-url.jpg'
description: 'Evite perda de tempo, de espaço, poluição visual e principalmente rastreamento do que você anda lendo.'
tags:
- firefox
- web
- complementos
---

![Limpe suas URLs dos Parâmetros das Redes Sociais e Outros](/assets/img/firefox/limpe-sua-url.jpg)

A maioria sempre salva bastante links nos favoritos . O problema é que quando você clica nesse link de uma mídias social, ( ex.: [Facebook](https://www.facebook.com/groups/TerminalRootTV/) ), eles adicionam parâmetros para rastrear seu clique .

E quando você salva esse link nos seus favoritos, ele é salvo com esses parâmetros e se você não se atentar , vocẽ terá salvo várias vezes o mesmo link por conta do parâmetro que foi adicionado à URL, e que são sempre diferentes, e então se você não lembra se já salvou tal link nos seus favoritos, o navegador não vai exibir que o link já está nos favoritos e você terá repetidos links nos seus favoritos, que não passam do mesmo link.

Ou seja, perda de tempo, perda de espaço, poluição visual e principalmente aumento no rastreamento do que você anda lendo.

Exemplo SEM um *despoluidor de url*:
{% highlight html %}
https://terminalroot.com.br/2019/09/limpe-sua-url.html?fbclid=IwAR0BkWQyL1JDAm1dl2ECnMHrtb8L32pMIT-nJYZkXp1S8W7wCr-U9ctIIms
{% endhighlight %}

Após limpar a URL:
{% highlight html %}
https://terminalroot.com.br/2019/09/limpe-sua-url.html
{% endhighlight %}

Para isso existem diversos complementos/programas que são instaláveis em diversos navegadores e que podem remover esses links automáticamente quando você clicar. Nesse exemplo vou citar, e é o que eu utilizo no momento, o [Neat URL](https://addons.mozilla.org/pt-BR/firefox/addon/neat-url/) .

Ele está disponível para [Firefox](https://terminalroot.com.br/2014/09/complementos-uteis-para-firefox.html) e [Google Chrome](https://terminalroot.com.br/2016/04/lista-com-28-navegadores-para-linux.html) , como eu utilizo Firefox, vou mostra como utilizá-lo. Mas ao final do artigo vou deixar links para alternativas ao Neat URL, inclusive também para outros navegadores, bem como o Opera e Vivaldi .

## Instalando o Neat URL no Firefox

1. Primeiramente vá até o link do complemento/addon: <https://addons.mozilla.org/pt-BR/firefox/addon/neat-url/> e clique em adicionar ao Firefox:
![Neat URL Firefox](/assets/img/firefox/adicionar-ao-firefox.png)

2. O Firefox vai pedir para você confirmar se realmente deseja adicionar, clique em adicionar:
![Neat URL Firefox](/assets/img/firefox/adicionar.png)

3. Após aceitar, automáticamente o Neat URL já estará adicionado e já estará funcionando, ele confirmará a instalação, bem como lhe perguntar se você também deseja que ele funcione em janelas privativas, se quiser marque a opção e para aceitar o aviso (no canto superior direito do Firefox) clique em Ok, entendi :
![Neat URL Firefox](/assets/img/firefox/ok-entendi.png)

A partir de agora, todas as URL que possuem os parâmetros, veja a lista abaixo, serão removidas e isso inclui: Google Analytics, Amazon, LinkedIn e muitos outros:
{% highlight html %}
utm_source, utm_medium, utm_term, utm_content, utm_campaign, utm_reader, utm_place, utm_userid, 
utm_cid, utm_name, utm_pubreferrer, utm_swu, utm_viz_id, ga_source, ga_medium, ga_term, ga_content, 
ga_campaign, ga_place, yclid, _openstat, fb_action_ids, fb_action_types, fb_ref, fb_source, 
action_object_map, action_type_map, action_ref_map, gs_l, pd_rd_r@amazon.*, pd_rd_w@amazon.*, 
pd_rd_wg@amazon.*, _encoding@amazon.*, psc@amazon.*, ved@google.*, ei@google.*, sei@google.*, 
gws_rd@google.*, cvid@bing.com, form@bing.com, sk@bing.com, sp@bing.com, sc@bing.com, qs@bing.com, 
pq@bing.com, feature@youtube.com, gclid@youtube.com, kw@youtube.com, $/ref@amazon.&ast, _hsenc, mkt_tok, 
hmb_campaign, hmb_source, hmb_medium, spReportId, spJobID, spUserID, spMailingID, utm_mailing, 
utm_brand, CNDID, mbid, trk, trkCampaign, sc_campaign, sc_channel, sc_content, sc_medium, 
sc_outcome, sc_geo, sc_country
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

## Configurando o Neat URL no Firefox

Apesar da lista ser muito grande, o parâmetro de rastreamento do Facebook não está incluso. Vamos ver como incluir esse e também de outros que você queira posteriormente.

1. Vá até o canto superior direito do Firefox e clique no ícone com três listras paralelas e depois vá até Extensões e selecione, ou simplesmente tecle Ctrl + Shift + A , como há na imagem onde o cursor está:
![Neat URL Firefox](/assets/img/firefox/extensoes.png)

2. Após aberta uma nova janela, clique na opção com três pontinhos `●●●` onde está localizado o Neat URL , e depois em Preferências
![Neat URL Firefox](/assets/img/firefox/preferencias.png)

3. Será aberta as preferências do Neat URL e no campo Blocked Parameteres, você verá todos os parâmetros que já estão sendo bloqueados por padrão . Você pode redimensionar o campo e usar a barra de rolagem do mesmo, como há na imagem:
![Neat URL Firefox](/assets/img/firefox/blocked-fbclid.png)

4. Vá até o final desse campo, e ao final do último parâmetro, insira uma vírgula → **,** e depois a sigla: **fbclid** , depois é só clicar em **Save Preferences** que fica ao final dessa página e pronto, agora os links que saírem do Facebook também serão automáticamente limpos de parâmetros adicionais.
![Neat URL Firefox](/assets/img/firefox/save-preferences.png)

Se quiser Pausar , por algum motivo, o Neat URL , basta clicar em cima do mesmo e ele ficará com uam barra vermelha, e isso quer dizer que ele estará desativado . Quando ele encontra uma parâmetro que está incluso na lista, ele tammbém mostra um número bem pequeno em cima do ícone dele, informando que bloqueou um parâmetro.

## Conclusão

Eu sinceramente curti muito, porque eu odeios essas URLs poluídas por mídias sociais, principalmente as do Facebook . E também curti o Neat URL porquê ele não interferiu em nada no funcionamento e nem na velocidade do Firefox, continua rápido , como sempre! ✌ ) Mas se você não curtir, basta remover ele através do mesmo painel de Extensões → ●●● → remover .

Visite o [GitHub do Neat URL](https://github.com/Smile4ever/Neat-URL) → <https://github.com/Smile4ever/Neat-URL>

### Links úteis:

+ [Neat URL](https://addons.mozilla.org/pt-BR/firefox/addon/neat-url/) → <https://addons.mozilla.org/pt-BR/firefox/addon/neat-url/>
+ [Lista com 28 Navegadores para Linux](http://bit.ly/2mV7mKd)
+ [Como Rodar Shell Script e Python via Apache no Linux](https://www.youtube.com/watch?v=5hQyfXIMviM)

### Veja os links de alternativas e o Neat URL para Google Chrome , Vivaldi e Opera:

+ Alternativas → <https://alternativeto.net/software/neat-url/>
+ Link para adicionar o Neat URL no Google Chrome: <https://chrome.google.com/webstore/detail/neat-url/jchobbjgibcahbheicfocecmhocglkco>
+ [Pure URL para Opera](https://addons.opera.com/pt-br/extensions/details/pure-url/) → <https://addons.opera.com/pt-br/extensions/details/pure-url/>
+ [Usar Extensões do Google Chrome no Vivaldi](https://vivaldi.com/blog/chrome-web-store-extensions-in-vivaldi-browser/)
+ [ClearURLS para Firefox](https://addons.mozilla.org/en-US/firefox/addon/clearurls/) → <https://addons.mozilla.org/en-US/firefox/addon/clearurls/>
    
