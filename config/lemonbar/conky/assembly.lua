-- vim: ts=4 sw=4 noet ai cindent syntax=lua

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
