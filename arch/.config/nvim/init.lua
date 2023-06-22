-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("lspconfig").clangd.setup({})

require("lspconfig").hls.setup({
  filetypes = { "haskell", "lhaskell", "cabal" },
})

require("lspconfig").gopls.setup({
  cmd = { "/Users/ced/.go/bin/gopls" },
  settings = {
    gopls = {
      semanticTokens = true,
    },
  },
})

-- -- C#/.NET config
-- -- using omnisharp extended requires
-- --
-- -- return {
-- --  "Hoffs/omnisharp-extended-lsp.nvim",
-- -- }
-- --
-- -- to be added to .config/nvim/lua/plugins.lua
-- local function on_attach_omnisharp(client, _)
--   client.server_capabilities.semanticTokensProvider = {
--     full = vim.empty_dict(),
--     legend = {
--       tokenModifiers = { "static_symbol" },
--       tokenTypes = {
--         "comment",
--         "excluded_code",
--         "identifier",
--         "keyword",
--         "keyword_control",
--         "number",
--         "operator",
--         "operator_overloaded",
--         "preprocessor_keyword",
--         "string",
--         "whitespace",
--         "text",
--         "static_symbol",
--         "preprocessor_text",
--         "punctuation",
--         "string_verbatim",
--         "string_escape_character",
--         "class_name",
--         "delegate_name",
--         "enum_name",
--         "interface_name",
--         "module_name",
--         "struct_name",
--         "type_parameter_name",
--         "field_name",
--         "enum_member_name",
--         "constant_name",
--         "local_name",
--         "parameter_name",
--         "method_name",
--         "extension_method_name",
--         "property_name",
--         "event_name",
--         "namespace_name",
--         "label_name",
--         "xml_doc_comment_attribute_name",
--         "xml_doc_comment_attribute_quotes",
--         "xml_doc_comment_attribute_value",
--         "xml_doc_comment_cdata_section",
--         "xml_doc_comment_comment",
--         "xml_doc_comment_delimiter",
--         "xml_doc_comment_entity_reference",
--         "xml_doc_comment_name",
--         "xml_doc_comment_processing_instruction",
--         "xml_doc_comment_text",
--         "xml_literal_attribute_name",
--         "xml_literal_attribute_quotes",
--         "xml_literal_attribute_value",
--         "xml_literal_cdata_section",
--         "xml_literal_comment",
--         "xml_literal_delimiter",
--         "xml_literal_embedded_expression",
--         "xml_literal_entity_reference",
--         "xml_literal_name",
--         "xml_literal_processing_instruction",
--         "xml_literal_text",
--         "regex_comment",
--         "regex_character_class",
--         "regex_anchor",
--         "regex_quantifier",
--         "regex_grouping",
--         "regex_alternation",
--         "regex_text",
--         "regex_self_escaped_character",
--         "regex_other_escape",
--       },
--     },
--     range = true,
--   }
-- end
-- local function on_attach_csharp_ls(client, _)
--   client.server_capabilities = {
--     semanticTokensProvider = {
--       full = true,
--       legend = {
--         tokenModifiers = { "static" },
--         tokenTypes = {
--           "class",
--           "comment",
--           "property",
--           "enumMember",
--           "enum",
--           "event",
--           "method",
--           "variable",
--           "interface",
--           "keyword",
--           "namespace",
--           "number",
--           "operator",
--           "parameter",
--           "struct",
--           "regex",
--           "string",
--           "typeParameter",
--         },
--       },
--       range = true,
--     },
--     textDocumentSync = {
--       change = 2,
--       openClose = true,
--       save = {
--         includeText = true,
--       },
--     },
--   }
-- end
-- require("lspconfig").csharp_ls.setup({
--   on_attach = on_attach_csharp_ls,
--   -- ignore diagnostics since using server only for syntax highlighting
--   handlers = {
--     ["textDocument/publishDiagnostics"] = function(_, _, _, _) end,
--   },
-- })
-- require("lspconfig").omnisharp_mono.setup({
--   on_attach = on_attach_omnisharp,
--   handlers = {
--     ["textDocument/definition"] = require("omnisharp_extended").handler,
--   },
--   enable_ms_build_load_projects_on_demand = true,
--   enable_roslyn_analyzers = true,
--   organize_imports_on_format = true,
--   enable_import_completion = true,
--   analyze_open_documents_only = true,
-- })
