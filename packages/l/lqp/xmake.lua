package("lqp")
    set_homepage("https://github.com/SchedulingLab/lqp")
    set_description("Linear and Quadratic Problem Model")
    set_license("MIT")

    set_urls("https://github.com/SchedulingLab/lqp/archive/refs/tags/v$(version).tar.gz")

    add_versions("0.1", "d29b62977464646a6537e33289b35957e175390d895c89f05124e7949ae8b643")

    add_deps("glpk")

    on_install("windows", "linux", function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <lqp/Problem.h>
            int main() {
              lqp::Problem problem;
              return 0;
            }
        ]]}))
    end)
