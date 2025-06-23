---
layout: post
title: "50 Comandos GNU X 50 Comandos PowerShell"
date: 2025-06-23 09:09:08
image: '/assets/img/powershell/gnu-vs-powershell.jpg'
description: "🐂 🆚 ✴️ Vários comandos do dia a dia usados no terminal do GNU e equivalentes em PowerShell."
icon: 'ion:terminal-sharp'
iconname: 'GNU/PowerShell'
tags:
- powershell
- gnu
- comandos
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

No mundo da automação de tarefas, dominar a linha de comando é uma habilidade essencial. Seja com os tradicionais **[comandos GNU](https://terminalroot.com.br/tags#gnu)**, ou no ecossistema [Windows](https://terminalroot.com.br/tags#windows), com o poderoso **[PowerShell](https://terminalroot.com.br/tags#powershell)**, conhecer as ferramentas certas pode transformar sua produtividade.  

Nesta postagem, vamos confrontar **50 comandos GNU** com seus equivalentes no **PowerShell**.


<!-- SQUARE - GAMES ROOT -->
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
style="display:inline-block;width:336px;height:280px"
data-ad-client="ca-pub-2838251107855362"
data-ad-slot="5351066970"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

---

## 💻 01. Remover um diretório recursivamente
### 🐂 GNU
{% highlight bash %}
rm -rf /home/$USER/folder
{% endhighlight %}

### ✴️ PowerShell
{% highlight bash %}
Remove-Item -Path "C:\folder" -Recurse -Force
{% endhighlight %}

---

## 💻 02. Obter nome de um processo que está rodando:
### 🐂 GNU
{% highlight bash %}
ps aux | grep apache2 # httpd
{% endhighlight %}
> systemd: `systemctl status apache2`

### ✴️ PowerShell
{% highlight powershell %}
Get-Service | Where-Object { $_.DisplayName -like "*Apache*" }
{% endhighlight %}

---

## 💻 03. Parar um serviço
{% highlight bash %}
sudo kill -9 $(pidof apache2) # httpd
{% endhighlight %}
> systemd: `sudo systemctl stop apache2`

### ✴️ PowerShell
{% highlight powershell %}
Stop-Service -Name "Apache2.4"
{% endhighlight %}

---

## 💻 04. Remover uma Variável de Ambiente
### 🐂 GNU
{% highlight bash %}
unset NOME_DA_VARIAVEL
{% endhighlight %}

### ✴️ PowerShell `C:\App\bin`
{% highlight powershell %}
# Obtenha o valor atual da variável de ambiente Path do sistema
$envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)

# Separe os caminhos em um array
$paths = $envPath -split ';'

# Filtre para remover o caminho que você não quer mais
$newPaths = $paths | Where-Object { $_ -ne "C:\App\bin" }

# Recrie a variável de ambiente Path (sem o caminho indesejado)
$newPathString = ($newPaths -join ';').TrimEnd(';')

# Atualize a variável de ambiente do sistema
[Environment]::SetEnvironmentVariable("Path", $newPathString, [EnvironmentVariableTarget]::Machine)
{% endhighlight %}

---

## 💻 05. Verificar se um comando existe
### 🐂 GNU
{% highlight bash %}
which mycommand
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
Get-Command mycommand
{% endhighlight %}

---

## 💻 06. Criar uma pasta/diretório
### 🐂 GNU
{% highlight bash %}
mkdir my-project
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
New-Item -ItemType Directory "MyProject"
{% endhighlight %}

---

## 💻 07. Criar uma pasta/diretório recursivamente
### 🐂 GNU
{% highlight bash %}
mkdir -p my-project/folder/new
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
New-Item -Path "C:/MyProject/folder/new" -ItemType Directory
{% endhighlight %}

---

## 💻 08. Mover uma pasta/diretório de lugar
### 🐂 GNU
{% highlight bash %}
mv folder new/path/
{% endhighlight %}

## 💻 PowerShell
{% highlight powershell %}
Move-Item -Path "folder" -Destination "C:\new\path\"
{% endhighlight %}

---

## 💻 09. Entrar em um pasta/diretório
### 🐂 GNU
{% highlight bash %}
cd pasta/
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
Set-Location pasta
{% endhighlight %}

---

## 💻 10. Copiar arquivos e diretórios
### 🐂 GNU
{% highlight bash %}
cp file path/to/dest
cp -r folder/ path/to/dest
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
Copy-Item file path\to\dest
Copy-Item folder\ -Recurse -Destination path\to\dest
{% endhighlight %}

---

## 💻 11. Obter a pasta pessoal e/ou nome do usuário
### 🐂 GNU
{% highlight bash %}
$HOME
# echo $HOME

$USER
# echo $USER
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
$env:USERPROFILE
# Write-Host $env:USERPROFILE

$env:USERNAME
# Write-Host $env:USERNAME
{% endhighlight %}

---

## 💻 12. Listar arquivos e diretórios

### 🐂 GNU

{% highlight bash %}
ls -la
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-ChildItem -Force
{% endhighlight %}

---

## 💻 13. Mostrar conteúdo de um arquivo texto

### 🐂 GNU

{% highlight bash %}
cat file.txt
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Content file.txt
{% endhighlight %}

---

## 💻 14. Buscar texto dentro de arquivos

### 🐂 GNU

{% highlight bash %}
grep "termo" file.txt
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Select-String -Pattern "termo" -Path file.txt
{% endhighlight %}

---

## 💻 15. Exibir uso de disco

### 🐂 GNU

{% highlight bash %}
df -h
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-PSDrive -PSProvider FileSystem
{% endhighlight %}

---

## 💻 16. Ver uso de memória

### 🐂 GNU

{% highlight bash %}
free -h
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize,FreePhysicalMemory
{% endhighlight %}

---

## 💻 17. Exibir variáveis de ambiente

### 🐂 GNU

{% highlight bash %}
printenv
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-ChildItem Env:
{% endhighlight %}

---

## 💻 18. Renomear arquivo/diretório

### 🐂 GNU

{% highlight bash %}
mv oldname newname
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Rename-Item -Path oldname -NewName newname
{% endhighlight %}

---

## 💻 19. Executar comando como administrador/root

### 🐂 GNU

{% highlight bash %}
sudo comando
{% endhighlight %}

### ✴️ PowerShell (executar shell como administrador)

{% highlight powershell %}
Start-Process powershell -Verb runAs
{% endhighlight %}

---

## 💻 20. Ver rede/interfaces

### 🐂 GNU

{% highlight bash %}
ip addr show
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-NetIPAddress
{% endhighlight %}

---

## 💻 21. Cria uma variável de Ambiente
> Exemplo para [Terlang]: `C:\Program Files\Terlang\bin`(Windows) e `${HOME}/.local/terlang/bin/`(GNU)

### 🐂 GNU
{% highlight bash %}
export PATH="${PATH}:${HOME}/.local/terlang/bin/"
{% endhighlight %}

### ✴️ PowerShell
{% highlight powershell %}
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Terlang\bin", [System.EnvironmentVariableTarget]::Machine)
{% endhighlight %}

---

## 💻 22. Exibir últimas linhas de um arquivo (tail)

### 🐂 GNU

{% highlight bash %}
tail -n 20 file.log
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Content file.log -Tail 20
{% endhighlight %}

---

## 💻 23. Exibir processos em tempo real (top)

### 🐂 GNU

{% highlight bash %}
top
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
{% endhighlight %}
> *(não é em tempo real, mas dá um snapshot dos processos com maior uso de CPU)*

---

## 💻 24. Buscar e matar processo por nome

### 🐂 GNU

{% highlight bash %}
pkill -f processo
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Process -Name processo | Stop-Process -Force
{% endhighlight %}

---

## 💻 25. Monitorar alterações em arquivo (tail -f)

### 🐂 GNU

{% highlight bash %}
tail -f file.log
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Content file.log -Wait
{% endhighlight %}


<!-- RECTANGLE LARGE -->
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

---

## 💻 26. Compactar arquivos (tar gzip)

### 🐂 GNU

{% highlight bash %}
tar -czvf archive.tar.gz folder/
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Compress-Archive -Path folder\* -DestinationPath archive.zip
{% endhighlight %}

---

## 💻 27. Descompactar arquivo zip

### 🐂 GNU

{% highlight bash %}
unzip archive.zip
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Expand-Archive -Path archive.zip -DestinationPath destino\
{% endhighlight %}

---

## 💻 28. Visualizar variáveis de ambiente específicas

### 🐂 GNU

{% highlight bash %}
echo $VARIAVEL
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
$env:VARIAVEL
{% endhighlight %}

---

## 💻 29. Definir variável de ambiente para a sessão atual

### 🐂 GNU

{% highlight bash %}
export VARIAVEL=valor
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
$env:VARIAVEL="valor"
{% endhighlight %}

---

## 💻 30. Exibir informações do sistema (kernel, SO)

### 🐂 GNU

{% highlight bash %}
uname -a
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, OSArchitecture
{% endhighlight %}

---

## 💻 31. Ver horário e data atual

### 🐂 GNU

{% highlight bash %}
date
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Date
{% endhighlight %}

---

## 💻 32. Exibir quem está logado no sistema

### 🐂 GNU

{% highlight bash %}
who
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
query user
{% endhighlight %}

---

## 💻 33. Ver portas TCP abertas e processos associados

### 🐂 GNU

{% highlight bash %}
sudo netstat -tulpn
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-NetTCPConnection | Select-Object LocalAddress,LocalPort,OwningProcess
{% endhighlight %}

---

## 💻 34. Buscar arquivos pelo nome

### 🐂 GNU

{% highlight bash %}
find /path -name "arquivo.txt"
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-ChildItem -Path C:\path -Recurse -Filter "arquivo.txt"
{% endhighlight %}

---

## 💻 35. Agendar tarefa (cron / agendador)

### 🐂 GNU

{% highlight bash %}
crontab -e
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
# Exemplo simples para criar tarefa agendada via PowerShell
$action = New-ScheduledTaskAction -Execute "notepad.exe"
$trigger = New-ScheduledTaskTrigger -At 9am -Daily
Register-ScheduledTask -TaskName "AbrirNotepad" -Action $action -Trigger $trigger
{% endhighlight %}

---

## 💻 36. Limpar tela

### 🐂 GNU

{% highlight bash %}
clear
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Clear-Host
{% endhighlight %}

---

## 💻 37. Mostrar variáveis do sistema (com nome e valor)

### 🐂 GNU

{% highlight bash %}
env
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-ChildItem Env:
{% endhighlight %}

---

## 💻 38. Comparar arquivos linha a linha

### 🐂 GNU

{% highlight bash %}
diff file1 file2
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Compare-Object (Get-Content file1) (Get-Content file2)
{% endhighlight %}

---

## 💻 39. Executar script local (bash / powershell)

### 🐂 GNU

{% highlight bash %}
./script.sh
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
.\script.ps1
{% endhighlight %}

---

## 💻 40. Parar execução do comando (Ctrl + C)

### 🐂 GNU

{% highlight bash %}
Ctrl + C
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Ctrl + C
{% endhighlight %}

---

## 💻 41. Obter histórico de comandos na sessão atual

### 🐂 GNU

{% highlight bash %}
history
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-History
{% endhighlight %}

---

## 💻 42. Obter arquivo com histórico de comandos

### 🐂 GNU

{% highlight bash %}
cat ~/.bash_history
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Content (Get-PSReadlineOption).HistorySavePath
{% endhighlight %}

---

## 💻 43. Buscar texto no histórico de comandos

### 🐂 GNU

{% highlight bash %}
history | grep termo
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-History | Where-Object CommandLine -Match "termo"
{% endhighlight %}

---

## 💻 44. Exibir variáveis definidas na sessão atual

### 🐂 GNU

{% highlight bash %}
set
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-Variable
{% endhighlight %}

---

## 💻 45. Definir variável local (shell/session)

### 🐂 GNU

{% highlight bash %}
VARIAVEL=valor
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
$VARIAVEL = "valor"
{% endhighlight %}

---

## 💻 46. Limitar saída de comando (paginador)

### 🐂 GNU

{% highlight bash %}
command | less
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
command | Out-Host -Paging
{% endhighlight %}

---

## 💻 47. Definir alias (apelido para comando)

### 🐂 GNU

{% highlight bash %}
alias ll='ls -la'
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Set-Alias ll Get-ChildItem
{% endhighlight %}

---

## 💻 48. Remover alias

### 🐂 GNU

{% highlight bash %}
unalias ll
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Remove-Item Alias:ll
{% endhighlight %}

---

## 💻 49. Mostrar informações da CPU

### 🐂 GNU

{% highlight bash %}
lscpu
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
Get-CimInstance Win32_Processor | Select-Object Name,NumberOfCores,NumberOfLogicalProcessors
{% endhighlight %}

---

## 💻 50. Abrir editor de texto no terminal

### 🐂 GNU

{% highlight bash %}
vim arquivo.txt
{% endhighlight %}

### ✴️ PowerShell

{% highlight powershell %}
notepad arquivo.txt
{% endhighlight %}

---

### 🍖 Bônus:
Fazer download de arquivo:
+ GNU:
{% highlight bash %}
wget https://url.com/file.zip
# Ou: wget https://url.com/file.zip -O outronome.zip
{% endhighlight %}

+ PowerShell:
{% highlight powershell %}
Invoke-WebRequest -Uri "https://url.com/file.zip" -OutFile "file.zip"
{% endhighlight %}

## 👓 Veja também:
### 🔗 [7 Exemplos de Uso do PowerShell](https://terminalroot.com.br/2025/03/7-exemplos-de-uso-do-powershell.html)
### 🔗 [Conheça 7 ferramentas do GNU que são o poder da linha de comando](https://terminalroot.com.br/2022/03/conheca-7-ferramentas-do-gnu-que-sao-o-poder-da-linha-de-comando.html)
### 🔗 [10 Dicas de Flags e Parâmetros para GNU GCC](https://terminalroot.com.br/2023/08/10-dicas-de-flags-e-parametros-para-gnu-gcc.html)
### 🔗 [Personalize seu PowerShell Like a Pro](https://terminalroot.com.br/2025/05/personalize-seu-powershell-like-a-pro.html)


