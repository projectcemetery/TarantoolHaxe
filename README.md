# TarantoolHaxe
Haxe bindings for tarantool and more

# Install. WORKS ONLY IN LINUX OR MAC OS X
1. Install tarantool https://tarantool.org/en/download.html
2. Install haxe http://haxe.org/download/
3. Install haxe packages: tink_url
4. Install TarantoolHaxe: haxelib git TarantoolHaxe https://github.com/RapidFingers/TarantoolHaxe
5. Install luarocks with linux or mac osx packet manager
6. Install luarocks packages: bit32, lrexlib-pcre
7. Install VSCode https://code.visualstudio.com
8. In VSCode install Haxe Extension Pack

# Usage

1. Launch VSCode
2. Initialize haxe project
3. Fix build.hx in that way:
-cp src
-lib TarantoolHaxe
-dce full
-main <YourMainClass>
-lua out/main.lua
4. Write code

# Examples

https://github.com/RapidFingers/TarantoolHaxeExamples
