cmake_minimum_required(VERSION 3.26.0)
project(OpenGLLearning VERSION 1.0.0)
cmake_policy(SET CMP0072 NEW)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)

add_executable(OpenGLLearning 
    src/main.cpp
    src/glad.c
)

target_include_directories(OpenGLLearning PRIVATE dependencies)
target_link_libraries(OpenGLLearning ${GLFW3_LIBRARY} OpenGL::GL)