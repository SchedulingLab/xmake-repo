package("sched")
    set_homepage("https://github.com/SchedulingLab/libsched")
    set_description("C++17 library for playing with scheduling problems")
    set_license("GPL-3.0")

    set_urls("https://github.com/SchedulingLab/libsched.git")

    add_versions("2024.02.06", "d9dc96b875078e8e8da762f2cffe40037e68f3aa")

    add_deps("lqp", "fmt", "nlohmann_json")

    on_install("windows", "linux", function (package)
        import("package.tools.xmake").install(package)
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
            #include <sched/tools/Log.h>
            int main() {
              sched::Log::println("Hello World!");
              return 0;
            }
        ]]}, {configs = {languages = "cxx17"}}))
    end)
