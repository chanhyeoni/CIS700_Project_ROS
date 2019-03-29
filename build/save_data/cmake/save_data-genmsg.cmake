# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "save_data: 1 messages, 0 services")

set(MSG_I_FLAGS "-Isave_data:/home/ubuntu/catkin_ws/src/save_data/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(save_data_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_custom_target(_save_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "save_data" "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(save_data
  "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/save_data
)

### Generating Services

### Generating Module File
_generate_module_cpp(save_data
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/save_data
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(save_data_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(save_data_generate_messages save_data_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_dependencies(save_data_generate_messages_cpp _save_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(save_data_gencpp)
add_dependencies(save_data_gencpp save_data_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS save_data_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(save_data
  "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/save_data
)

### Generating Services

### Generating Module File
_generate_module_eus(save_data
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/save_data
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(save_data_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(save_data_generate_messages save_data_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_dependencies(save_data_generate_messages_eus _save_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(save_data_geneus)
add_dependencies(save_data_geneus save_data_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS save_data_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(save_data
  "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/save_data
)

### Generating Services

### Generating Module File
_generate_module_lisp(save_data
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/save_data
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(save_data_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(save_data_generate_messages save_data_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_dependencies(save_data_generate_messages_lisp _save_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(save_data_genlisp)
add_dependencies(save_data_genlisp save_data_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS save_data_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(save_data
  "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/save_data
)

### Generating Services

### Generating Module File
_generate_module_nodejs(save_data
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/save_data
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(save_data_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(save_data_generate_messages save_data_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_dependencies(save_data_generate_messages_nodejs _save_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(save_data_gennodejs)
add_dependencies(save_data_gennodejs save_data_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS save_data_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(save_data
  "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/save_data
)

### Generating Services

### Generating Module File
_generate_module_py(save_data
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/save_data
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(save_data_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(save_data_generate_messages save_data_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ubuntu/catkin_ws/src/save_data/msg/GPS.msg" NAME_WE)
add_dependencies(save_data_generate_messages_py _save_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(save_data_genpy)
add_dependencies(save_data_genpy save_data_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS save_data_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/save_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/save_data
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(save_data_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/save_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/save_data
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(save_data_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/save_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/save_data
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(save_data_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/save_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/save_data
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(save_data_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/save_data)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/save_data\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/save_data
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(save_data_generate_messages_py std_msgs_generate_messages_py)
endif()
