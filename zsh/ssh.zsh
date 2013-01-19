# SSH Agent
result=$(ssh-add -L 2>/dev/null | tail -n 1)
if [[ $result == "The agent has no identities." ]]
then
  ssh-add ~/.ssh/id_rsa 2>/dev/null
fi
