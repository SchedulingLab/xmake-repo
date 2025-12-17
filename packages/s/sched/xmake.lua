package("sched")
    set_homepage("https://github.com/SchedulingLab/libsched")
    set_description("C++23 library for playing with scheduling problems")
    set_license("GPL-3.0")

    set_urls("https://github.com/SchedulingLab/libsched.git")

    add_deps("lqp", "nlohmann_json")

    on_install("windows", "linux", function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <sched/support/Log.h>
            int main() {
              sched::Log::println("Hello World!");
              return 0;
            }
        ]]}, {configs = {languages = "cxx23"}}))
    end)
