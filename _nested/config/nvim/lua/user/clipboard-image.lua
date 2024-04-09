-- Images should be in the file's directory in img, e.g.
--
-- - The file lives in /home/blag/23/foo.md.
-- - File's parent is /home/blag/23/.
-- - Image should be at /home/blag/23/img/<timestamp>.
-- - Link should be ![](img/<timestamp>)

local function _img_dir()
  local result = vim.fn.expand('%:p:~:.:h') .. "/img"
  assert(vim.fn.mkdir(result, "p"), "error creating directory " .. result)
  return result
end

require'clipboard-image'.setup {
  default = {
    img_dir = _img_dir,
    img_dir_txt = 'img',
    img_name = function() return os.date('%m-%d_%H-%M-%S') end,
    affix = "<\n  %s\n>" -- Multi lines affix
  },
}

