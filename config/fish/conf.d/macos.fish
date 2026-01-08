# macOS-specific Fish configuration
# Only loaded on macOS (Darwin)

if test (uname) != Darwin
    exit
end

# --- macOS Environment Variables ---
if status is-interactive
    set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
end

# --- Homebrew PATH Setup ---
fish_add_path /opt/homebrew/bin
fish_add_path "/opt/homebrew/opt/openssl@3/bin"
fish_add_path "/opt/homebrew/opt/ssh-copy-id/bin"
fish_add_path "/opt/homebrew/opt/curl/bin"
fish_add_path "/opt/homebrew/opt/sqlite/bin"
fish_add_path "/opt/homebrew/opt/openjdk/bin"
fish_add_path "/opt/homebrew/opt/gnu-sed/libexec/gnubin"
fish_add_path "/opt/homebrew/opt/postgresql@16/bin"

# --- macOS-specific Tools ---
fish_add_path "$HOME/.rd/bin"
fish_add_path "$HOME/.local/google-cloud-sdk/bin"

# --- Compiler Flags (Homebrew) ---
if status is-interactive
    # zlib, curl, sqlite
    set -gx --append LDFLAGS "-L/opt/homebrew/opt/zlib/lib" "-L/opt/homebrew/opt/curl/lib" "-L/opt/homebrew/opt/sqlite/lib"
    set -gx --append CPPFLAGS "-I/opt/homebrew/opt/zlib/include" "-I/opt/homebrew/opt/curl/include" "-I/opt/homebrew/opt/sqlite/include"
    set -gx --append --path PKG_CONFIG_PATH "/opt/homebrew/opt/zlib/lib/pkgconfig" "/opt/homebrew/opt/curl/lib/pkgconfig" "/opt/homebrew/opt/sqlite/lib/pkgconfig"
end

# --- macOS Aliases ---
alias _ug "brew update && brew upgrade"
alias sc "brew services"
alias fo "open"
