# What is it?
Triplets/Toolchain for building vcpkg libraries on Windows using LLVM :^)

# How to use it?
Place the contents of this repository inside `VCPKG_ROOT/triplets`
- ## IMPORTANT
	The path to LLVM's bin directory is currently hardcoded inside `windows-llvm-toolchain.cmake` to `C:/Program Files/LLVM/bin` - make sure you change it in case your LLVM toolchain is installed somewhere else.