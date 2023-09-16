return {
    cmd = {
        "docker",
        "run",
        "--platform=linux/amd64",
        "-i",
        "--rm",
        "quay.io/redhat-developer/yaml-language-server:latest",
    },
    before_init = function(params)
        params.processId = vim.NIL
    end,
}
