-- This Script is Part of the Aspect Obfuscator by Levno_710
--
-- namegenerators/mangled.lua
--
-- This Script provides a function for generation of simple up counting names but with hex numbers

local PREFIX = "_";

return function(id, scope)
	return PREFIX .. tostring(id);
end