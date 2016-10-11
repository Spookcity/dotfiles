--==============================================================================
--                                 conky_grey.lua
--
--  author  : SLK
--  version : v2011062101
--  license : Distributed under the terms of GNU GPL version 2 or later
--
--==============================================================================

require 'cairo'

--------------------------------------------------------------------------------
--                                                                    clock DATA
-- HOURS
clock_h = {
    {
    name='time',                   arg='%H',                    max_value=12,
    x=155,                         y=90,
    graph_radius=66,
    graph_thickness=5,
    graph_unit_angle=30,           graph_unit_thickness=30,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xFF6900,      graph_fg_alpha=0.5,
    txt_radius=22,
    txt_weight=0,                  txt_size=0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=1,
    graduation_radius=27,
    graduation_thickness=5,        graduation_mark_thickness=0,
    graduation_unit_angle=30,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    },
}
-- MINUTES
clock_m = {
    {
    name='time',                   arg='%M',                    max_value=60,
    x=155,                         y=90,
    graph_radius=73,
    graph_thickness=5,
    graph_unit_angle=6,            graph_unit_thickness=6,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x005DFF,      graph_fg_alpha=0.5,
    txt_radius=34,
    txt_weight=0,                  txt_size=0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=1,
    graduation_radius=59,
    graduation_thickness=7,        graduation_mark_thickness=3,
    graduation_unit_angle=30,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    },
}
-- SECONDS
clock_s = {
    {
    name='time',                   arg='%S',                    max_value=60,
    x=155,                         y=90,
    graph_radius=80,
    graph_thickness=5 ,
    graph_unit_angle=6,            graph_unit_thickness=6,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x00FF38,      graph_fg_alpha=0.5,
    txt_radius=0,
    txt_weight=0,                  txt_size=0,
    txt_fg_colour=0xFFFFFF,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=2,        graduation_mark_thickness=0,
    graduation_unit_angle=30,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    },
}

--------------------------------------------------------------------------------
--                                                                    gauge DATA
gauge = {
{
    name='cpu',                    arg='cpu1',                  max_value=100,
    x=40,                          y=162,
    graph_radius=34,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x0D00FF,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=34,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=2,        graduation_mark_thickness=0,
    graduation_unit_angle=30,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='cpu',                    arg='cpu2',                  max_value=100,
    x=40,                          y=162,
    graph_radius=22,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x00DEFF,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=22,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='memperc',                arg='',                      max_value=100,
    x=40,                          y=342,
    graph_radius=34,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x005C15,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=35,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=24,
    graduation_thickness=8,        graduation_mark_thickness=0,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.5,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.3,
},
{
    name='fs_used_perc',           arg='/',                     max_value=100,
    x=40,                          y=482,
    graph_radius=34,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xDB6F00,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=34,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='fs_used_perc',           arg='/home/',                max_value=100,
    x=40,                          y=482,
    graph_radius=22,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xFFEF00,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=22,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='downspeedf',           arg='eth0',                max_value=100,
    x=40,                          y=608,
    graph_radius=34,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xC61300,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=34,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='upspeedf',           arg='eth0',                max_value=100,
    x=40,                          y=608,
    graph_radius=22,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xFF3CC2,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=22,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='swapperc',           arg='',                max_value=100,
    x=40,                          y=342,
    graph_radius=22,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0x00FF38,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=22,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.0,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.5,
},
{
    name='downspeedf',           arg='wlan0',                max_value=100,
    x=40,                          y=695,
    graph_radius=34,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xC61300,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=34,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.5,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.6,
},
{
    name='upspeedf',           arg='wlan0',                max_value=100,
    x=40,                          y=695,
    graph_radius=22,
    graph_thickness=10,
    graph_start_angle=180,
    graph_unit_angle=2.7,          graph_unit_thickness=2.7,
    graph_bg_colour=0xffffff,      graph_bg_alpha=0.3,
    graph_fg_colour=0xFF3CC2,      graph_fg_alpha=0.5,
    hand_fg_colour=0xEF5A29,       hand_fg_alpha=0.0,
    txt_radius=22,
    txt_weight=0,                  txt_size=10,
    txt_fg_colour=0xffffff,        txt_fg_alpha=1,
    graduation_radius=28,
    graduation_thickness=0,        graduation_mark_thickness=1,
    graduation_unit_angle=27,
    graduation_fg_colour=0xFFFFFF, graduation_fg_alpha=0.3,
    caption='',
    caption_weight=1,              caption_size=8.5,
    caption_fg_colour=0xFFFFFF,    caption_fg_alpha=0.6,
},
}
-------------------------------------------------------------------------------
--                                                                 rgb_to_r_g_b
-- converts color in hexa to decimal
--
function rgb_to_r_g_b(colour, alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

-------------------------------------------------------------------------------
--                                                            angle_to_position
-- convert degree to rad and rotate (0 degree is top/north)
--
function angle_to_position(start_angle, current_angle)
    local pos = current_angle + start_angle
    return ( ( pos * (2 * math.pi / 360) ) - (math.pi / 2) )
end

-------------------------------------------------------------------------------
--                                                              draw_clock_ring
-- displays clock
--
function draw_clock_ring(display, data, value)
    local max_value = data['max_value']
    local x, y = data['x'], data['y']
    local graph_radius = data['graph_radius']
    local graph_thickness, graph_unit_thickness = data['graph_thickness'], data['graph_unit_thickness']
    local graph_unit_angle = data['graph_unit_angle']
    local graph_bg_colour, graph_bg_alpha = data['graph_bg_colour'], data['graph_bg_alpha']
    local graph_fg_colour, graph_fg_alpha = data['graph_fg_colour'], data['graph_fg_alpha']

    -- background ring
    cairo_arc(display, x, y, graph_radius, 0, 2 * math.pi)
    cairo_set_source_rgba(display, rgb_to_r_g_b(graph_bg_colour, graph_bg_alpha))
    cairo_set_line_width(display, graph_thickness)
    cairo_stroke(display)

    -- arc of value
    local val = (value % max_value)
    local i = 1
    while i <= val do
        cairo_arc(display, x, y, graph_radius,(  ((graph_unit_angle * i) - graph_unit_thickness)*(2*math.pi/360)  )-(math.pi/2),((graph_unit_angle * i) * (2*math.pi/360))-(math.pi/2))
        cairo_set_source_rgba(display,rgb_to_r_g_b(graph_fg_colour,graph_fg_alpha))
        cairo_stroke(display)
        i = i + 1
    end
    local angle = (graph_unit_angle * i) - graph_unit_thickness

    -- graduations marks
    local graduation_radius = data['graduation_radius']
    local graduation_thickness, graduation_mark_thickness = data['graduation_thickness'], data['graduation_mark_thickness']
    local graduation_unit_angle = data['graduation_unit_angle']
    local graduation_fg_colour, graduation_fg_alpha = data['graduation_fg_colour'], data['graduation_fg_alpha']
    if graduation_radius > 0 and graduation_thickness > 0 and graduation_unit_angle > 0 then
        local nb_graduation = 360 / graduation_unit_angle
        local i = 1
        while i <= nb_graduation do
            cairo_set_line_width(display, graduation_thickness)
            cairo_arc(display, x, y, graduation_radius, (((graduation_unit_angle * i)-(graduation_mark_thickness/2))*(2*math.pi/360))-(math.pi/2),(((graduation_unit_angle * i)+(graduation_mark_thickness/2))*(2*math.pi/360))-(math.pi/2))
            cairo_set_source_rgba(display,rgb_to_r_g_b(graduation_fg_colour,graduation_fg_alpha))
            cairo_stroke(display)
            cairo_set_line_width(display, graph_thickness)
            i = i + 1
        end
    end

    -- text
    local txt_radius = data['txt_radius']
    local txt_weight, txt_size = data['txt_weight'], data['txt_size']
    local txt_fg_colour, txt_fg_alpha = data['txt_fg_colour'], data['txt_fg_alpha']
    local movex = txt_radius * (math.cos((angle * 2 * math.pi / 360)-(math.pi/2)))
    local movey = txt_radius * (math.sin((angle * 2 * math.pi / 360)-(math.pi/2)))
    cairo_select_font_face (display, "ubuntu", CAIRO_FONT_SLANT_NORMAL, txt_weight);
    cairo_set_font_size (display, txt_size);
    cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_colour, txt_fg_alpha));
    cairo_move_to (display, x + movex - (txt_size / 2), y + movey + 3);
    cairo_show_text (display, value);
    cairo_stroke (display);
end

-------------------------------------------------------------------------------
--                                                              draw_gauge_ring
-- displays gauges
--
function draw_gauge_ring(display, data, value)
    local max_value = data['max_value']
    local x, y = data['x'], data['y']
    local graph_radius = data['graph_radius']
    local graph_thickness, graph_unit_thickness = data['graph_thickness'], data['graph_unit_thickness']
    local graph_start_angle = data['graph_start_angle']
    local graph_unit_angle = data['graph_unit_angle']
    local graph_bg_colour, graph_bg_alpha = data['graph_bg_colour'], data['graph_bg_alpha']
    local graph_fg_colour, graph_fg_alpha = data['graph_fg_colour'], data['graph_fg_alpha']
    local hand_fg_colour, hand_fg_alpha = data['hand_fg_colour'], data['hand_fg_alpha']
    local graph_end_angle = (max_value * graph_unit_angle) % 360

    -- background ring
    cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, 0), angle_to_position(graph_start_angle, graph_end_angle))
    cairo_set_source_rgba(display, rgb_to_r_g_b(graph_bg_colour, graph_bg_alpha))
    cairo_set_line_width(display, graph_thickness)
    cairo_stroke(display)

    -- arc of value
    local val = value % (max_value + 1)
    local start_arc = 0
    local stop_arc = 0
    local i = 1
    while i <= val do
        start_arc = (graph_unit_angle * i) - graph_unit_thickness
        stop_arc = (graph_unit_angle * i)
        cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
        cairo_set_source_rgba(display, rgb_to_r_g_b(graph_fg_colour, graph_fg_alpha))
        cairo_stroke(display)
        i = i + 1
    end
    local angle = start_arc

    -- hand
    start_arc = (graph_unit_angle * val) - (graph_unit_thickness * 2)
    stop_arc = (graph_unit_angle * val)
    cairo_arc(display, x, y, graph_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
    cairo_set_source_rgba(display, rgb_to_r_g_b(hand_fg_colour, hand_fg_alpha))
    cairo_stroke(display)

    -- graduations marks
    local graduation_radius = data['graduation_radius']
    local graduation_thickness, graduation_mark_thickness = data['graduation_thickness'], data['graduation_mark_thickness']
    local graduation_unit_angle = data['graduation_unit_angle']
    local graduation_fg_colour, graduation_fg_alpha = data['graduation_fg_colour'], data['graduation_fg_alpha']
    if graduation_radius > 0 and graduation_thickness > 0 and graduation_unit_angle > 0 then
        local nb_graduation = graph_end_angle / graduation_unit_angle
        local i = 0
        while i < nb_graduation do
            cairo_set_line_width(display, graduation_thickness)
            start_arc = (graduation_unit_angle * i) - (graduation_mark_thickness / 2)
            stop_arc = (graduation_unit_angle * i) + (graduation_mark_thickness / 2)
            cairo_arc(display, x, y, graduation_radius, angle_to_position(graph_start_angle, start_arc), angle_to_position(graph_start_angle, stop_arc))
            cairo_set_source_rgba(display,rgb_to_r_g_b(graduation_fg_colour,graduation_fg_alpha))
            cairo_stroke(display)
            cairo_set_line_width(display, graph_thickness)
            i = i + 1
        end
    end

    -- text
    local txt_radius = data['txt_radius']
    local txt_weight, txt_size = data['txt_weight'], data['txt_size']
    local txt_fg_colour, txt_fg_alpha = data['txt_fg_colour'], data['txt_fg_alpha']
    local movex = txt_radius * math.cos(angle_to_position(graph_start_angle, angle))
    local movey = txt_radius * math.sin(angle_to_position(graph_start_angle, angle))
    cairo_select_font_face (display, "ubuntu", CAIRO_FONT_SLANT_NORMAL, txt_weight)
    cairo_set_font_size (display, txt_size)
    cairo_set_source_rgba (display, rgb_to_r_g_b(txt_fg_colour, txt_fg_alpha))
    cairo_move_to (display, x + movex - (txt_size / 2), y + movey + 3)
    cairo_show_text (display, value)
    cairo_stroke (display)

    -- caption
    local caption = data['caption']
    local caption_weight, caption_size = data['caption_weight'], data['caption_size']
    local caption_fg_colour, caption_fg_alpha = data['caption_fg_colour'], data['caption_fg_alpha']
    local tox = graph_radius * (math.cos((graph_start_angle * 2 * math.pi / 360)-(math.pi/2)))
    local toy = graph_radius * (math.sin((graph_start_angle * 2 * math.pi / 360)-(math.pi/2)))
    cairo_select_font_face (display, "ubuntu", CAIRO_FONT_SLANT_NORMAL, caption_weight);
    cairo_set_font_size (display, caption_size)
    cairo_set_source_rgba (display, rgb_to_r_g_b(caption_fg_colour, caption_fg_alpha))
    cairo_move_to (display, x + tox + 5, y + toy + 1)
    -- bad hack but not enough time !
    if graph_start_angle < 105 then
        cairo_move_to (display, x + tox - 30, y + toy + 1)
    end
    cairo_show_text (display, caption)
    cairo_stroke (display)
end

-------------------------------------------------------------------------------
--                                                               go_clock_rings
-- loads data and displays clock
--
function go_clock_rings(display)
    local function load_clock_rings(display, data)
        local str, value = '', 0
        str = string.format('${%s %s}',data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)
        draw_clock_ring(display, data, value)
    end
    
    for i in pairs(clock_h) do
        load_clock_rings(display, clock_h[i])
    end
    for i in pairs(clock_m) do
        load_clock_rings(display, clock_m[i])
    end
    for i in pairs(clock_s) do
        load_clock_rings(display, clock_s[i])
    end
end

-------------------------------------------------------------------------------
--                                                               go_gauge_rings
-- loads data and displays gauges
--
function go_gauge_rings(display)
    local function load_gauge_rings(display, data)
        local str, value = '', 0
        str = string.format('${%s %s}',data['name'], data['arg'])
        str = conky_parse(str)
        value = tonumber(str)
        draw_gauge_ring(display, data, value)
    end
    
    for i in pairs(gauge) do
        load_gauge_rings(display, gauge[i])
    end
end
function pie_rings (xc, yc, r)

    pat = cairo_pattern_create_radial (xc, yc, 0.2*r, xc,  yc, r);
    cairo_pattern_add_color_stop_rgba (pat, 0.1, 1, 1, 1, 0);
    cairo_pattern_add_color_stop_rgba (pat, 1.0, 1, 1, 1, 0.3);
    cairo_set_source (cr, pat);
    cairo_arc (cr, xc, yc, r, 0, 2 * math.pi);
    cairo_fill (cr);
    cairo_pattern_destroy (pat);


    cairo_set_font_size (cr, 10)
    cairo_select_font_face (cr, "LCDMono",
                CAIRO_FONT_SLANT_NORMAL,
                CAIRO_FONT_WEIGHT_NORMAL)    
    cairo_set_line_width (cr, 2.0)

    -- Show total mem usage
    local str1 = conky_parse(string.format('${mem}'))
    local str2 = string.match(str1, "(%d+)")
    local str3 = string.match(str1, "(%a+)")

    cairo_set_source_rgba(cr, 1, 1, 1, 1)
    cairo_move_to (cr, xc-9, yc-1)
    cairo_show_text (cr, str2)
    cairo_move_to (cr, xc-9, yc+9)
    cairo_show_text (cr, str3)
    cairo_stroke(cr)

    -- Get top mem usage
    local str1 = conky_parse(string.format('${mem}'))
    local mem = tonumber(string.match(str1, "(%d+)"))
    local str1 = conky_parse(string.format('${memperc}'))
    local mempct = tonumber(string.match(str1, "(%d+)"))
    
    -- Draw pie
    local angle = -90
    local angle2 = 0
    local tro = 4        -- Text rotational offset (degrees)
    local maxprocesses = 7
    local maxstrlen = 8

    for process = 1, maxprocesses do

        cairo_save(cr)
    
        -- Get top process memory usage
        local str2 = conky_parse(string.format('${top_mem mem %i}', tonumber(process)))
        local mem_process = tonumber(str2)
        local procpct = mem_process / mempct
        angle2 = angle + (procpct*360)

        if angle2 > 260 then
            cairo_restore(cr)
            break
        end    

        -- Get top process name
        local str2 = conky_parse(string.format('${top_mem name %i} ', tonumber(process)))
        local index = string.find(str2,' ')
        
        if (index == nil) then
            cairo_restore(cr)
            break
        elseif (index > maxstrlen) then
            str2 = string.sub(str2, 0, maxstrlen)
        end

        -- Draw pie outline
        cairo_set_source_rgba(cr, 1, 1, 1, 0.2)        
        cairo_arc_negative (cr, xc, yc, 0.2*r, angle2*(math.pi/180), angle*(math.pi/180));            
        cairo_arc (cr, xc, yc, r, angle*(math.pi/180), angle2*(math.pi/180));    
--        cairo_close_path(cr)
        cairo_stroke(cr)

        -- Draw text
        cairo_set_source_rgba(cr, 1, 1, 1, 1)    
        cairo_move_to(cr, xc, yc)
        cairo_rotate(cr, (angle2-((angle2-angle)/2)+tro)*(math.pi/180))
--        cairo_show_text (cr, '    '..(procpct*100))
        if (index > maxstrlen) then
            cairo_show_text (cr, '      '..str2..'..')
        else
            cairo_show_text (cr, '      '..str2)
        end        

        angle = angle2 + 3

        cairo_stroke(cr)
        cairo_restore(cr)
    end

    if (angle < 264) then
        angle2 = 267
        cairo_set_source_rgba(cr, 1, 1, 1, 0.2)    
        cairo_arc_negative (cr, xc, yc, 0.2*r, angle2*(math.pi/180), angle*(math.pi/180));
        cairo_arc (cr, xc, yc, r, angle*(math.pi/180), angle2*(math.pi/180));    
--        cairo_close_path(cr)
        cairo_stroke(cr)
        
        if ((angle2 - angle) > 20) then
            cairo_set_source_rgba(cr, 1, 1, 1, 0.5)    
            cairo_move_to(cr, xc, yc)
            cairo_rotate(cr, (angle2-((angle2-angle)/2)+tro+2)*(math.pi/180))
            cairo_show_text (cr, '      '..'other')
            cairo_stroke(cr)
        end
    end
end
--[[ END PIE WIDGET ]]
-------------------------------------------------------------------------------
--                                                                         MAIN
function conky_main()
    if conky_window == nil then 
        return
    end

    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    local display = cairo_create(cs)
    
    local updates = conky_parse('${updates}')
    update_num = tonumber(updates)
    
    if update_num > 5 then
        go_clock_rings(display)
        go_gauge_rings(display)
    end
    
    cairo_surface_destroy(cs)
    cairo_destroy(display)
end
