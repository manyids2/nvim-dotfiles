local _preview = {}

function _preview.preview_location(location, context, before_context)
  -- location may be LocationLink or Location (more useful for the former)
  context = context or 15
  before_context = before_context or 0
  local uri = location.targetUri or location.uri
  if uri == nil then
    return
  end
  local bufnr = vim.uri_to_bufnr(uri)
  if not vim.api.nvim_buf_is_loaded(bufnr) then
    vim.fn.bufload(bufnr)
  end
  local range = location.targetRange or location.range
  local contents =
  vim.api.nvim_buf_get_lines(bufnr, range.start.line - before_context, range["end"].line + 1 + context, false)
  local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
  return vim.lsp.util.open_floating_preview(contents, filetype)
end

_preview.switch_header_source = function()
  vim.lsp.buf_request(
    vim.api.nvim_get_current_buf(),
    "textDocument/switchSourceHeader",
    vim.lsp.util.make_text_document_params(),
    function(err, _, result, _, _)
      if err then
        print(err)
      else
        vim.cmd("e " .. vim.uri_to_fname(result))
      end
    end
  )
end

function _preview.preview_location_callback(_, method, result)
  local context = 15
  if result == nil or vim.tbl_isempty(result) then
    vim.lsp.log.info(method, "No location found")
    return nil
  end
  if vim.tbl_islist(result) then
    _preview.preview_location(result[1], context)
  else
    _preview.preview_location(result, context)
  end
end

function _preview.peek_definition()
  local params = vim.lsp.util.make_position_params()
  local result = vim.lsp.buf_request(vim.api.nvim_get_current_buf(), "textDocument/definition", params, _preview.preview_location_callback)
  return result
end

return _preview
