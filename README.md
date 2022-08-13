# What is it?
Triplets/Toolchain for building vcpkg libraries on Windows using LLVM :^)

# How to use it?
Place the contents of this repository inside `VCPKG_ROOT/triplets`
- ## IMPORTANT
	The path to LLVM's bin directory is currently hardcoded inside `windows-llvm-toolchain.cmake` to `C:/Program Files/LLVM/bin` - make sure you change it in case your LLVM toolchain is installed somewhere else.

When installing a new vcpkg library pass your desired architecture and linkage to the windows-llvm triplet.
- For example, when targetting x86 and using static linkage you'd execute:  
  `vcpkg install {lib}:x86-windows-llvm-static`
- x64, dynamically linked:  
`vcpkg install {lib}:x64-windows-llvm`