#!/bin/bash
  
echo "content-type: text/html"
echo
echo
echo "
  <html> <head> <meta charset='utf-8' /> <title> CGI script </title> </head>
  <body>
  <h1>Algumas informações sobre a máquina que o CGI está rodando:</h1>
  "
  
echo "<h4>uptime</h4>"
echo "<pre>$(uptime)</pre>"
  
echo "<h4>uname</h4>"
echo "<pre>$(uname -a)</pre>"
  
echo "<h4>/proc/cpuinfo</h4>"
echo "<pre>$(cat /proc/cpuinfo)</pre>"
  
echo "
  </body>
  </html>
  "
