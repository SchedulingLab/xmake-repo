package("lqp")
    set_homepage("https://github.com/SchedulingLab/lqp")
    set_description("Linear and Quadratic Problem Model")
    set_license("MIT")

    set_urls("https://github.com/SchedulingLab/lqp/archive/refs/tags/v$(version).tar.gz")

    add_versions("0.2.1", "8c61b384e3173249005dbd4c9da2f5a97fea3bbb32679c4cb5fca5f0719f2689")

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
        ]]}, {configs = {languages = "cxx17"}}))
    end)
