local yaml = function(path, bufnr)
    return 'yaml'
end
vim.filetype.add({
    extension = {
        yaml = yaml,
        yml = yaml
    },
    filename = {
        ['.gitlab-ci.yml'] = 'yaml.gitlab',
        ['.gitlab-ci.yaml'] = 'yaml.gitlab',
    },
})
