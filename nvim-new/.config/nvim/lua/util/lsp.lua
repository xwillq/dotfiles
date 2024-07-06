local M = {}

M.symbol_kinds = {
    -- All symbol kinds defined in the spec
    all = {
        'File',
        'Module',
        'Namespace',
        'Package',
        'Class',
        'Method',
        'Property',
        'Field',
        'Constructor',
        'Enum',
        'Interface',
        'Function',
        'Variable',
        'Constant',
        'String',
        'Number',
        'Boolean',
        'Array',
        'Object',
        'Key',
        'Null',
        'EnumMember',
        'Struct',
        'Event',
        'Operator',
        'TypeParameter',
    },
    -- Class-like symbol kinds
    class = {
        'File',
        'Module',
        'Class',
        'Enum',
        'Interface',
        'Struct',
    },
    -- Function-like symbol kinds
    ['function'] = {
        'Method',
        'Constructor',
        'Function',
    },
}

return M
