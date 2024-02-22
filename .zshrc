[ -f "/Users/klaaspelzer/.ghcup/env" ] && source "/Users/klaaspelzer/.ghcup/env" # ghcup-env

alias kickerprod="ssh kicker_user@prod-backend.ehrlichkicker.com"
alias kickertest="ssh kicker_user@test-backend-ssh.ehrlichkicker.com"


export PATH=${PATH}:/Users/klaaspelzer/go/bin
export GREENLIGHT_DB_DSN='postgres://greenlight:admin@localhost/greenlight?sslmode=disable' 

alias esp_load="source /Users/klaaspelzer/esp/esp-idf-v5.0.4/export.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
