return {
    filetypes = { 'yaml', 'yaml.*' },
    cmd = {
        'docker',
        'run',
        '--platform=linux/amd64',
        '-i',
        '--rm',
        'quay.io/redhat-developer/yaml-language-server:latest',
        '--stdio',
    },
    before_init = function(params)
        params.processId = vim.NIL
    end,
}
