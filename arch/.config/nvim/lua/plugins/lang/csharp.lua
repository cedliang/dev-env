local util = require("lspconfig.util")

local root_dir_func
local charp_ls_on_attach_func
local omnisharp_on_attach_func
local omnisharp_on_new_config
local omnisharp_mono_func
local omnisharp_func
local csharp_ls_func

local use_mono = true

local function return_main(mono)
    return {
        {
            "nvim-treesitter/nvim-treesitter",
            opts = function(_, opts)
                table.insert(opts.ensure_installed, "c_sharp")
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

root_dir_func = function(fname)
    return util.root_pattern("*.sln")(fname) or util.root_pattern("*.csproj")(fname)
end

charp_ls_on_attach_func = function(client, _)
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
    vim.api.nvim_set_hl(0, "@lsp.type.keyword", {})
    client.server_capabilities.semanticTokensProvider = {
        full = vim.empty_dict(),
        legend = {
            tokenModifiers = { "static_symbol" },
            tokenTypes = {
                "comment",
                "excluded_code",
                "identifier",
                "keyword",
                "keyword_control",
                "number",
                "operator",
                "operator_overloaded",
                "preprocessor_keyword",
                "string",
                "whitespace",
                "text",
                "static_symbol",
                "preprocessor_text",
                "punctuation",
                "string_verbatim",
                "string_escape_character",
                "class_name",
                "delegate_name",
                "enum_name",
                "interface_name",
                "module_name",
                "struct_name",
                "type_parameter_name",
                "field_name",
                "enum_member_name",
                "constant_name",
                "local_name",
                "parameter_name",
                "method_name",
                "extension_method_name",
                "property_name",
                "event_name",
                "namespace_name",
                "label_name",
                "xml_doc_comment_attribute_name",
                "xml_doc_comment_attribute_quotes",
                "xml_doc_comment_attribute_value",
                "xml_doc_comment_cdata_section",
                "xml_doc_comment_comment",
                "xml_doc_comment_delimiter",
                "xml_doc_comment_entity_reference",
                "xml_doc_comment_name",
                "xml_doc_comment_processing_instruction",
                "xml_doc_comment_text",
                "xml_literal_attribute_name",
                "xml_literal_attribute_quotes",
                "xml_literal_attribute_value",
                "xml_literal_cdata_section",
                "xml_literal_comment",
                "xml_literal_delimiter",
                "xml_literal_embedded_expression",
                "xml_literal_entity_reference",
                "xml_literal_name",
                "xml_literal_processing_instruction",
                "xml_literal_text",
                "regex_comment",
                "regex_character_class",
                "regex_anchor",
                "regex_quantifier",
                "regex_grouping",
                "regex_alternation",
                "regex_text",
                "regex_self_escaped_character",
                "regex_other_escape",
            },
        },
        range = true,
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
        root_dir = root_dir_func,
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
        root_dir = root_dir_func,
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
        on_attach = charp_ls_on_attach_func,
        handlers = {
            ["textDocument/publishDiagnostics"] = function(_, _, _, _) end,
        },
        root_dir = root_dir_func,
    })
    return true
end

return return_main(use_mono)
