package("lqp")
    set_homepage("https://github.com/SchedulingLab/lqp")
    set_description("Linear and Quadratic Problem Model")
    set_license("MIT")

    set_urls("https://github.com/SchedulingLab/lqp/archive/refs/tags/v$(version).tar.gz")

    add_versions("0.1.1", "2d83ee6bafd84a55a24e9128b6621b3624ab11aa5355b77f9a682d57afacc23d")

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
        ]]}, {configs = {languages = "cxx17"}))
    end)
