// variáveis do jogo
var canvas, ctx, ALTURA, LARGURA, maxPulos = 3, velocidade = 6, estadoAtual, record, img,

  estados = {
  jogar: 0,
  jogando: 1,
  perdeu: 2
},

chao = {
  y: 550,
  x: 0,
  altura: 50,

  atualiza: function(){
    this.x -= velocidade;

    if(this.x <= -30){
      this.x = 0;
    }
  },

  desenha: function() {
    oChao.desenha(this.x, this.y);
    oChao.desenha(this.x + oChao.largura, this.y);

  }
},

bloco = {
  x: 50,
  y: 0,
  altura: gentoo.altura,
  largura: gentoo.largura,
  gravidade: 1.6,
  velocidade: 0,
  forcaDoPulo: 23.6,
  qntPulos: 0,
  score: 0,
  rotacao: 0,
  vidas: 3,
  colidindo: false,

  atualiza: function() {
    this.velocidade += this.gravidade;
    this.y += this.velocidade;
    this.rotacao += Math.PI / 180 * velocidade;

    if(this.y > chao.y - this.altura && estadoAtual != estados.perdeu){
      this.y = chao.y - this.altura;
      this.qntPulos = 0;
      this.velocidade = 0;
    }

  },

  pula: function() {
    if(this.qntPulos < maxPulos){ // no maxPulos não precisa usar o this porque está global
      this.velocidade = -this.forcaDoPulo;
      this.qntPulos++;
    }

  },

  reset: function(){
    this.velocidade = 0;
    this.y = 0;

    if(this.score > record){
      localStorage.setItem("record", this.score);
      record = this.score;
    }

    this.vidas = 3;
    this.score = 0;
  },

  desenha: function() {
    //ctx.fillStyle = this.cor;
    //ctx.fillRect(this.x, this.y, this.largura, this.altura);
    ctx.save();
    ctx.translate(this.x + this.largura / 2, this.y + this.altura / 2);
    ctx.rotate(this.rotacao);
    gentoo.desenha(-this.largura / 2, -this.altura / 2);
    ctx.restore();


  }
},

obstaculos = {
  _obs: [],
  _sprites: [debian, ubuntu, fedora, arch, mint],
  tempoInsere: 0,

  insere: function(){
    this._obs.push({
      x: LARGURA,
      y: chao.y - Math.floor(20 + Math.random() * 100),
      largura: 50,
      sprite: this._sprites[Math.floor(this._sprites.length * Math.random())]
    });

    this.tempoInsere = 30 + Math.floor(21 * Math.random());

  },

  atualiza: function(){

    if(this.tempoInsere == 0){
      this.insere();
    }else{
      this.tempoInsere--;
    }

    for (var i = 0, tam = this._obs.length; i < tam ; i++){
      var obj = this._obs[i];
      obj.x -= velocidade;

      if(!bloco.colidindo && obj.x <= bloco.x + bloco.largura && bloco.x <= obj.x + obj.largura && obj.y <= bloco.y + bloco.altura){

        bloco.colidindo = true;

        setTimeout(function(){
          bloco.colidindo = false;
        }, 500);

        if(bloco.vidas >= 1){
          bloco.vidas--;
        }else{
          estadoAtual = estados.perdeu;
        }

      }

      else if(obj.x == 0){
        bloco.score++;
      }

      else if(obj.x <= -obj.largura){
        this._obs.splice(i, 1);
        tam--;
        i--;
      }

    }		
  },

  limpa: function(){
    this._obs = [];
  },

  desenha: function(){
    for (var i = 0, tam = this._obs.length; i < tam ; i++){
      var obj = this._obs[i];

      obj.sprite.desenha(obj.x, obj.y);

    }
  }


};

function clique(event){

  if(estadoAtual == estados.jogando){
    bloco.pula();
  }

  else if(estadoAtual == estados.jogar){
    estadoAtual = estados.jogando;
  }

  else if(estadoAtual == estados.perdeu && bloco.y >= 2 * ALTURA){
    estadoAtual = estados.jogar;
    obstaculos.limpa();
    bloco.reset();
  }
}

function main(){
  ALTURA = window.innerHeight;
  LARGURA = window.innerWidth;

  if (LARGURA >= 500){
    LARGURA = 600 ;
    ALTURA = 600;
  }

  canvas = document.createElement("canvas");
  canvas.width = LARGURA;
  canvas.height = ALTURA;
  canvas.style.border = "1px solid #000";

  ctx = canvas.getContext("2d");
  document.body.appendChild(canvas);

  document.addEventListener("mousedown", clique);

  estadoAtual = estados.jogar;

  record = localStorage.getItem("record");

  if(record == null){
    record = 0;
  }

  img = new Image();
  img.src = "sheet.png";

  roda();

}

function roda(){

  atualiza();
  desenha();

  window.requestAnimationFrame(roda);
}

function atualiza(){

  if(estadoAtual == estados.jogando){
    obstaculos.atualiza();
  }

  chao.atualiza();
  bloco.atualiza();


}

function desenha(){
  //ctx.fillStyle = "#80daff";
  //ctx.fillRect(0, 0, LARGURA, ALTURA); // superior esquerdo, inferior direito, LARGURA, ALTURA
  bg.desenha(0, 0);


  ctx.fillStyle = "#fff";
  ctx.font = "50px Arial";
  ctx.fillText(bloco.score, 30, 68);
  ctx.fillText(bloco.vidas, 540, 68);



  if(estadoAtual == estados.jogando){
    obstaculos.desenha();
  }

  chao.desenha();		
  bloco.desenha();

  if(estadoAtual == estados.jogar){
    Play.desenha(LARGURA / 2 - Play.largura / 2, ALTURA / 2 - Play.altura / 2);
  }

  if(estadoAtual == estados.perdeu){
    Perdeu.desenha(LARGURA / 2 - Play.largura / 2, ALTURA / 2 - Play.altura / 2);

    ctx.font = "30px Arial";
    ctx.fillStyle = "#fff";
    ctx.fillText(bloco.score, 375, 305);
    ctx.fillText(record, 345, 340);

    if(bloco.score > record){
      novoRecord.desenha(LARGURA / 2 - Play.largura / 2 + 30, ALTURA / 2 - Play.altura / 2 + 200)
    }


  }




}


// inicializa o jogo
main();


