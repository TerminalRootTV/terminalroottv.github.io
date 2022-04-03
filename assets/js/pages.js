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

let linuxP = /linux/i;
let linuxR = text.match(linuxP);

//const urls = ["regex", "sed", "bash", "shell", "vue", "php"];

if( text.match(regexR)){
  window.location = "https://cutt.ly/regex"
}else if(text.match(sedR)){
  window.location = 'https://cutt.ly/sedsed'
}else if(text.match(bashR)){
  window.location = 'https://cutt.ly/bashbash'
}else if(text.match(shellR)){
  window.location = 'https://cutt.ly/shell'
}else if(text.match(vueR)){
  window.location = 'https://cutt.ly/vuevue'
}else if(text.match(phpR)){
  window.location = 'https://cutt.ly/phpphp'
}else if(text.match(vimR)){
  window.location = 'https://cutt.ly/neovim'
}else if(text.match(linuxR)){
  window.location = 'https://terminalroot.com.br/tags/#linux'
}else{
  window.location = 'https://terminalroot.com.br/'
}
