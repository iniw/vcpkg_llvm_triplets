# most of this is stolen from the default windows toolchain :)
if(NOT _VCPKG_WINDOWS_TOOLCHAIN)
set(_VCPKG_WINDOWS_TOOLCHAIN 1)

set(CMAKE_SYSTEM_NAME Windows CACHE STRING "")

if(VCPKG_TARGET_ARCHITECTURE STREQUAL "x86")
    set(CMAKE_SYSTEM_PROCESSOR x86 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "x64")
    set(CMAKE_SYSTEM_PROCESSOR AMD64 CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm")
    set(CMAKE_SYSTEM_PROCESSOR ARM CACHE STRING "")
elseif(VCPKG_TARGET_ARCHITECTURE STREQUAL "arm64")
    set(CMAKE_SYSTEM_PROCESSOR ARM64 CACHE STRING "")
endif()

if(DEFINED VCPKG_CMAKE_SYSTEM_VERSION)
    set(CMAKE_SYSTEM_VERSION "${VCPKG_CMAKE_SYSTEM_VERSION}" CACHE STRING "" FORCE)
endif()

if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")
    if(CMAKE_SYSTEM_PROCESSOR STREQUAL CMAKE_HOST_SYSTEM_PROCESSOR)
        set(CMAKE_CROSSCOMPILING OFF CACHE STRING "")
    elseif(CMAKE_SYSTEM_PROCESSOR STREQUAL "x86")
        # any of the four platforms can run x86 binaries
        set(CMAKE_CROSSCOMPILING OFF CACHE STRING "")
    elseif(CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL "ARM64")
        # arm64 can run binaries of any of the four platforms after Windows 11
        set(CMAKE_CROSSCOMPILING OFF CACHE STRING "")
    endif()

    if(NOT DEFINED CMAKE_SYSTEM_VERSION)
        set(CMAKE_SYSTEM_VERSION "${CMAKE_HOST_SYSTEM_VERSION}" CACHE STRING "")
    endif()
endif()

# IMPORTANT - set this to the right thing!!!
set(LLVM_BIN "C:/Program Files/LLVM/bin")

set(CMAKE_C_COMPILER "${LLVM_BIN}/clang.exe" CACHE STRING "" FORCE)
set(CMAKE_CXX_COMPILER "${LLVM_BIN}/clang++.exe" CACHE STRING "" FORCE)
set(CMAKE_LINKER "${LLVM_BIN}/lld-link.exe" CACHE STRING "" FORCE)
set(CMAKE_AR "${LLVM_BIN}/llvm-ar.exe" CACHE STRING "" FORCE)
set(CMAKE_RC_COMPILER "${LLVM_BIN}/llvm-rc.exe" CACHE STRING "" FORCE)
set(CMAKE_C_COMPILER_RANLIB "${LLVM_BIN}/llvm-ranlib.exe" CACHE STRING "" FORCE)
set(CMAKE_NM "${LLVM_BIN}/llvm-nm.exe" CACHE STRING "" FORCE)
set(CMAKE_OBJCOPY "${LLVM_BIN}/llvm-objcopy.exe" CACHE STRING "" FORCE)
set(CMAKE_OBJDUMP "${LLVM_BIN}/llvm-objdump.exe" CACHE STRING "" FORCE)
set(CMAKE_STRIP "${LLVM_BIN}/llvm-strip.exe" CACHE STRING "" FORCE)

get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(NOT _CMAKE_IN_TRY_COMPILE)

# clang will take care of defining all of the important windows stuff for us
# things like '-D_DLL', '-D_WIN32', '-D_MT', '--dependent-lib' will all get set automatically
# if you want to build with clang-cl you'll have to set all of those by hand. not very cool.

set(CMAKE_C_FLAGS "" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_DEBUG "-O0 -g -gcodeview" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELEASE "-O3 -DNDEBUG -Xclang" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_MINSIZEREL "-Os -DNDEBUG -Xclang" CACHE STRING "" FORCE)
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g -DNDEBUG -gcodeview -Xclang" CACHE STRING "" FORCE)

set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_MINSIZEREL "${CMAKE_C_FLAGS_MINSIZEREL}" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO}" CACHE STRING "" FORCE)

endif()
endif()