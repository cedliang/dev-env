local csharp_ls_on_attach_func
local omnisharp_on_attach_func
local omnisharp_on_new_config
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
        "<cmd>lua require('omnisharp_extended').telescope_lsp_definitions()<cr>",
        desc = "Goto Definition (omnisharp)",
    }
end

omnisharp_on_new_config = function(new_config, _)
    -- Get the initially configured value of `cmd`
    new_config.cmd = { unpack(new_config.cmd or {}) }

    -- Append hard-coded command arguments
    table.insert(new_config.cmd, "-z") -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
    vim.list_extend(new_config.cmd, { "--hostPID", tostring(vim.fn.getpid()) })
    table.insert(new_config.cmd, "DotNet:enablePackageRestore=false")
    vim.list_extend(new_config.cmd, { "--encoding", "utf-8" })
    table.insert(new_config.cmd, "--languageserver")

    -- Append configuration-dependent command arguments
    if new_config.enable_editorconfig_support then
        table.insert(new_config.cmd, "FormattingOptions:EnableEditorConfigSupport=true")
    end

    if new_config.organize_imports_on_format then
        table.insert(new_config.cmd, "FormattingOptions:OrganizeImports=true")
    end

    if new_config.enable_ms_build_load_projects_on_demand then
        table.insert(new_config.cmd, "MsBuild:LoadProjectsOnDemand=true")
    end

    if new_config.enable_roslyn_analyzers then
        table.insert(new_config.cmd, "RoslynExtensionsOptions:EnableAnalyzersSupport=true")
    end

    if new_config.enable_import_completion then
        table.insert(new_config.cmd, "RoslynExtensionsOptions:EnableImportCompletion=true")
    end

    if new_config.sdk_include_prereleases then
        table.insert(new_config.cmd, "Sdk:IncludePrereleases=true")
    end

    if new_config.analyze_open_documents_only then
        table.insert(new_config.cmd, "RoslynExtensionsOptions:AnalyzeOpenDocumentsOnly=true")
    end

    table.insert(new_config.cmd, "RoslynExtensionsOptions:EnableDecompilationSupport=true")

    -- Disable the handling of multiple workspaces in a single instance
    new_config.capabilities = vim.deepcopy(new_config.capabilities)
    new_config.capabilities.workspace.workspaceFolders = false -- https://github.com/OmniSharp/omnisharp-roslyn/issues/909
end

omnisharp_mono_func = function(_, opts)
    local handler = require("omnisharp_extended").handler
    require("lspconfig").omnisharp_mono.setup({
        on_attach = omnisharp_on_attach_func,
        handlers = {
            ["textDocument/definition"] = handler,
        },
        on_new_config = omnisharp_on_new_config,
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        analyze_open_documents_only = true,
    })
    return true
end

omnisharp_func = function(_, opts)
    local handler = require("omnisharp_extended").handler
    require("lspconfig").omnisharp.setup({
        on_attach = omnisharp_on_attach_func,
        handlers = {
            ["textDocument/definition"] = handler,
        },
        on_new_config = omnisharp_on_new_config,
        enable_ms_build_load_projects_on_demand = true,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        analyze_open_documents_only = true,
    })
    return true
end

csharp_ls_func = function(_, opts)
    require("lspconfig").csharp_ls.setup({
        on_attach = csharp_ls_on_attach_func,
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, _, _, _) end,
        },
    })
    return true
end

return return_main(use_mono)
