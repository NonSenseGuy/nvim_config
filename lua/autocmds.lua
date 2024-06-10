local function is_python_repo()
  local bufname = vim.fn.bufname()
  vim.notify('bufname :' .. tostring(bufname), vim.log.levels.INFO)
  if bufname == nil or bufname == '' then
    return false
  end
  local pattern = '.*/%w+/.*%.py$'
  local is_py = string.match(bufname, pattern) ~= nil
  vim.notify('is_python_repo :' .. tostring(is_py), vim.log.levels.INFO)
  return is_py
end

local function glob_py()
  local current_dir = vim.fn.getcwd()
  local found_python_file = false
  while current_dir ~= '/' do
    local files = vim.fn.glob(current_dir .. '/*.py', 0, 1)
    vim.notify('is_python_repo :' .. tostring(files), vim.log.levels.INFO)
    if #files > 0 then
      found_python_file = true
      break
    end
    current_dir = vim.fn.fnamemodify(current_dir, ':h')
  end

  return found_python_file
end

local function activate_poetry()
  if glob_py() then
    vim.cmd 'PoetvActivate'
    vim.cmd 'LspRestart'
  end
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  callback = activate_poetry,
})
