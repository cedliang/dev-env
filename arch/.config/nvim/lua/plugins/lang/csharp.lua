return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, { "xml", "c_sharp" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "Hoffs/omnisharp-extended-lsp.nvim",
        },
        opts = {
            servers = {
                omnisharp = {
                    handlers = {
                        ["textDocument/definition"] = function(...)
                            return require("omnisharp_extended").definition_handler(...)
                        end,
                        ["textDocument/typeDefinition"] = function(...)
                            return require("omnisharp_extended").type_definition_handler(...)
                        end,
                        ["textDocument/implementation"] = function(...)
                            return require("omnisharp_extended").implementation_handler(...)
                        end,
                        ["textDocument/references"] = function(...)
                            return require("omnisharp_extended").references_handler(...)
                        end,
                    },
                    keys = {
                        {
                            "gd",
                            "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>",
                            desc = "Goto Definition (omnisharp)",
                        },
                        {
                            "gy",
                            "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>",
                            desc = "Goto T[y]pe Definition (omnisharp)",
                        },
                    },
                    settings = {
                        FormattingOptions = {
                            OrganizeImports = true,
                        },
                        RoslynExtensionsOptions = {
                            EnableAnalyzersSupport = true,
                            EnableImportCompletion = true,
                            EnableDecompilationSupport = true,
                            InlayHintsOptions = {
                                EnableForParameters = true,
                                ForLiteralParameters = true,
                                ForIndexerParameters = true,
                                ForObjectCreationParameters = true,
                                ForOtherParameters = true,
                                EnableForTypes = true,
                                ForImplicitVariableTypes = true,
                                ForLambdaParameterTypes = true,
                                ForImplicitObjectCreation = true,
                                SuppressForParametersThatDifferOnlyBySuffix = true,
                                SuppressForParametersThatMatchMethodIntent = true,
                                SuppressForParametersThatMatchArgumentName = true,
                            },
                        },
                    },
                },
                csharp_ls = {
                    handlers = {
                        ["textDocument/publishDiagnostics"] = function(_, _, _, _) end,
                        ["client/registerCapability"] = function(...)
                            return vim.NIL
                        end,
                    },
                    on_attach = function(client, _)
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
                    end,
                },
            },
        },
    },
}
