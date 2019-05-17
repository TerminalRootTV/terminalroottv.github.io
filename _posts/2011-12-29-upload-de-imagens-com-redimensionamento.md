---
layout: post
title: 'Upload de Imagens com redimensionamento, inserir Marca Dagua e salvar no banco'
date: '2011-12-29T11:37:00.000-08:00'
description: 'Segue os códigos em 3 arquivos comentados, utilizando PDO no PHP para tal façanha'
main-class: 'web'
tags:
- PHP
---

Salve salve rapaziada, como o próprio título diz, segue os códigos em 3 arquivos comentados, utilizando PDO no PHP para tal façanha, eu iria fazer um vídeo-tutorial, mas no final todo mundo pede pra disponibilizar o código então segue-os em 3 arquivos.

> __index.php__ , __classe.php__ e __Conexao.class.php__


## index.php

{% highlight php %}
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="utf-8" />

  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame 
       Remove this if you use the .htaccess -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>Redimensionamento PHP</title>
  <meta name="description" content="" />
  <meta name="author" content="marcos" />

  <meta name="viewport" content="width=device-width; initial-scale=1.0" />

  <!-- Replace favicon.ico & apple-touch-icon.jpg in the root of your domain and delete these references -->
  <link rel="shortcut icon" href="/favicon.ico" />
  <link rel="apple-touch-icon" href="/apple-touch-icon.jpg" />
  <link rel="stylesheet" media="screen" type="text/css" href="estilo.css" />
</head>

<body>
  <div>
    <header>
      <h4>Redimensionamento e Marca D'Agua de Imagens</h4>
    </header>
    <nav>
    	<form action="" method="post" enctype="multipart/form-data">    		
    		<input type="file" name="img" class="img" /><br />   	
    		<b>Marca D'Agua: </b><input type="checkbox" name="marca" checked="checked"/><br />	
    		<input type="submit" name="enviar" class="enviar" /><br />    		
    	</form>
    	<br />
    	<a href="./"><button>Atualizar Página</button></a>
    	<br /><br />
    	<div id="mensagens">
<?php
  /* incluimos a classe que contem os métodos de redimensionamento, marca dagua e gravar no banco */ 	  
  require_once ('classe.php');
  /* Instanciamos a classe */
  $redimensionar = new Redimensionar();
  /* após clicar no botao enviar */
  if(isset($_POST['enviar'])){
  	  /* se não houver imagem carregada setamos o método adequado */	  
	  if($_FILES['img']['name'] == FALSE){	  	
	  	$redimensionar->exibe(); 
	  }else{
	  	/* atribuimos valores as variaveis necessárias*/	  	
	  	$nome = $_FILES['img']['name'];
		$img = $_FILES['img'];
		$nome = $img['name'];
		$tmp = $img['tmp_name'];
		$type = $img['type'];
		/* Para tratamento de erros */
		try{
			/* se o checkbox estiver marcado pra pôr marca dagua, passamos a informação*/
			if(isset($_POST['marca']) == TRUE){
				$marca = $_POST['marca'];
				$redimensionar->redimensiona($tmp, $nome, '400',$type,$marca);
			}else{
				/* caso o checkbox esteja desmarcado */
				$redimensionar->redimensiona($tmp, $nome, '400',$type);
			}				
		}catch(PDOException $e){
			echo $e->get_Message();		  
		}

		
	  }	  
  }  
?>
     </div>

<div id="imgz">
	<h4>Imagens já cadastradas</h4>
	<?php
	/* lista as imagens que já estão cadastradas, se já houver */
	$conn = $redimensionar->meth;
	$sqlConn = "SELECT * FROM `img` ORDER BY `id` DESC";
	$qryConn = $conn->prepare($sqlConn);
	$qryConn->execute();
	while($l = $qryConn->fetch()){
		echo '<b><img src="uploads/'.$l['arquivo'].'" /><br />'.$l['arquivo']; 
	}
	?>
</div>
    </nav>

    <footer>
     <p>marcospinguim.blogspot.com</p>
    </footer>
  </div>
</body>
</html>
{% endhighlight %}

***

## classe.php
{% highlight php %}
<?php
    /* servirá pra incluir o arquivo Conexao.class.php, se houvessem vários com *.class.php, 
	 * incluiria todos sem precisar fazer 1 por 1 */
	function __autoload($class){
		require_once $class.'.class'.'.php';
	}
	
	/* Classe se chama Redimensionar, porém fará mais que isso */
  class Redimensionar {
  	/* propriedades da classe */
    public $permitido = array('image/jpg', 'image/jpeg', 'image/png');
	public $meth;
	public $nm;
    /* carregará automaticamente a conexao, ao instancia a classe e armazenará na propriedade $meth */
	function __construct(){
		/* já incluida pelo autoload, instaciamos e armazenamos em meth */
		$Conexao = new Conexao();	
		$this->meth = $Conexao->conectar();
	}
	/* caso a imagem não seja caregada */
  	function exibe(){  		
			echo '<script type="text/javascript">alert("Informe a imagem");</script>';		
  	}
	
	/* Método responsável pelo redimensionamento */
	function redimensiona($tmp, $nome, $largura,$type,$marca=FALSE){
		/* se a extensão não estiver entre as permitidas da propriedade $permitido, não entrará nesse bloco */
		if(in_array($type, $this->permitido)){
			/* além de criar a pasta devemos chamar o nome dela */
			$pasta='uploads';
			/* se for jpg, JPG, jpeg ou JPEG, usaremos a função: imagecreatefromjpeg() */
			if((strtolower(substr($nome, -4)) == '.jpg') || strtolower(substr($nome, -5)) == '.jpeg'){						
				$img = imagecreatefromjpeg($tmp);
				$ext = 'jpg';
				/* damos o nome sem mexer na extensão */
				if((substr($nome, -5) == '.jpeg') || substr($nome, -5) == '.JPEG'){
					$nome = 'mp'.str_shuffle(substr(base64_encode($nome), 0, 10)).rand(0,888).substr($nome, -5);
				}else{
					$nome = 'mp'.str_shuffle(substr(base64_encode($nome), 0, 10)).rand(0,888).substr($nome, -4);
				}
				/* se for png ou PNG, usaremos a função: imagecreatefrompng() */
			}elseif((strtolower(substr($nome, -4)) == '.jpg')){
				$img = imagecreatefrompng($tmp);
				$ext = 'png';
				$nome = 'mp'.str_shuffle(substr(base64_encode($nome), 0, 10)).rand(0,888).substr($nome, -4);
			}				
			/* pegamos as dimensões da imagem carregada do X e Y */
	        $x      = imagesx($img);
	        $y      = imagesy($img);
			/* definimos a nova altura, baseada no produto da larguraNova pela larguraVelha dividida pela alturaVelha */
	        $altura = ($largura * $y) / $x;
			/* criamos a nova imagem baseada nesses dados */
	        $nova   = imagecreatetruecolor($largura, $altura);
			/* bool imagecopyresampled ( resource $dst_image , resource $src_image , int $dst_x , int $dst_y , 
			 * int $src_x , int $src_y , int $dst_w , int $dst_h , int $src_w , int $src_h ) */
	        imagecopyresampled($nova, $img, 0, 0, 0, 0, $largura, $altura, $x, $y);
			/* mesma coisa se for jpg ou png usaremos funções diferentes */
			if($ext == 'jpg'){
				if(imagejpeg($nova, "$pasta/$nome")){
					echo "Redimensionada com sucesso!<br />";
				}
			}elseif($ext == 'png'){
				if(imagepng($nova, "$pasta/$nome")){
					echo "Redimensionada com sucesso!<br />";
				}
			}
			/* se o checkbox marca dagua foi marcado, chamaremos o método para inserir a marca dagua */
			if($marca == TRUE){
				$this->marca($nova, $nome, $pasta, $img, $ext);
				/* se não, só gravamos no banco e destruimos a imagem velha e nova */
			}else{
				$this->gravar($nome);
		        imagedestroy($nova);
		        imagedestroy($img);			
			}
			/* caso seja enviado um arquivo com extensão diferente das permitidas */			
		}else{
			echo "Tipo não permitido.";
		}
	}
	/* inserir marca dagua */
	function marca($nova, $nome, $pasta, $img, $ext){
		/* criamos a imagem baseada numa imagem com a marca */
	  $marca = imagecreatefrompng('marca.jpg');
      $marcax   = imagesx($marca);
      $marcay   = imagesy($marca);
      imagecopyresampled($nova, $marca, 0, 0, 0, 0, 232, 47, $marcax, $marcay);
	  /* se anova imagem for jpg ou png, novamente definiremos as funçoes */
	  if($ext == 'png'){
	      if(imagepng($nova, "$pasta/$nome")){
	      	echo "Marca D'agua inserida com sucesso";
	      }	  	
	  }
	  
	  if($ext == 'jpg'){
	      if(imagejpeg($nova, "$pasta/$nome")){
	      	echo "Marca D'agua inserida com sucesso";
	      }	  	
	  }
	  /* armazenamos o nome na propriedade $nm e depois mandamos gravar no banco, pois ainda não gravamos, só seria gravado
	   * se não pedisse marca dagua também */
	  $this->nm = $nome;
      $this->gravar($nome);
	  /* depois disso destruimos */
      imagedestroy($nova);
	  imagedestroy($img);
	}
	/* gravamos na tabela do mysql para recuperamos dinamicamento o nome */
	function gravar($nome){
		$metodo = $this->meth;
		$sql = "INSERT INTO `img` SET `arquivo`=?";
		$query = $metodo->prepare($sql);
		if($query->execute(array($nome))){
			echo "<br />Gravado no banco com sucesso!";
		}
		
	}

  }
?>
{% endhighlight %}

***

## Conexao.class.php

{% highlight php %}
<?php
  /* Criando uma conexão com o banco de dados */
  class Conexao{
  	private $dns;
	private $usr;
	private $psw;
	private $pdo;
	
  	function conectar(){
  		if(is_null($this->pdo)){
	  		$this->dns = 'mysql:host=127.0.0.1;dbname=imagens';
			$this->usr = '';
			$this->psw = '';
			$this->pdo = new PDO($this->dns,$this->usr,$this->psw);  			
  		}
		return $this->pdo;

    }
  }
?>

{% endhighlight %}

## É isso aê e até a próxima!
