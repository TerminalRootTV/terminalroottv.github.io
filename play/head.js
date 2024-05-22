function Sprite(x, y, largura, altura){
  this.x = x;
  this.y = y;
  this.largura = largura;
  this.altura = altura;

  this.desenha = function(xCanvas, yCanvas){
    ctx.drawImage(img, this.x, this.y, this.largura, this.altura, xCanvas, yCanvas, this.largura, this.altura);		
  }
}

var bg = new Sprite(0, 0, 600, 700),
  gentoo = new Sprite(601, 0, 87, 87),
  oChao  = new Sprite(0, 601, 600, 50);
Play  = new Sprite(601, 88, 300, 300);
Perdeu = new Sprite(601, 402, 300, 300);
novoRecord = new Sprite(0, 650, 100, 100);

ubuntu = new Sprite(905,1,50,120);
mint = new Sprite(905,123,50,120);
fedora = new Sprite(905,248,50,120);
debian = new Sprite(905,371,50,120);
arch = new Sprite(905,495,50,120);
