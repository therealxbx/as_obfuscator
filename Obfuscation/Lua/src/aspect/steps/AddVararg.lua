-- This Script is Part of the Aspect Obfuscator by Levno_710
--
-- AddVararg.lua
--
-- This Script provides a Simple Obfuscation Step that wraps the entire Script into a function

local Step = require("aspect.step");
local Ast = require("aspect.ast");
local visitast = require("aspect.visitast");
local AstKind = Ast.AstKind;

local AddVararg = Step:extend();
AddVararg.Description = "This Step Adds Vararg to all Functions";
AddVararg.Name = "Add Vararg";

AddVararg.SettingsDescriptor = {
}

function AddVararg:init(settings)
	
end

function AddVararg:apply(ast)
	visitast(ast, nil, function(node)
        if node.kind == AstKind.FunctionDeclaration or node.kind == AstKind.LocalFunctionDeclaration or node.kind == AstKind.FunctionLiteralExpression then
            if #node.args < 1 or node.args[#node.args].kind ~= AstKind.VarargExpression then
                node.args[#node.args + 1] = Ast.VarargExpression();
            end
        end
    end)
end

return AddVararg;