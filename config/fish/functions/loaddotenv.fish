function loaddotenv --description "Load environment variables from .env file"
    if test -f .env
        for line in (cat .env | grep -vE '^\s*#|^\s*$')
            set -gx (string split -m 1 = "$line")
        end
    end
end
