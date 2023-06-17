project(external)

include(FetchContent)

FetchContent_Declare(
    mailio
    URL https://github.com/karastojko/mailio/archive/refs/tags/0.22.0.tar.gz
)

FetchContent_MakeAvailable(mailio)
