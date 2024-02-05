local function selectInterpreter(args)
    -- Get the provided environment name
    local venv_name = args.args

    -- Get the basename of the current working directory if argument not provided
    if not venv_name or venv_name == '' then
        local handle = io.popen('basename $(pwd)')
        if handle then
            venv_name = handle:read('*l')
            handle:close()
        else
            print('Error: Unable to execute shell command.')
            return
        end
    end

    -- Define the JSON content
    local home_directory = os.getenv('HOME')
    local venv_path = home_directory .. '/.pyenv/versions'
    local content = string.format('{\n    "venvPath": "%s",\n    "venv": "%s"\n}', venv_path, venv_name)

    -- Write the content to pyrightconfig.json
    local file = io.open('pyrightconfig.json', 'w')
    if file then
        file:write(content)
        file:close()
        print('pyrightconfig.json created with venv: ' .. venv_name)
    else
        print('Error: Unable to open pyrightconfig.json for writing.')
    end
end

-- Add a command to Neovim that creates a pyrightconfig.json file
vim.api.nvim_create_user_command(
    'SelectInterpreter',
    function(args)
        selectInterpreter({ args = args.args })
    end,
    { nargs = '?' }
)
