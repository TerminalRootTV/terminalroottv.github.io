---
layout: post
title: "Converta facilmente seus script em TypeScript para Lua"
date: 2021-05-17 11:21:36
image: '/assets/img/dev/typescript2lua.png'
description: 'Este projeto é útil em qualquer ambiente onde o código Lua é aceito, com a opção de simplesmente declarar qualquer API existente usando arquivos TypeScript.'
icon: 'ion:terminal-sharp'
iconname: 'TypeScript/Lua'
tags:
- javascript
- lua
---

<img src="/assets/img/dev/typescript2lua.png" alt="Converta facilmente seus script em TypeScript para Lua" title="Converta facilmente seus script em TypeScript para Lua" style="border: none;">

Esse é o sonho de muitos programadores, teruma ferramenta que traduz uma [linguagens de programação](https://terminalroot.com.br/2019/10/linguagem-de-programacao.html) em outra!

Logo de início vou logo dizendo que nem tudo são flores, inclusive há uma análise no final.

Mas trata-se de uma ferramenta interessante!

---

**TypeScriptToLua** é uma ferramenta que converte seu código escrito em [TypeScript](https://terminalroot.com.br/2021/05/compartilhe-seu-desktop-para-o-navegador.html) para [Lua](https://terminalroot.com.br/2016/11/blog-linux-lua.html).

Este projeto é útil em qualquer ambiente onde o código Lua é aceito, com a poderosa opção de simplesmente declarar qualquer [API](https://terminalroot.com.br/2021/04/como-criar-uma-api-com-laravel-8.html) existente usando arquivos de declaração TypeScript.

Os tipos estáticos podem aliviar a carga mental de escrever programas, rastreando automaticamente as informações que o programador teria que rastrear mentalmente de alguma forma. 

Os tipos permitem que os desenvolvedores Lua usem ferramentas e práticas de desenvolvimento altamente produtivas, como verificação estática e refatoração de código ao desenvolver aplicativos Lua. As extensões TypeScript estão disponíveis para muitos editores de texto.

# Como funciona?
Primeiramente você precisa possuir o [Node.js](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) e o [NPM](https://terminalroot.com.br/2019/11/como-instalar-nodejs-no-linux-e-primeiros-passos.html) instalados no seu sistema. Depois basta usar o `npm` para instalar o TypeScriptToLua:
{% highlight bash %}
sudo npm install -g -D typescript-to-lua
{% endhighlight %}

Após instalado, agora você já possui o comando `tstl` e pode obter informações com o parametro `--help`:
{% highlight bash %}
tstl --help
{% endhighlight %}

Pra economizar seu tempo, a saída será:
{% highlight bash %}
Version 0.39.3
Syntax:   tstl [options] [files...]

Examples: tstl path/to/file.ts [...]
          tstl -p path/to/tsconfig.json

In addition to the options listed below you can also pass options
for the typescript compiler (For a list of options use tsc -h).
Some tsc options might have no effect.

Options:

 --luaBundle <string>                            The name of the lua file to bundle output lua to. Requires luaBundleEntry.

 --luaBundleEntry <string>                       The entry *.ts file that will be executed when entering the luaBundle. Requires luaBundle.

 --luaLibImport <none|always|inline|require>     Specifies how js standard features missing in lua are imported.

 -lt|--luaTarget <universal|5.1|5.2|5.3|5.4|JIT> Specify Lua target version.

 --noImplicitSelf <boolean>                      If "this" is implicitly considered an any type, do not generate a self parameter.

 --noHeader <boolean>                            Specify if a header will be added to compiled files.

 --sourceMapTraceback <boolean>                  Applies the source map to show source TS files and lines in error tracebacks.

 --luaPlugins <object>                           List of TypeScriptToLua plugins.
{% endhighlight %}

Muitas opções, né?! Mas é bem simples de utilizá-lo.

# Utilizando
Utilizar é muito simples, suponha que você possui esse código em TypeScript:
{% highlight typescript %}
let data = ["Marcos Oliveira", "terminalroot.com.br", "@terroo"]

for( let i = 0; i < data.length; i++){
  console.log( data[ i ] )
}
{% endhighlight %}

Se rodarmos `node script.ts` veremos que irá funcionar.

Para converter para Lua basta rodar o comando:
{% highlight bash %}
tstl script.ts
{% endhighlight %}

Automaticamente será gerado um arquivo com o mesmo nome com extensão `.lua`. De acordo com o código TypeScript informado acima, em Lua será:
{% highlight lua %}
data = {"Marcos Oliveira", "terminalroot.com.br", "@terroo"}
do
    i = 0
    while i < #data do
        print(data[i + 1])
        i = i + 1
    end
end
{% endhighlight %}

Agora basta rodar com Lua e ver a mesma saída:
{% highlight bash %}
lua script.lua
{% endhighlight %}

Saída em ambos os casos:
{% highlight bash %}
Marcos Oliveira
terminalroot.com.br
@terroo
{% endhighlight %}

# Análise
Bom, assim como o artigo que fizemos sobre: [Como Converter seu Shell Script em Binário](https://terminalroot.com.br/2019/08/como-converter-seu-shell-script-em-binario.html) que faz uso da [Linguagem C](https://terminalroot.com.br/tags#linguagemc) há uns pormenores que também há nesse tradutor [TypeScriptToLua](https://typescripttolua.github.io/).

Não há suporte para "statements" relacionandos ao sistema e variáveis de ambiente!

Tentei utilizar o `require('path')` e não traduziu, tentei também usar o `process.argv` que é do Node.js, mas serve também para o TypeScript, pois o mesmo é um super conjunto do [Javascript](https://terminalroot.com.br/tag#javascript), mas também não funcionou.

Mas isso depende do tipo de aplicação que você está criando. Para Web, na maioria dos casos, isso será somente um detalhe!

Eu particularmente curti o projeto, se você também se interessou acesse o site do [TypeScriptToLua](https://typescripttolua.github.io/) para mais informações.
> É possível fazer uns testes online!



