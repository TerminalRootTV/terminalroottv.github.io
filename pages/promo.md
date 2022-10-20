---
layout: page
title: "Pacote Promocional com Todos os Cursos"
permalink: "/promo/"
image: '/assets/img/cursos/promo.jpg'
description: 'Adquira todos de C++ com Qt, OpenCV e Desenvolvimento de Games .'
color: '#5c3566'
---

![{{ page.title }}]({{ page.image }} "{{ page.description }}") 

## Comprar Pacote com os **5 Cursos de C++** . Os cursos são:
+ **Mais de 25 horas** de conteúdo .
+ **Mais de 200 recursos** para download .

> *Caso deseje mais detalhes sobre os cursos, clique no link de cada um.*

+ **❏ [Curso de C++ Moderno para Iniciantes](https://terminalroot.com.br/cpp/#iniciante)**
+ **❏ [Curso de C++ Moderno Avançado](https://terminalroot.com.br/cpp/#avancado)**
+ **❏ [Curso de Qt Moderno com C++](https://terminalroot.com.br/cpp/#qt)**
+ **❏ [Curso de OpenCV com C++](https://terminalroot.com.br/opencv)**
+ **❏ [Curso de Criação de Games com SFML e C++](https://terminalroot.com.br/games)**

### Se você somar o valor de cada curso separado seria: `79.90 + 159.90 + 149.90 + 69.90 + 149.90` e o resultado seria `609.50`.

### Mas com descontos dessa promoção fica tudo por somente `$RS 178,97` . Um baita de um desconto, você economiza mais de *400 reais* !!! 
> *Essa é uma promoção por tempo limitado*

<!--<a href="https://cutt.ly/CLCpp" class="btn btn-lg btn-success btn-block my-2 py-3">
  <i class="fas fa-graduation-cap"></i> Pacote Promocional com 5 Cursos C++
</a>-->

<div id="smart-button-container">
      <div style="text-align: center;">
        <div id="paypal-button-container"></div>
      </div>
    </div>
  <script src="https://www.paypal.com/sdk/js?client-id=sb&enable-funding=venmo&currency=BRL" data-sdk-integration-source="button-factory"></script>
  <script>
    function initPayPalButton() {
      paypal.Buttons({
        style: {
          shape: 'rect',
          color: 'gold',
          layout: 'horizontal',
          label: 'pay',
          tagline: true
        },

        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{"description":"Todos os Cursos de C++","amount":{"currency_code":"BRL","value":178.97}}]
          });
        },

        onApprove: function(data, actions) {
          return actions.order.capture().then(function(orderData) {
            
            // Full available details
            console.log('Capture result', orderData, JSON.stringify(orderData, null, 2));

            // Show a success message within this page, e.g.
            const element = document.getElementById('paypal-button-container');
            element.innerHTML = '';
            element.innerHTML = '<h3>Thank you for your payment!</h3>';

            // Or go to another URL:  actions.redirect('thank_you.html');
            
          });
        },

        onError: function(err) {
          console.log(err);
        }
      }).render('#paypal-button-container');
    }
    initPayPalButton();
  </script>

---


