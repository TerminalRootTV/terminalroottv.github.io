---
layout: post
title: "Faça Testes Unitários e Benchmark para C++ Moderno com Catch2"
date: 2023-10-19 14:03:00
image: '/assets/img/cpp/catch2.jpg'
description: 'A facilidade de uso e o fato de não precisar de dependências externas o difere dos demais!'
icon: 'ion:terminal-sharp'
iconname: 'C++'
tags:
- cpp
- tdd
- benchmark
---

![{{ page.title }}]({{ page.image }} '{{ page.description }}')

---

# O que é Catch2?
**Catch2** é um framework de Testes Unitários para [C++](https://terminalroot.com.br/cpp), mas também fornece recursos básicos de micro-benchmarking e macros *BDD* simples.

A principal vantagem do **Catch2** é que seu uso é simples e natural. Os nomes dos testes não precisam ser identificadores válidos, as asserções parecem expressões booleanas normais do [C++](https://terminalroot.com.br/tags#cpp) e as seções fornecem uma maneira agradável e local de compartilhar código de configuração e desmontagem em testes.

É [mais uma opção](https://github.com/catchorg/Catch2/blob/devel/docs/why-catch.md#top) ao Google Test, Boost.Test, CppUnit, Cute e entre outros.

---

# Instalação
Para compilar e instalar no seu sistema rode os comandos abaixo:
{% highlight bash %}
git clone https://github.com/catchorg/Catch2
cd Catch2
cmake -B build .
cd build
make
{% endhighlight %}

<details>
 <summary>Clique aqui ver os locais que os arquivos são instalados</summary>

{% highlight txt %}
[ 98%] Built target Catch2
[100%] Built target Catch2WithMain
Install the project...
-- Install configuration: ""
-- Installing: /usr/local/lib64/cmake/Catch2/Catch2Config.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/Catch2ConfigVersion.cmake
-- Installing: /usr/local/share/doc/Catch2
-- Installing: /usr/local/share/doc/Catch2/reporter-events.md
-- Installing: /usr/local/share/doc/Catch2/deprecations.md
-- Installing: /usr/local/share/doc/Catch2/comparing-floating-point-numbers.md
-- Installing: /usr/local/share/doc/Catch2/migrate-v2-to-v3.md
-- Installing: /usr/local/share/doc/Catch2/reporters.md
-- Installing: /usr/local/share/doc/Catch2/event-listeners.md
-- Installing: /usr/local/share/doc/Catch2/list-of-examples.md
-- Installing: /usr/local/share/doc/Catch2/usage-tips.md
-- Installing: /usr/local/share/doc/Catch2/contributing.md
-- Installing: /usr/local/share/doc/Catch2/faq.md
-- Installing: /usr/local/share/doc/Catch2/cmake-integration.md
-- Installing: /usr/local/share/doc/Catch2/logging.md
-- Installing: /usr/local/share/doc/Catch2/tutorial.md
-- Installing: /usr/local/share/doc/Catch2/own-main.md
-- Installing: /usr/local/share/doc/Catch2/limitations.md
-- Installing: /usr/local/share/doc/Catch2/test-cases-and-sections.md
-- Installing: /usr/local/share/doc/Catch2/opensource-users.md
-- Installing: /usr/local/share/doc/Catch2/other-macros.md
-- Installing: /usr/local/share/doc/Catch2/tostring.md
-- Installing: /usr/local/share/doc/Catch2/release-notes.md
-- Installing: /usr/local/share/doc/Catch2/skipping-passing-failing.md
-- Installing: /usr/local/share/doc/Catch2/matchers.md
-- Installing: /usr/local/share/doc/Catch2/release-process.md
-- Installing: /usr/local/share/doc/Catch2/command-line.md
-- Installing: /usr/local/share/doc/Catch2/test-fixtures.md
-- Installing: /usr/local/share/doc/Catch2/ci-and-misc.md
-- Installing: /usr/local/share/doc/Catch2/configuration.md
-- Installing: /usr/local/share/doc/Catch2/Readme.md
-- Installing: /usr/local/share/doc/Catch2/benchmarks.md
-- Installing: /usr/local/share/doc/Catch2/why-catch.md
-- Installing: /usr/local/share/doc/Catch2/generators.md
-- Installing: /usr/local/share/doc/Catch2/assertions.md
-- Installing: /usr/local/share/doc/Catch2/commercial-users.md
-- Installing: /usr/local/lib64/cmake/Catch2/ParseAndAddCatchTests.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/Catch.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/CatchAddTests.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/CatchShardTests.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/CatchShardTestsImpl.cmake
-- Installing: /usr/local/share/Catch2/gdbinit
-- Installing: /usr/local/share/Catch2/lldbinit
-- Installing: /usr/local/share/pkgconfig/catch2.pc
-- Installing: /usr/local/share/pkgconfig/catch2-with-main.pc
-- Installing: /usr/local/lib64/libCatch2.a
-- Installing: /usr/local/lib64/libCatch2Main.a
-- Installing: /usr/local/lib64/cmake/Catch2/Catch2Targets.cmake
-- Installing: /usr/local/lib64/cmake/Catch2/Catch2Targets-noconfig.cmake
-- Installing: /usr/local/include/catch2
-- Installing: /usr/local/include/catch2/catch_get_random_seed.hpp
-- Installing: /usr/local/include/catch2/catch_all.hpp
-- Installing: /usr/local/include/catch2/catch_test_macros.hpp
-- Installing: /usr/local/include/catch2/catch_config.hpp
-- Installing: /usr/local/include/catch2/catch_assertion_info.hpp
-- Installing: /usr/local/include/catch2/catch_section_info.hpp
-- Installing: /usr/local/include/catch2/catch_session.hpp
-- Installing: /usr/local/include/catch2/benchmark
-- Installing: /usr/local/include/catch2/benchmark/detail
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_stats.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_estimate_clock.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_benchmark_stats_fwd.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_benchmark_function.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_complete_invoke.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_repeat.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_run_for_at_least.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_timing.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_analyse.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_measure.hpp
-- Installing: /usr/local/include/catch2/benchmark/detail/catch_benchmark_stats.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_sample_analysis.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_constructor.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_optimizer.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_outlier_classification.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_execution_plan.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_benchmark_all.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_clock.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_estimate.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_environment.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_benchmark.hpp
-- Installing: /usr/local/include/catch2/benchmark/catch_chronometer.hpp
-- Installing: /usr/local/include/catch2/catch_version.hpp
-- Installing: /usr/local/include/catch2/catch_translate_exception.hpp
-- Installing: /usr/local/include/catch2/matchers
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_contains.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_templated.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_all.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_quantifiers.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_exception.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_string.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_vector.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_range_equals.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_container_properties.hpp
-- Installing: /usr/local/include/catch2/matchers/internal
-- Installing: /usr/local/include/catch2/matchers/internal/catch_matchers_impl.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_floating_point.hpp
-- Installing: /usr/local/include/catch2/matchers/catch_matchers_predicate.hpp
-- Installing: /usr/local/include/catch2/catch_message.hpp
-- Installing: /usr/local/include/catch2/catch_template_test_macros.hpp
-- Installing: /usr/local/include/catch2/generators
-- Installing: /usr/local/include/catch2/generators/catch_generators_range.hpp
-- Installing: /usr/local/include/catch2/generators/catch_generators_all.hpp
-- Installing: /usr/local/include/catch2/generators/catch_generators.hpp
-- Installing: /usr/local/include/catch2/generators/catch_generators_random.hpp
-- Installing: /usr/local/include/catch2/generators/catch_generators_adapters.hpp
-- Installing: /usr/local/include/catch2/generators/catch_generator_exception.hpp
-- Installing: /usr/local/include/catch2/catch_tag_alias.hpp
-- Installing: /usr/local/include/catch2/interfaces
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_config.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_tag_alias_registry.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_all.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_reporter_factory.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_testcase.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_exception.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_generatortracker.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_registry_hub.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_enum_values_registry.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_test_invoker.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_capture.hpp
-- Installing: /usr/local/include/catch2/interfaces/catch_interfaces_reporter.hpp
-- Installing: /usr/local/include/catch2/catch_test_case_info.hpp
-- Installing: /usr/local/include/catch2/catch_totals.hpp
-- Installing: /usr/local/include/catch2/catch_test_spec.hpp
-- Installing: /usr/local/include/catch2/catch_version_macros.hpp
-- Installing: /usr/local/include/catch2/catch_tag_alias_autoregistrar.hpp
-- Installing: /usr/local/include/catch2/catch_approx.hpp
-- Installing: /usr/local/include/catch2/internal
-- Installing: /usr/local/include/catch2/internal/catch_lazy_expr.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_failure_exception.hpp
-- Installing: /usr/local/include/catch2/internal/catch_polyfills.hpp
-- Installing: /usr/local/include/catch2/internal/catch_to_string.hpp
-- Installing: /usr/local/include/catch2/internal/catch_errno_guard.hpp
-- Installing: /usr/local/include/catch2/internal/catch_singletons.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_prefix_messages.hpp
-- Installing: /usr/local/include/catch2/internal/catch_istream.hpp
-- Installing: /usr/local/include/catch2/internal/catch_debug_console.hpp
-- Installing: /usr/local/include/catch2/internal/catch_console_width.hpp
-- Installing: /usr/local/include/catch2/internal/catch_template_test_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_counter.hpp
-- Installing: /usr/local/include/catch2/internal/catch_reporter_spec_parser.hpp
-- Installing: /usr/local/include/catch2/internal/catch_meta.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_run_info.hpp
-- Installing: /usr/local/include/catch2/internal/catch_compare_traits.hpp
-- Installing: /usr/local/include/catch2/internal/catch_windows_h_proxy.hpp
-- Installing: /usr/local/include/catch2/internal/catch_result_type.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_case_registry_impl.hpp
-- Installing: /usr/local/include/catch2/internal/catch_enforce.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_uncaught_exceptions.hpp
-- Installing: /usr/local/include/catch2/internal/catch_random_seed_generation.hpp
-- Installing: /usr/local/include/catch2/internal/catch_textflow.hpp
-- Installing: /usr/local/include/catch2/internal/catch_wildcard_pattern.hpp
-- Installing: /usr/local/include/catch2/internal/catch_commandline.hpp
-- Installing: /usr/local/include/catch2/internal/catch_fatal_condition_handler.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_android_logwrite.hpp
-- Installing: /usr/local/include/catch2/internal/catch_sharding.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_macro_impl.hpp
-- Installing: /usr/local/include/catch2/internal/catch_noncopyable.hpp
-- Installing: /usr/local/include/catch2/internal/catch_reusable_string_stream.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_static_analysis_support.hpp
-- Installing: /usr/local/include/catch2/internal/catch_decomposer.hpp
-- Installing: /usr/local/include/catch2/internal/catch_case_insensitive_comparisons.hpp
-- Installing: /usr/local/include/catch2/internal/catch_stringref.hpp
-- Installing: /usr/local/include/catch2/internal/catch_preprocessor_internal_stringify.hpp
-- Installing: /usr/local/include/catch2/internal/catch_config_wchar.hpp
-- Installing: /usr/local/include/catch2/internal/catch_exception_translator_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_preprocessor.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_case_info_hasher.hpp
-- Installing: /usr/local/include/catch2/internal/catch_console_colour.hpp
-- Installing: /usr/local/include/catch2/internal/catch_output_redirect.hpp
-- Installing: /usr/local/include/catch2/internal/catch_floating_point_helpers.hpp
-- Installing: /usr/local/include/catch2/internal/catch_startup_exception_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_spec_parser.hpp
-- Installing: /usr/local/include/catch2/internal/catch_void_type.hpp
-- Installing: /usr/local/include/catch2/internal/catch_string_manip.hpp
-- Installing: /usr/local/include/catch2/internal/catch_compiler_capabilities.hpp
-- Installing: /usr/local/include/catch2/internal/catch_logical_traits.hpp
-- Installing: /usr/local/include/catch2/internal/catch_context.hpp
-- Installing: /usr/local/include/catch2/internal/catch_stream_end_stop.hpp
-- Installing: /usr/local/include/catch2/internal/catch_preprocessor_remove_parens.hpp
-- Installing: /usr/local/include/catch2/internal/catch_unique_name.hpp
-- Installing: /usr/local/include/catch2/internal/catch_reporter_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_run_context.hpp
-- Installing: /usr/local/include/catch2/internal/catch_tag_alias_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_debugger.hpp
-- Installing: /usr/local/include/catch2/internal/catch_optional.hpp
-- Installing: /usr/local/include/catch2/internal/catch_container_nonmembers.hpp
-- Installing: /usr/local/include/catch2/internal/catch_platform.hpp
-- Installing: /usr/local/include/catch2/internal/catch_random_number_generator.hpp
-- Installing: /usr/local/include/catch2/internal/catch_uncaught_exceptions.hpp
-- Installing: /usr/local/include/catch2/internal/catch_getenv.hpp
-- Installing: /usr/local/include/catch2/internal/catch_enum_values_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_source_line_info.hpp
-- Installing: /usr/local/include/catch2/internal/catch_is_permutation.hpp
-- Installing: /usr/local/include/catch2/internal/catch_section.hpp
-- Installing: /usr/local/include/catch2/internal/catch_xmlwriter.hpp
-- Installing: /usr/local/include/catch2/internal/catch_message_info.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_case_tracker.hpp
-- Installing: /usr/local/include/catch2/internal/catch_case_sensitive.hpp
-- Installing: /usr/local/include/catch2/internal/catch_list.hpp
-- Installing: /usr/local/include/catch2/internal/catch_test_registry.hpp
-- Installing: /usr/local/include/catch2/internal/catch_unique_ptr.hpp
-- Installing: /usr/local/include/catch2/internal/catch_move_and_forward.hpp
-- Installing: /usr/local/include/catch2/internal/catch_parse_numbers.hpp
-- Installing: /usr/local/include/catch2/internal/catch_clara.hpp
-- Installing: /usr/local/include/catch2/internal/catch_assertion_handler.hpp
-- Installing: /usr/local/include/catch2/internal/catch_stdstreams.hpp
-- Installing: /usr/local/include/catch2/internal/catch_leak_detector.hpp
-- Installing: /usr/local/include/catch2/catch_tostring.hpp
-- Installing: /usr/local/include/catch2/catch_assertion_result.hpp
-- Installing: /usr/local/include/catch2/reporters
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_console.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_common_base.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_xml.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_event_listener.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_junit.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_cumulative_base.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_registrars.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_tap.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_automake.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_helpers.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_streaming_base.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_compact.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_multi.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_sonarqube.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporters_all.hpp
-- Installing: /usr/local/include/catch2/reporters/catch_reporter_teamcity.hpp
-- Installing: /usr/local/include/catch2/catch_timer.hpp
-- Up-to-date: /usr/local/include/catch2
-- Installing: /usr/local/include/catch2/catch_user_config.hpp

{% endhighlight %}

</details>


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

# Exemplo de uso

Crie um arquivo de exemplo: `vim example.cpp`:
{% highlight cpp %}
#include <catch2/catch_test_macros.hpp>

int example(const int& z){
  return 10 / z;
}

TEST_CASE( "Divisão por: 1, 2, ZERO e 10", "[example]" ) {
    REQUIRE(example(1));
    REQUIRE(example(2));
    REQUIRE(example(0));
    REQUIRE(example(10));
}
{% endhighlight %}

Para compilar via linha de comando:
{% highlight bash %}
g++ example.cpp -lCatch2Main -lCatch2
{% endhighlight %}

Possível saída após executar o binário:
{% highlight bash %}
$ ./a.out 
Randomness seeded to: 2691063100

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
a.out is a Catch2 v3.4.0 host application.
Run with -? for options

-------------------------------------------------------------------------------
Divisão por: 1, 2, ZERO e 10
-------------------------------------------------------------------------------
example.cpp:7
...............................................................................

example.cpp:7: FAILED:
  {Unknown expression after the reported line}
due to a fatal error condition:
  SIGFPE - Floating point error signal

===============================================================================
test cases: 1 | 1 failed
assertions: 3 | 2 passed | 1 failed

Exceção de ponto flutuante
{% endhighlight %}

---

# Opções
No próprio binário que você incluiu o teste é possível usar uma lista de parâmetros.

Rode:
{% highlight bash %}
./a.out -?
{% endhighlight %}

Uma saída resumida dos parâmetros:
{% highlight bash %}
Catch2 v3.4.0
usage:
  a.out [<test name|pattern|tags> ... ] options

where options are:
  -?, -h, --help                            display usage information
  -s, --success                             include successful tests in
                                            output
  -b, --break                               break into debugger on failure
  -e, --nothrow                             skip exception tests
  -i, --invisibles                          show invisibles (tabs, newlines)
  -o, --out <filename>                      default output filename
  -r, --reporter <name[::key=value]*>       reporter to use (defaults to
                                            console)
  -n, --name <name>                         suite name
  -a, --abort                               abort at first failure
  -x, --abortx <no. failures>               abort after x failures
  -w, --warn <warning name>                 enable warnings
  -d, --durations <yes|no>                  show test durations
  -D, --min-duration <seconds>              show test durations for tests
                                            taking at least the given number
                                            of seconds
  -f, --input-file <filename>               load test names to run from a
                                            file

...
{% endhighlight %}

Para mais informações acesse:
+ [Tutorial](https://github.com/catchorg/Catch2/blob/devel/docs/tutorial.md#top)
+ [Documentação](https://github.com/catchorg/Catch2/blob/devel/docs/migrate-v2-to-v3.md#top)
+ [Detalhes para linha de comando](https://github.com/catchorg/Catch2/blob/devel/docs/command-line.md#top)
+ [Repositório oficial](https://github.com/catchorg/Catch2)


