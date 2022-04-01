let text = window.location.href

let regexP = /regex/i;
let regexR = text.match(regexP);

let sedP = /sed/i;
let sedR = text.match(sedP);

let bashP = /bash/i;
let bashR = text.match(bashP);

let shellP = /shell/i;
let shellR = text.match(shellP);

let vueP = /vue/i;
let vueR = text.match(vueP);

let phpP = /php/i;
let phpR = text.match(phpP);

let vimP = /vim/i;
let vimR = text.match(vimP);

//const urls = ["regex", "sed", "bash", "shell", "vue", "php"];

if( text.match(regexR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = "https://cutt.ly/regex"
}else if(text.match(sedR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/sedsed'
}else if(text.match(bashR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/bashbash'
}else if(text.match(shellR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/shell'
}else if(text.match(vueR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/vuevue'
}else if(text.match(phpR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/phpphp'
}else if(text.match(vimR)){
  document.getElementById("url").innerHTML = "Aguarde, redirecionando ...";
  window.location = 'https://cutt.ly/neovim'
}else{
  document.getElementById("url").innerHTML = "Use o campo de pesquisa!";
}
