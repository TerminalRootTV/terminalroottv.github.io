---
layout: post
title: "Crie Logs com SpdLog C++"
date: 2023-07-19 21:38:25
image: '/assets/img/cpp/spdlog.jpg'
description: 'Uma biblioteca C++ veloz e útil para log dos seus softwares!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- cppdaily
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

Se você deseja deixar os logs dos seus software LIKE A PRO, então **SpdLog** é a melhor opção!

É uma biblioteca [C++](https://terminalroot.com.br/tags#cpp) rápida e completa para criar logs.

---

# Instalação
Ela já está disponível no repositório da maioria dos sistemas operacionais, então para instalá-la basta usar o gerenciador de pacotes correspondente à seu caso:
+ vcpkg: `vcpkg install spdlog`
+ conan: `spdlog/[>=1.4.1]`
+ Homebrew: `brew install spdlog`
+ MacPorts: `sudo port install spdlog`
+ Debian: `sudo apt install libspdlog-dev`
+ FreeBSD: `pkg install spdlog`
+ Fedora: `dnf install spdlog`
+ Gentoo: `emerge dev-libs/spdlog`
+ Arch Linux: `pacman -S spdlog`
+ openSUSE: `sudo zypper in spdlog-devel`
+ conda: `conda install -c conda-forge spdlog`
+ build2: depends: `spdlog ^1.8.2`

Mas, se quiser compilar e instalar manualmente, rode os comandos abaixo:
> Lembrando que você precisa ter a [libfmt](https://terminalroot.com.br/2021/12/utilizando-a-fmtlib-para-saidas-formatadas-em-cpp.html) instalada, pois a SpdLog usa ela como dependência!

{% highlight bash %}
git clone https://github.com/gabime/spdlog
cd spdlog
cmake -B build .
cd build && make -j
sudo make install
cd ../..
rm -rf spdlog
{% endhighlight %}

# README.md

<details>
 <summary>Clique aqui para ver os locais de instalação</summary>

```bash
[ 80%] Built target spdlog
[100%] Built target example
Install the project...
-- Install configuration: "Release"
-- Up-to-date: /usr/local/include
-- Installing: /usr/local/include/spdlog
-- Installing: /usr/local/include/spdlog/fmt
-- Installing: /usr/local/include/spdlog/fmt/fmt.h
-- Installing: /usr/local/include/spdlog/fmt/xchar.h
-- Installing: /usr/local/include/spdlog/fmt/ostr.h
-- Installing: /usr/local/include/spdlog/fmt/chrono.h
-- Installing: /usr/local/include/spdlog/fmt/std.h
-- Installing: /usr/local/include/spdlog/fmt/compile.h
-- Installing: /usr/local/include/spdlog/fmt/ranges.h
-- Installing: /usr/local/include/spdlog/fmt/bin_to_hex.h
-- Installing: /usr/local/include/spdlog/spdlog-inl.h
-- Installing: /usr/local/include/spdlog/stopwatch.h
-- Installing: /usr/local/include/spdlog/cfg
-- Installing: /usr/local/include/spdlog/cfg/helpers-inl.h
-- Installing: /usr/local/include/spdlog/cfg/argv.h
-- Installing: /usr/local/include/spdlog/cfg/env.h
-- Installing: /usr/local/include/spdlog/cfg/helpers.h
-- Installing: /usr/local/include/spdlog/async.h
-- Installing: /usr/local/include/spdlog/logger.h
-- Installing: /usr/local/include/spdlog/sinks
-- Installing: /usr/local/include/spdlog/sinks/callback_sink.h
-- Installing: /usr/local/include/spdlog/sinks/ansicolor_sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/wincolor_sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/base_sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/tcp_sink.h
-- Installing: /usr/local/include/spdlog/sinks/syslog_sink.h
-- Installing: /usr/local/include/spdlog/sinks/systemd_sink.h
-- Installing: /usr/local/include/spdlog/sinks/dup_filter_sink.h
-- Installing: /usr/local/include/spdlog/sinks/sink.h
-- Installing: /usr/local/include/spdlog/sinks/mongo_sink.h
-- Installing: /usr/local/include/spdlog/sinks/null_sink.h
-- Installing: /usr/local/include/spdlog/sinks/stdout_sinks-inl.h
-- Installing: /usr/local/include/spdlog/sinks/stdout_color_sinks-inl.h
-- Installing: /usr/local/include/spdlog/sinks/qt_sinks.h
-- Installing: /usr/local/include/spdlog/sinks/daily_file_sink.h
-- Installing: /usr/local/include/spdlog/sinks/ansicolor_sink.h
-- Installing: /usr/local/include/spdlog/sinks/stdout_sinks.h
-- Installing: /usr/local/include/spdlog/sinks/stdout_color_sinks.h
-- Installing: /usr/local/include/spdlog/sinks/ostream_sink.h
-- Installing: /usr/local/include/spdlog/sinks/kafka_sink.h
-- Installing: /usr/local/include/spdlog/sinks/basic_file_sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/basic_file_sink.h
-- Installing: /usr/local/include/spdlog/sinks/base_sink.h
-- Installing: /usr/local/include/spdlog/sinks/hourly_file_sink.h
-- Installing: /usr/local/include/spdlog/sinks/dist_sink.h
-- Installing: /usr/local/include/spdlog/sinks/android_sink.h
-- Installing: /usr/local/include/spdlog/sinks/wincolor_sink.h
-- Installing: /usr/local/include/spdlog/sinks/win_eventlog_sink.h
-- Installing: /usr/local/include/spdlog/sinks/rotating_file_sink-inl.h
-- Installing: /usr/local/include/spdlog/sinks/udp_sink.h
-- Installing: /usr/local/include/spdlog/sinks/ringbuffer_sink.h
-- Installing: /usr/local/include/spdlog/sinks/msvc_sink.h
-- Installing: /usr/local/include/spdlog/sinks/rotating_file_sink.h
-- Installing: /usr/local/include/spdlog/async_logger-inl.h
-- Installing: /usr/local/include/spdlog/pattern_formatter-inl.h
-- Installing: /usr/local/include/spdlog/common-inl.h
-- Installing: /usr/local/include/spdlog/details
-- Installing: /usr/local/include/spdlog/details/os-inl.h
-- Installing: /usr/local/include/spdlog/details/thread_pool-inl.h
-- Installing: /usr/local/include/spdlog/details/backtracer-inl.h
-- Installing: /usr/local/include/spdlog/details/console_globals.h
-- Installing: /usr/local/include/spdlog/details/log_msg-inl.h
-- Installing: /usr/local/include/spdlog/details/thread_pool.h
-- Installing: /usr/local/include/spdlog/details/periodic_worker.h
-- Installing: /usr/local/include/spdlog/details/log_msg.h
-- Installing: /usr/local/include/spdlog/details/backtracer.h
-- Installing: /usr/local/include/spdlog/details/registry.h
-- Installing: /usr/local/include/spdlog/details/windows_include.h
-- Installing: /usr/local/include/spdlog/details/tcp_client-windows.h
-- Installing: /usr/local/include/spdlog/details/periodic_worker-inl.h
-- Installing: /usr/local/include/spdlog/details/os.h
-- Installing: /usr/local/include/spdlog/details/file_helper-inl.h
-- Installing: /usr/local/include/spdlog/details/circular_q.h
-- Installing: /usr/local/include/spdlog/details/udp_client-windows.h
-- Installing: /usr/local/include/spdlog/details/registry-inl.h
-- Installing: /usr/local/include/spdlog/details/log_msg_buffer-inl.h
-- Installing: /usr/local/include/spdlog/details/file_helper.h
-- Installing: /usr/local/include/spdlog/details/udp_client.h
-- Installing: /usr/local/include/spdlog/details/tcp_client.h
-- Installing: /usr/local/include/spdlog/details/mpmc_blocking_q.h
-- Installing: /usr/local/include/spdlog/details/log_msg_buffer.h
-- Installing: /usr/local/include/spdlog/details/null_mutex.h
-- Installing: /usr/local/include/spdlog/details/synchronous_factory.h
-- Installing: /usr/local/include/spdlog/details/fmt_helper.h
-- Installing: /usr/local/include/spdlog/async_logger.h
-- Installing: /usr/local/include/spdlog/spdlog.h
-- Installing: /usr/local/include/spdlog/common.h
-- Installing: /usr/local/include/spdlog/version.h
-- Installing: /usr/local/include/spdlog/fwd.h
-- Installing: /usr/local/include/spdlog/pattern_formatter.h
-- Installing: /usr/local/include/spdlog/tweakme.h
-- Installing: /usr/local/include/spdlog/logger-inl.h
-- Installing: /usr/local/include/spdlog/formatter.h
-- Installing: /usr/local/lib64/libspdlog.a
-- Installing: /usr/local/include/spdlog/fmt/bundled/
-- Installing: /usr/local/include/spdlog/fmt/bundled//xchar.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//color.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//printf.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//ostream.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//chrono.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//core.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//args.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//std.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//compile.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//ranges.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//format.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//os.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//locale.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//format-inl.h
-- Installing: /usr/local/include/spdlog/fmt/bundled//fmt.license.rst
-- Installing: /usr/local/lib64/pkgconfig/spdlog.pc
-- Installing: /usr/local/lib64/cmake/spdlog/spdlogConfigTargets.cmake
-- Installing: /usr/local/lib64/cmake/spdlog/spdlogConfigTargets-release.cmake
-- Installing: /usr/local/lib64/cmake/spdlog/spdlogConfig.cmake
-- Installing: /usr/local/lib64/cmake/spdlog/spdlogConfigVersion.cmake
```

</details>



---

# Utilizando
O uso dela pode ser aplicado em diversas situações, a forma mais básica é o exemplo abaixo:
> `main.cpp`

{% highlight cpp %}
#include "spdlog/spdlog.h"

int main(){
 spdlog::info("Welcome to spdlog!");
 spdlog::error("Some error message with arg: {}", 1);
 
 spdlog::warn("Easy padding in numbers like {:08d}", 12);
 spdlog::critical("Support for int: {0:d};  hex: {0:x};  oct: {0:o}; bin: {0:b}", 42);
 spdlog::info("Support for floats {:03.2f}", 1.23456);
 spdlog::info("Positional args are {1} {0}..", "too", "supported");
 spdlog::info("{:<30}", "left aligned");
 
 spdlog::set_level(spdlog::level::debug); // Set global log level to debug
 spdlog::debug("This message should be displayed..");    
 
 // change log pattern
 spdlog::set_pattern("[%H:%M:%S %z] [%n] [%^---%L---%$] [thread %t] %v");
 
 // Compile time log levels
 // define SPDLOG_ACTIVE_LEVEL to desired level
 SPDLOG_TRACE("Some trace message with param {}", 42);
 SPDLOG_DEBUG("Some debug message");
}

{% endhighlight %}

Para compilar rode sem flags adicionais:
{% highlight cpp %}
g++ main.cpp
./a.out
{% endhighlight %}

Para mais informações acesse o [repositório](https://github.com/gabime/spdlog).



