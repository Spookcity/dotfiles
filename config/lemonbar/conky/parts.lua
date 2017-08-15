-- vim: ts=4 sw=4 noet ai cindent syntax=lua

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

-- Template
--parts.template = [[
--]] .. _h.separator() .. [[,
--]] .. _h.icon('') .. [[,
--]] .. _h.label('') .. [[,
--]] .. _h.value('', '#aaaaaa') .. [[
--]]
