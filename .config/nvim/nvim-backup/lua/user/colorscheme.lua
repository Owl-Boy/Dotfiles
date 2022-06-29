--
--  ██████╗ ██████╗ ██╗      ██████╗ ██████╗ ███████╗ ██████╗██╗  ██╗███████╗███╗   ███╗███████╗
-- ██╔════╝██╔═══██╗██║     ██╔═══██╗██╔══██╗██╔════╝██╔════╝██║  ██║██╔════╝████╗ ████║██╔════╝
-- ██║     ██║   ██║██║     ██║   ██║██████╔╝███████╗██║     ███████║█████╗  ██╔████╔██║█████╗
-- ██║     ██║   ██║██║     ██║   ██║██╔══██╗╚════██║██║     ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
-- ╚██████╗╚██████╔╝███████╗╚██████╔╝██║  ██║███████║╚██████╗██║  ██║███████╗██║ ╚═╝ ██║███████╗
--  ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
--

local colorscheme = 'tokyonight'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end

--tokyonight settings
if colorscheme == 'tokyonight' then
  vim.g.tokyonight_style = 'night'
  vim.cmd [[colorscheme tokyonight]]
end
