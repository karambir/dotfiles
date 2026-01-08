# Function to load .env file
function loaddotenv --description "Load environment variables from .env file"
    if test -f .env
        # Export variables, stripping comments and handling potential issues
        # Use `string split` and `set -gx` for robustness in Fish
        for line in (cat .env | grep -vE '^\s*#|^\s*$')
             set -gx (string split -m 1 = "$line")
        end
    end
end
