local nnoremap = require("utils").nnoremap

nnoremap("<leader>dt", ":lua require('dap-go').debug_test()<CR>")
nnoremap("<leader>dl", ":lua require('dap-go').debug_last_test()<CR>")
