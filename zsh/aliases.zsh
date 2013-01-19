alias reload!='. ~/.zshrc'
alias b='bundle exec'
alias please='sudo'

# Services start-ups and shut-downs

alias mysql-start="mysql.server start"
alias mysql-stop="mysql.server stop"
alias mysql-restart="mysql.server restart"

alias redis-start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis-restart="redis-stop && redis-start"
