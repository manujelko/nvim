local function venv_create(args)
    -- Get the Python version from the argument
    local python_version = args.args

    -- Get the basename of the current working directory
    local handle = io.popen("basename $(pwd)")
    if handle then
        local venv_name = handle:read("*a")
        handle:close()

        -- Trim any trailing whitespace or newlines
        venv_name = string.gsub(venv_name, "^%s*(.-)%s*$", "%1")

        -- Run pyenv virtualenv command
        os.execute(string.format("pyenv virtualenv %s %s", python_version, venv_name))

        -- Set pyenv local to the new virtualenv
        os.execute(string.format("pyenv local %s", venv_name))

        print("Virtualenv created and set: " .. venv_name)

        -- Define the JSON content
        local home_directory = os.getenv("HOME")
        local venv_path = home_directory .. "/.pyenv/versions"
        local content = string.format('{\n    "venvPath": "%s",\n    "venv": "%s"\n}', venv_path, venv_name)

        -- Write the content to pyrightconfig.json
        local file = io.open("pyrightconfig.json", "w")
        if file then
            file:write(content)
            file:close()
            print("pyrightconfig.json created with venv: " .. venv_name)
        else
            print("Error: Unable to open pyrightconfig.json for writing.")
        end
    else
        print("Error: Unable to execute shell command.")
    end
end

-- Add a command to Neovim that creates a virtualenv for the current folder
vim.api.nvim_create_user_command('VenvCreate', venv_create, { nargs = 1 })

local function venv_delete()
    -- Get the basename of the current working directory
    local handle = io.popen("basename $(pwd)")
    if handle then
        local venv_name = handle:read("*a")
        handle:close()
        venv_name = string.gsub(venv_name, "^%s*(.-)%s*$", "%1")

        -- Run pyenv virtualenv-delete command
        os.execute(string.format("pyenv virtualenv-delete -f %s", venv_name))

        -- Remove .python-version file if it exists
        if vim.fn.filereadable(".python-version") == 1 then
            os.remove(".python-version")
            print(".python-version file removed.")
        end

        -- Remove pyrightconfig.json file if it exists
        if vim.fn.filereadable("pyrightconfig.json") == 1 then
            os.remove("pyrightconfig.json")
            print("pyrightconfig.json file removed.")
        end

        print("Virtualenv removed: " .. venv_name)
    else
        print("Error: Unable to execute shell command.")
    end
end

-- Add a command to Neovim that deletes the current folder's virtualenv
vim.api.nvim_create_user_command('VenvDelete', venv_delete, {})
