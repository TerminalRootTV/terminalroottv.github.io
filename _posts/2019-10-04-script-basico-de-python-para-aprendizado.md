---
layout: post
title: "Script Básico de Python para Aprendizado"
date: 2019-10-04 23:36:22
image: '/assets/img/python/python3.jpg'
description: "Pra quem gosta de Python e está pensando em comprar um livro ou fazer um curso, recomendo esse script que serve como uma 'luz'."
tags:
- python
- script
- tutorial
---

![Script Básico de Python para Aprendizado](/assets/img/python/python3.jpg "")

Esse script é a segunda versão que roda em python3 , se quiser comparar as diferenças com python2 , note que existem muuuuuuitas diferenças:
- Python2 → `print "String"` ; Python3 → `print("String")`;
- Python2 → `raw_input` ; Python3 → `input`;

E entre outras que você pode comparar clicando e analisando no link abaixo:
### [Script básico de Python 2 para aprendizado](https://terminalroot.com.br/2016/12/script-basico-de-python-para-aprendizado.html)


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

## Veja o script abaixo

Ou seja, para rodar, use assim:

{% highlight python %}
python esse_script.py
{% endhighlight %}

Ou dê permissão de execução: `chmod +x esse_script.py` e rode assim:

{% highlight python %}
./esse_script.py
{% endhighlight %}

{% highlight python %}
#!/usr/bin/python
print("O cabeçalho em script é: #!/usr/bin/env python ou #!/usr/bin/python")
print("Para não aparecer o erro (SyntaxError: Non-ASCII character), use essa linha logo abaixo do cabeçalho: #coding: utf-8")
print("Os comentários começam com: #")
print("Para imprimir na tela, ex.: print Olá, mundo!")
print("Não precisa do ';' no final, mas coloquei aqui e não apresentou erro;")
print("Pode ter comentários no meio da linha como aqui e não aparece") # comentário
variavel = "Minha Variável"
print(variavel)
print("Cria-se variáveis assim: variavel = 'Minha Variável' , pode usar aspas simples ou duplas")
soma = 8+8
print("Operações aritiméticas (soma+, subtração-, multiplicação*, divisão/): print 8+8 = ",soma)
print("Para concatenar strings basta usar o +, ex.: print('Pala'+'vra')")
print('Pala'+'vra')
print("Mas pra contatenar strings e integer, usa-se vírgula(,) (soma é uma variável/integer 8+8), ex.: print('8+8' , soma")
print("Pode-se usar a vírgula para separar também strings, no entanto, ficará com espaço, ex.: 'Pala','vra' --> Pala vra")
"comentário aspas duplas"
'comentário aspas simples'
print("Comentários também podem ser entre aspas simples ou duplas, como há nesse script, mas não pode misturá-los num mesmo comentário")
print( 7 / 2 )
print( 7.0 / 2 )
print('Na divisão quando quiser obter números irracionais(float) , tem de fazer também com float, como exemplo acima')
print('Você pode criar expressões aritiméticas , veja o resultado abaixo da expressão: print ( 9 - ( 1 + 2 ) ) / 3.0')
print( 9 - ( 1 + 2 ) / 3.0 )
print('As mensagens de erro são descritivas e no caso de sintaxe, o python usa um  ^ pra indicar o locar exato do erro')
print('existem vários tipos de erros como em outras linguagens de programação, consulte a documentação:\nhttp://turing.com.br/pydoc/2.7/tutorial/errors.html')
print('Como vc viu acima, o \\n pula linha')
meuarray = ['marcos', 'eric', 'camila']
print( meuarray[1] )
print("Criando um meuarray: meuarray = ['marcos', 'eric', 'camila']")
print('imprimindo determinado elemento de um meuarray: print meuarray[1] --> eric')
print('Condições if e else usa-se condição entre parênteses e dois pontos(:) no final, ex.:')
print('Diferente do Bash, não tem o fi pra fechar condição, ex.:\n\nif (condição):\n	print \nelse:\n	print(")')
print
print('print sozinho pula uma linha como no Bash')
total = 27
if (total > 30):
	print('variável total é maior que 30')
else:
	print('variável total é menor que 30')

print
inicial = 18

print("Usando o if, elif e else, e mais o operador lógico and. podia ser também: or ou not, veja nesse script")
if ( total < 30 ) and ( inicial < 15 ):
	print('Menor que 30 e menor que 15')
elif ( total < 30 ) and ( inicial < 16 ):
	print('Menor que 30 e menor que 16')
elif ( total < 30 ) and ( inicial < 17 ):
	print('Menor que 30 e menor que 17')
elif ( total < 30 ) and ( inicial == 18 ):
	print('Menor que 30 e igual a 18')
else:
	print('Sei lá')

print
print("Veja documentação:\nhttps://docs.python.org/2/tutorial/controlflow.html")
print
print('Utilizando o loop while, veja nesse script')
count = 0
while (count < 4):
   print('O contador é:', count)
   count = count + 1

print("Tchau!")
print('Utilizando o loop while com o else')
print
count = 1
while count < 3:
   print(count, " é  menor que 3")
   count = count + 1
else:
   print(count, " não é menor que 3")

print
print('Loop for , imprimir os elementos do array meuarray: for i in meuarray: print i')
for i in meuarray: print(i)
print

print("Se o loop for fosse: \n\nfor letter in 'Python':\n\n	print letter")
print("Imprimiria: cada letra da palavra Python e também pode usar o else como no while")
print('Usa-se uma das palavras reservadas(def) e o nome da função, e mais os dois pontos(:) no final')
print
print('Usando e criando funções')
def minhafuncao( str ):
	print('Minha profissão é:', str)
	return
print
minhafuncao('Desenvolvedor Python')
print
print('Usando funções pré-definida, exemplo da função raw_input estilo o read do Bash')

str = input('Insira seu nome: ')
print('seu nome é: ', str)
print
print('A função range: ')
print( range(4) )
print
print('Basicamente pra começar isso já é necessário, aguarde nas próximas postagens de exercícios e continuações, abraços!')
{% endhighlight %}

Comente!
