
########### next target ###############

SET(universal_LIB_SRCS
   ScriptMgr.cpp
   ScriptMgr.h
   config.h
   system.cpp
   ScriptDev2/sc_default.cpp
   ScriptDev2/sc_defines.cpp
   ScriptDev2/sc_defines.h
)

add_library(universal SHARED ${universal_LIB_SRCS})

target_link_libraries(universal)

set_target_properties(universal PROPERTIES VERSION 4.2.0 SOVERSION 4)
install(TARGETS universal DESTINATION lib)
