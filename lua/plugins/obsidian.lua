require("obsidian").setup({
  new_notes_location = "current_dir",
  workspaces = {
    {
      name = "lrm",
      path = "~/obsidian/lrm",
    }
  },
  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "5_journal",
    -- Optional, if you want to change the date format for the ID of daily notes.
    -- date_format = "%Y-%m-%d",
    date_format = "%Y/%m-%B/%Y-%m-%d-%A",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    -- alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    -- default_tags = { "daily-notes" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "templates/journal_template.md"
  },
  wiki_link_func = function(opts)
    if opts.id == nil then
      return string.format("[[%s]]", opts.label)
    elseif opts.label ~= opts.id then
      return string.format("[[%s|%s]]", opts.id, opts.label)
    else
      return string.format("[[%s]]", opts.id)
    end
  end,
  completion = {
    nvim_cmp = true,
    --trigger compl at 2 char
    min_chars = 2,
    -- new_notes_location = "current_dir",
    -- prepend_note_id = true,
  },
  mappings = {
    -- "obsidian follow"
    ["<leader>of"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- toggle check-boxes "obsidian done"
    ["<leader>od"] = {
      action = function()
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  note_frontmatter_func = function(note)
    -- equiv to default frontmatter fn
    local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }
    -- note.metadata contains any manually added fields in the frontmatter
    -- so here we just make sure theose fields are kept in frontmatter
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
    tags = "",
  }
})
