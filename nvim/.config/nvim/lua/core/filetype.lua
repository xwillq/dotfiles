local yaml = function(path, buf)
    local content = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] or ''
    if vim.regex([[^openapi: \?\d\+\.\d\+\.\d\+$]]):match_str(content) ~= nil then
        return 'yaml.openapi'
    end

    return 'yaml'
end

vim.filetype.add({
    filename = {
        ['.gitlab-ci.yml'] = 'yaml.gitlab',
        ['.gitlab-ci.yaml'] = 'yaml.gitlab',
    },
    pattern = {
        ['compose%.ya?ml'] = 'yaml.docker-compose',
        ['docker%-compose%.ya?ml'] = 'yaml.docker-compose',
        -- compose.override.yaml and similar
        ['compose%..+%.ya?ml'] = 'yaml.docker-compose',
        ['docker%-compose%..+%.ya?ml'] = 'yaml.docker-compose',
    },
    extension = {
        yaml = yaml,
        yml = yaml,
    },
})
