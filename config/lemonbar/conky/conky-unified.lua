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

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
-- helper

-- vim: ts=4 sw=4 noet ai cindent syntax=lua-- global

helper = {}

-- constant

helper.alphaValue = 'aa'

colorPresetDark = {
  icon       = colBlack,
  label      = colGrey300,
  value      = colWhite,
  underline  = colWhite,
  background = colBlue800
}

colorPresetBright = {
  icon       = colWhite,
  label      = colPink800,
  value      = colBlack,
  underline  = colBlack,
  background = colBlue200
}

helper.count = 0
colorPreset = colorPresetDark

-- lemonade

function helper.alpha(color)
  alphaValue = helper.alphaValue

  color = string.sub(color, 3)
  color = '\\#' .. alphaValue .. color

  return color
end

function helper.lemonized(tag, color)
  return '%{' .. tag .. color .. '}'
end

function helper.lemonForeground(color)
  return '%{F' .. color .. '}'
end

function helper.lemonBackground(color)
  return '%{B' .. color .. '}'
end

function helper.lemonBackgroundAlpha(color)
  return '%{B' .. helper.alpha(color) .. '}'
end

function helper.lemonUnderline(color)
  return '%{U' .. color .. '}'
end

function helper.lemonReset()
  return '%{B-}%{F-}%{-u}'
end

-- ----- -----

function helper.icon(text, color)
  color = color or colorPreset.icon
  return ' ' .. helper.lemonForeground(color) .. text .. ' '
end

function helper.label(text, color)
  color = color or colorPreset.label
  return helper.lemonForeground(color) .. text
end

function helper.separator(color)
  color = color or colorPreset.separator
  return helper.lemonForeground(color) .. '|'
end

function helper.value(text, color)
  color = color or colorPreset.value
  return helper.lemonForeground(color) .. text
end

-- ----- -----

function helper.common(icon, label, value)
  text = ''

  if icon  then text = text
    .. helper.icon(icon, colorPreset.icon)
  end

  if label then text = text
    .. ' ' .. helper.label(label, colorPreset.label)
  end

  if value then text = text
    .. ' ' .. helper.value(value, colorPreset.value) .. ' '
  end

  return text
end

function helper.compose(icon, label, value, colorBg)
  colorBg = colorBg or colorPreset.background

  if (helper.count % 2) == 0 then
    colorPreset = colorPresetDark
  else
    colorPreset = colorPresetBright
  end

  text = helper.lemonBackgroundAlpha(colorBg)
  text = text .. helper.lemonUnderline(colorPreset.underline)
  text = text .. helper.common(icon, label, value)
  text ='%{+u}' ..  text .. '%{-u}' .. helper.lemonReset()

  helper.count = helper.count + 1

  return text
end

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
-- parts

--[[
You may consider change glyph using FontAwesome icon
http://fontawesome.io/cheatsheet/

* Sample: Battery Icon: 
]]

parts = {}

-- user variables
local wlandev = 'wlp0s3f3u2'

-- shortcut
local _h = helper

-- template variables: Color Indicator
local color_indicator_dark = {
  good      = colBlack,
  degraded  = colRed900,
  bad       = colRed500
}

local color_indicator_bright = {
  good      = colGrey300,
  degraded  = colRed700,
  bad       = colRed900
}

local ci = color_indicator_bright

-- Separator

function parts.separator(colorBgSt, colorBgNd, colorFg)
  text = '%{+u}'
  text = text .. _h.lemonForeground(colorFg)
  text = text .. _h.lemonBackgroundAlpha(colorBgSt)

  if (helper.count % 2) == 0 then
    colorUnderline = colBlack
  else
    colorUnderline = colWhite
  end

  text = text .. _h.lemonUnderline(colorUnderline)
  text = text .. ''

  text = text .. _h.lemonBackgroundAlpha(colorBgNd)

  if (helper.count % 2) == 0 then
    colorUnderline = colWhite
  else
    colorUnderline = colBlack
  end

  text = text .. _h.lemonUnderline(colorUnderline)
  text = text .. ''
  text = text .. '%{-u}'

  return text
end

-- Time
function parts.time(colorBg)

  return _h.compose('', nil, '${time %H:%M }', colorBg)
end

-- Date
function parts.date(colorBg)

  return _h.compose('', nil, '${time %D}', colorBg)
end

-- Volume
function parts.volume(colorBg)

  local volume_command = [[amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/']]
  return _h.compose('', 'Vol', "${execi 1 " .. volume_command .. "}", colorBg)
end

-- Host
function parts.host(colorBg)

  return _h.compose('', 'Host', '$nodename', colorBg)
end

-- Uptime
function parts.uptime(colorBg)

  return _h.compose('', 'Uptime', '$uptime', colorBg)
end

-- Memory
function parts.mem(colorBg)

  return _h.compose('', 'RAM', '$mem/$memmax', colorBg)
end

-- SSID
function parts.ssid(colorBg)

  return _h.compose(' ', '', '$wireless_essid', colorBg)
end


-- Lua Function Demo
-- https://github.com/brndnmtthws/conky/issues/62

function _h.exec(command)
    local file = assert(io.popen(command, 'r'))
    local s = file:read('*all')
    file:close()

    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')

    return s
end

-- read once
local machine = _h.exec('uname -r')

function parts.machine(colorBg)

  return _h.compose('', nil, machine, colorBg)
end

-- Media Player Daemon
function parts.mpd(colorBg)

  local mpd = [[\
${if_mpd_playing}\
]] .. _h.icon('')
.. _h.value(' ${mpd_artist 20} ')
.. _h.icon('')
.. _h.value(' ${mpd_title 30}') ..[[
${else}]] .. _h.icon('') .. [[${endif}\
]]

  return _h.compose(nil, nil, mpd, colorBg)
end

-- CPU temperature:
function parts.cputemp(colorBg)
  local cputemp = [[\
${if_match ${acpitemp}<45}\
]] .. _h.value('${acpitemp}°C', ci.good) .. [[
${else}${if_match ${acpitemp}<55}\
]] .. _h.value('${acpitemp}°C', ci.degraded) .. [[
${else}${if_match ${acpitemp}>=55}\
]] .. _h.value('${acpitemp}°C', ci.bad) .. [[
${endif}${endif}${endif}\
]]

  return _h.compose('', 'CPU', cputemp, colorBg)
end

-- Network
function parts.network(colorBg)

  local download = _h.icon('') .. [[\
${if_match ${downspeedf ]] .. wlandev .. [[}<1000}\
]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.good) .. [[
${else}${if_match ${downspeedf ]] .. wlandev .. [[}<3000}\
]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.degraded) .. [[
${else}${if_match ${downspeedf ]] .. wlandev .. [[}>=3000}\
]] .. _h.value('${downspeed ' .. wlandev .. '}', ci.bad) .. [[
${endif}${endif}${endif}\
]]

  local upload = _h.icon('') .. [[\
${if_match ${upspeedf ]] .. wlandev .. [[}<300}\
]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.good) .. [[
${else}${if_match ${upspeedf ]] .. wlandev .. [[}<800}\
]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.degraded) .. [[
${else}${if_match ${upspeedf ]] .. wlandev .. [[}>=800}\
]] .. _h.value('${upspeed ' .. wlandev .. '}', ci.bad) .. [[
${endif}${endif}${endif}\
]]

  return _h.compose(nil, nil, download .. upload, colorBg)
end

-- Memory
function parts.memory(colorBg)

  local memory = [[\
${if_match ${memperc}<30}\
]] .. _h.value('${memeasyfree}', ci.good) .. [[
${else}${if_match ${memperc}<70}\
]] .. _h.value('${memeasyfree}',ci.degraded) .. [[
${else}${if_match ${memperc}>=70}\
]] .. _h.value('${memeasyfree}', ci.bad) .. [[
${endif}${endif}${endif}\
]]

  return _h.compose('', 'MEM', memory, colorBg)
end

-- CPU 0
function parts.cpu0(colorBg)

 local cpu0 = [[\
${if_match ${cpu cpu0}<50}\
]] .. _h.value('${cpu cpu0}%', ci.good) .. [[
${else}${if_match ${cpu cpu0}<60}\
]] .. _h.value('${cpu cpu0}%',ci.degraded) .. [[
${else}${if_match ${cpu cpu0}<=100}\
]] .. _h.value('${cpu cpu0}%', ci.bad) .. [[
${endif}${endif}${endif}\
]]

  return _h.compose('', 'CPU', cpu0, colorBg)
end

-- Battery
function parts.battery(colorBg)

  local battery = [[\
${if_match ${battery_percent}<30}\
]] .. _h.value('${battery_percent}%', ci.bad) .. [[
${else}${if_match ${battery_percent}<70}\
]] .. _h.value('${battery_percent}%', ci.degraded) .. [[
${else}${if_match ${battery_percent}>=70}\
]] .. _h.value('${battery_percent}%', ci.good) .. [[
${endif}${endif}${endif}\
]]

  return _h.compose('', 'Battery', battery, colorBg)
end

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
-- assembly

--[[
disabled = ''
-- .. parts.host      (colBlue400)
-- .. parts.volume    (colBlue300)
-- .. parts.separator (colBlue300, colGreen400, colBlue500)
-- .. parts.battery   (colBlue400)
-- .. parts.mem       (colBlue400)
-- .. parts.ssid      (colBlue400)
-- .. parts.network   (colBlue400)
-- .. parts.mpd       (colBlue400)
-- .. parts.date      (colBlue400)
-- .. parts.time      (colBlue400)
-- .. parts.machine   (colBlue400)
]]


enabled = ''

   .. parts.uptime    (colGreen400)
   .. parts.separator (colGreen400, colBlue500, colGreen200)
   .. parts.cpu0      (colBlue500)
   .. parts.separator (colBlue500, colGreen500, colBlue300)
   .. parts.cputemp   (colGreen500)
   .. parts.separator (colGreen500, colBlue400, colGreen300)
   .. parts.memory    (colBlue400)

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
-- main

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
