---
layout: post
title: "Conheça esse docking moderno para JavaFX"
date: 2026-05-06 08:57:15
image: '/assets/img/java/the-snapfx.png'
description: "☕ Monte layouts estilo IDE em JavaFX sem limitações e sem gambiarras."
icon: 'ion:terminal-sharp'
iconname: 'Java'
tags:
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

O **SnapFX** é um **framework de docking para JavaFX**, focado em criar interfaces flexíveis no estilo:

* IntelliJ / VS Code
* IDEs em geral
* ferramentas com múltiplos painéis

Leve e moderno, pensado para layouts dinâmicos e organizados, sem você ter que reinventar drag & drop de janelas.

---

## Instalação
Via [Gradle](https://terminalroot.com.br/2023/05/como-utilizar-o-gradle.html)

{% highlight bash %}
implementation("org.snapfx:snapfx-core:<version>")
{% endhighlight %}

Construa:

{% highlight bash %}
git clone https://github.com/Beowolve/SnapFX.git
./gradlew publishToMavenLocal
{% endhighlight %}

Exemplo Simples:
{% highlight java %}
import org.snapfx.SnapFX;
import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.TextArea;
import javafx.stage.Stage;

public class SimpleDemo extends Application {
    @Override
    public void start(Stage stage) {
        SnapFX snapFX = new SnapFX();

        // Dock nodes
        snapFX.dock(new TextArea("Editor 1"), "Editor");
        snapFX.dock(new TextArea("Console"), "Console");

        // Build layout
        Scene scene = new Scene(snapFX.buildLayout(), 800, 600);

        stage.setScene(scene);
        snapFX.initialize(stage);
        // Optional: switch theme at runtime via named catalog entry
        // snapFX.setThemeStylesheet(SnapFX.getAvailableThemeStylesheets().get("Dark"));
        stage.show();
    }
}
{% endhighlight %}

---

Para mais informações acesse o [repositório](https://github.com/Beowolve/SnapFX).

---

## [Aprenda Java](https://terminalroot.com.br/java)
### <https://terminalroot.com.br/java>


