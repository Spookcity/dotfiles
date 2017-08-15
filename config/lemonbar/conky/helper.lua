-- vim: ts=4 sw=4 noet ai cindent syntax=lua-- global

helper = {}

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
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

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---
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

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---

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

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ---

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
