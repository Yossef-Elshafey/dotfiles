Vim�UnDo� Z���X�0�X���Nޣb\+[.l�{��   =   &    local luasnip = require("luasnip")                              fV.    _�                             ����                                                                                                                                                                                                                                                                                                                                                             fV     �                R    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)5��                          �      S               5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             fV     �   
             &      -- install jsregexp (optional!).5��    
                      j      '               5�_�                     (       ����                                                                                                                                                                                                                                                                                                                                                             fV-    �         =        "hrsh7th/nvim-cmp",     event = "InsertEnter",     dependencies = {   6    "hrsh7th/cmp-buffer", -- source for text in buffer   7    "hrsh7th/cmp-path", -- source for file system paths       {         "L3MON4D3/LuaSnip",         -- follow latest release.   o      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)   &      build = "make install_jsregexp",       },   5    "saadparwaiz1/cmp_luasnip", -- for autocompletion   6    "rafamadriz/friendly-snippets", -- useful snippets   6    "onsails/lspkind.nvim", -- vs-code like pictograms     },     config = function()       local cmp = require("cmp")�         =      &    local luasnip = require("luasnip")�         =      &    local lspkind = require("lspkind")�         =      6    require("luasnip.loaders.from_vscode").lazy_load()�      3   =          cmp.setup({         completion = {   6        completeopt = "menu,menuone,preview,noselect",         },   I      snippet = { -- configure how nvim-cmp interacts with snippet engine           expand = function(args)   '          luasnip.lsp_expand(args.body)           end,         },   +      mapping = cmp.mapping.preset.insert({   L        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion   F        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion   0        ["<C-b>"] = cmp.mapping.scroll_docs(-4),   /        ["<C-f>"] = cmp.mapping.scroll_docs(4),   N        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions   C        ["<C-e>"] = cmp.mapping.abort(), -- close completion window   ;        ["<CR>"] = cmp.mapping.confirm({ select = false }),   	      }),   #      -- sources for autocompletion   $      sources = cmp.config.sources({           { name = "nvim_lsp"},   )        { name = "luasnip" }, -- snippets   :        { name = "buffer" }, -- text within current buffer   /        { name = "path" }, -- file system paths   	      }),�   3   =   >   
   I      -- configure lspkind for vs-code like pictograms in completion menu         formatting = {   %        format = lspkind.cmp_format({             maxwidth = 50,              ellipsis_char = "...",           }),         },       })         end,5��    3       	                  �       �       �                       �      	      �      �                         �                    �                         �                    �                         w                    �                       	       R      1      5��