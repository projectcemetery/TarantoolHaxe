# TarantoolHaxe
Haxe bindings for tarantool and more

# WARNING. WORK IN PROGRESS. 
# A lot of things may not work.
# No documentation

# Install. WORKS ONLY IN LINUX OR MAC OS X
1. Install tarantool https://tarantool.org/en/download.html
2. Install haxe http://haxe.org/download/
3. Install haxe packages: tink_url, TarantoolHaxe
4. Install luarocks with linux or mac osx packet manager
5. Install luarocks packages: bit32, lrexlib-pcre
6. Install VSCode https://code.visualstudio.com
7. In VSCode install Haxe Extension Pack

# Usage

1. Launch VSCode
2. Initialize haxe project
3. Fix build.hx in that way:  
-cp src  
-lib TarantoolHaxe  
-dce full  
-main YourMainClass  
-lua out/main.lua  
4. Write code
5. Launch: tarantool ./out/main.lua
6. Write issue :)

# Examples

https://github.com/RapidFingers/TarantoolHaxeExamples
