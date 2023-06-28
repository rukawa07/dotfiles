local status, lualine = pcall(require, "orgmode")
if (not status) then return end

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/MyDrive/org/*'},
  org_default_notes_file = '~/MyDrive/org/main.org',
  org_todo_keywords = { 'TASK(t)', 'WAIT(w)', '|', 'DONE(d)', 'ABORT(a)', 'SOMEDAY(s)' },
  org_tag_alist = { 'PROJECT:p', 'MEMO:m', 'PETIT:t' },
  org_capture_templates = {
    t = { description = 'Task', template = '\n** TASK %?\n   CREATED: %U\n', headline = 'inbox'},
    i = { description = 'Idea', template = '\n** %?\n   CREATED: %U\n', headline = 'idea'},
  },
  org_refile_targets = { '~/MyDrive/org/' },
  org_log_done = 'time',
  org_clock_clocked_in_display = 'frame-title',
  mappings = {
    org = {
        org_clock_goto = '<Leader>og'
      }
    } 
})

-- require('org-agenda').setup {
--   org_agenda_span = 1,
--   org_agenda_time_grid = {
--     { 'daily', 'today', 'require-timed' },
--     { '0900', '1200', '1300', '1800', '......', '----------------' },
--   },
--   org_columns_default_format = '%68ITEM(Task) %6Effort(Effort){:} %6CLOCKSUM(Clock){:}',
-- }
