-- Compe requires that Lexima *not* lazy-load its default rules. We'll force
-- the config to set them now, so Compe can overwrite them in its config. The
-- sequencing will be managed by Packer.

vim.g.lexima_no_default_rules = true
vim.fn['lexima#set_default_rules']()

