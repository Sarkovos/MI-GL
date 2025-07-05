cmake_minimum_required(VERSION 3.26.0)
project(OpenGLLearning VERSION 1.0.0)
cmake_policy(SET CMP0072 NEW)

# If you have custom Find modules under cmake/
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Locate system packages
find_package(OpenGL REQUIRED)
find_package(glfw3 REQUIRED)

# Define our executable and its source files
add_executable(OpenGLLearning
    src/main.cpp
    src/glad.c
    src/stb_image.cpp 
)

# Include headers from dependencies/ and your src/ folder
target_include_directories(OpenGLLearning
    PRIVATE
        dependencies
        src
)

# Link against GLFW and OpenGL
target_link_libraries(OpenGLLearning
    PRIVATE
        ${GLFW3_LIBRARY}
        OpenGL::GL
)
add_custom_command(TARGET OpenGLLearning POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_SOURCE_DIR}/assets
            $<TARGET_FILE_DIR:OpenGLLearning>/assets)

# After building the target, copy shaders into the executable's directory
add_custom_command(TARGET OpenGLLearning POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/src/shader.vs
        $<TARGET_FILE_DIR:OpenGLLearning>/shader.vs
    COMMAND ${CMAKE_COMMAND} -E copy
        ${CMAKE_SOURCE_DIR}/src/shader.fs
        $<TARGET_FILE_DIR:OpenGLLearning>/shader.fs
    COMMENT "Copying shader.vs and shader.fs into output directory"
    
)
