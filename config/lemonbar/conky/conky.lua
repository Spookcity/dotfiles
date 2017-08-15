-- vim: ts=4 sw=4 noet ai cindent syntax=lua

--[[
Conky, a system monitor, based on torsmo
]]

conky.config = {
    out_to_x = false,
    out_to_console = true,
    short_units = true,
    update_interval = 1
}

--[[
Prepare
]]

local dirname  = debug.getinfo(1).source:match("@?(.*/)")
dofile(dirname .. 'gmc.lua')
dofile(dirname .. 'helper.lua')
dofile(dirname .. 'parts.lua')
dofile(dirname .. 'assembly.lua')

-- shortcut
local _h = helper
lf = helper.lemonForeground
lb = helper.lemonBackground
la = helper.lemonBackgroundAlpha
lu = helper.lemonUnderline
lr = helper.lemonReset

conky.text = [[\
%{r}\
]] .. lr() .. lf(colRed500) .. [[  \
%{l}\
]] .. lr() .. lf(colRed500) .. [[  \
%{c}\
]] .. lr() .. lf(colGreen300) .. [[\
]] .. enabled
   .. lr() .. lf(colBlue400) .. [[\
]]
