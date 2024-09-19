local csharp_ls_on_attach_func
local omnisharp_on_attach_func
local omnisharp_mono_func
local omnisharp_func
local csharp_ls_func

local use_mono = true

local function return_main(mono)
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        group = vim.api.nvim_create_augroup("file_type", { clear = true }),
        pattern = { "*.xaml" },
        callback = function()
            vim.bo.filetype = "xml"
        end,
    })
    return {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                table.insert(opts.ensure_installed, { "xml", "c_sharp" })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "Hoffs/omnisharp-extended-lsp.nvim",
            },
            opts = (mono and {
                servers = {
                    omnisharp_mono = {},
                    csharp_ls = {},
                },
                setup = {
                    csharp_ls = csharp_ls_func,
                    omnisharp_mono = omnisharp_mono_func,
                },
            } or {
                servers = {
                    omnisharp = {},
                    csharp_ls = {},
                },
                setup = {
                    csharp_ls = csharp_ls_func,
                    omnisharp = omnisharp_func,
                },
            }),
        },
    }
end

csharp_ls_on_attach_func = function(client, _)
    -- lsp keyword breaks since it designates too much as a keyword (ie, conditionals, etc)
    -- here we let it fallback to the default highlight group
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", {})
    client.server_capabilities = {
        semanticTokensProvider = {
            full = true,
            legend = {
                tokenModifiers = { "static" },
                tokenTypes = {
                    "class",
                    "comment",
                    "property",
                    "enumMember",
                    "enum",
                    "event",
                    "method",
                    "variable",
                    "interface",
                    "keyword",
                    "namespace",
                    "number",
                    "operator",
                    "parameter",
                    "struct",
                    "regex",
                    "string",
                    "typeParameter",
                },
            },
            range = true,
        },
        textDocumentSync = {
            change = 2,
            openClose = true,
            save = {
                includeText = true,
            },
        },
    }
end

omnisharp_on_attach_func = function(client, _)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
        "gd",
        "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>",
        desc = "Goto Definition (omnisharp)",
    }
    keys[#keys + 1] = {
        "gr",
        "<cmd>lua require('omnisharp_extended').lsp_references()<cr>",
        desc = "Goto References (omnisharp)",
    }
    keys[#keys + 1] = {
        "gI",
        "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>",
        desc = "Goto Implementations (omnisharp)",
    }
    keys[#keys + 1] = {
        "gy",
        "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>",
        desc = "Goto T[y]pe Definition (omnisharp)",
    }
end

omnisharp_mono_func = function(_, opts)
    local def_handler = require("omnisharp_extended").definition_handler
    local ref_handler = require("omnisharp_extended").references_handler
    local impl_handler = require("omnisharp_extended").implementation_handler
    local type_def_handler = require("omnisharp_extended").type_definition_handler
    require("lspconfig").omnisharp_mono.setup({
        on_attach = omnisharp_on_attach_func,
        handlers = {
            ["textDocument/definition"] = def_handler,
            ["textDocument/typeDefinition"] = type_def_handler,
            ["textDocument/implementation"] = impl_handler,
            ["textDocument/references"] = ref_handler,
        },
        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = true,
            },
            MsBuild = {
                LoadProjectsOnDemand = true,
            },
            RoslynExtensionsOptions = {
                EnableAnalyzersSupport = true,
                EnableImportCompletion = true,
                AnalyzeOpenDocumentsOnly = true,
                EnableDecompilationSupport = true,
            },
        },
    })
    return true
end

omnisharp_func = function(_, opts)
    local def_handler = require("omnisharp_extended").definition_handler
    local ref_handler = require("omnisharp_extended").references_handler
    local impl_handler = require("omnisharp_extended").implementation_handler
    local type_def_handler = require("omnisharp_extended").type_definition_handler
    require("lspconfig").omnisharp.setup({
        on_attach = omnisharp_on_attach_func,
        handlers = {
            ["textDocument/definition"] = def_handler,
            ["textDocument/typeDefinition"] = type_def_handler,
            ["textDocument/implementation"] = impl_handler,
            ["textDocument/references"] = ref_handler,
        },
        settings = {
            FormattingOptions = {
                EnableEditorConfigSupport = true,
                OrganizeImports = true,
            },
            MsBuild = {
                LoadProjectsOnDemand = false,
            },
            RoslynExtensionsOptions = {
                EnableAnalyzersSupport = true,
                EnableImportCompletion = true,
                AnalyzeOpenDocumentsOnly = false,
                EnableDecompilationSupport = true,
            },
        },
    })
    return true
end

csharp_ls_func = function(_, opts)
    require("lspconfig").csharp_ls.setup({
        on_attach = csharp_ls_on_attach_func,
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, _, _, _) end,
            ["client/registerCapability"] = function(_, _, _)
                return vim.NIL
            end,
        },
    })
    return true
end

return return_main(use_mono)
