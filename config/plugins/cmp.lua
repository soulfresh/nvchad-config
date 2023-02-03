local present, cmp = pcall(require, "cmp")

if not present then
  print('Failed to load cmp')
  return
end

local copilotPresent, copilot = pcall(require, "copilot.suggestion")

if not copilotPresent then
  print('Failed to load copilot')
  return
end

local M = {}

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- local cmp = require("cmp")
-- local luasnip = require("luasnip")

M = {
  mapping = {
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = nil,
    ["<Tab>"] = cmp.mapping(function(fallback)
      if require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      elseif copilot.is_visible() then
        if cmp.visible() then
          cmp.close()
        end
        copilot.accept()
      elseif has_words_before() then
        cmp.complete()
      -- else
      --   fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      -- elseif luasnip.jumpable(-1) then
      --   luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif copilot.is_visible() then
        copilot.next()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif copilot.is_visible() then
        copilot.prev()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- My old version
    -- ["<C-Space>"] = cmp.mapping(function()
    --   if cmp.visible() then
    --     cmp.close()
    --   else
    --     cmp.complete()
    --   end
    -- end, {"i", "s"}),
    ["<C-Space>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      elseif copilot.is_visible() then
        copilot.dismiss()
      else
        cmp.complete()
      -- else
      --   fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}

return M
