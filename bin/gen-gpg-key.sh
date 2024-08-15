#!/bin/bash

gpg --batch --full-generate-key <<EOF
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Name-Real: Diorman Colmenares
Name-Email: 229201+diorman@users.noreply.github.com
Expire-Date: 0
EOF


# List keys
# private:
# gpg --list-secret-keys --keyid-format LONG
# public:
# gpg --list-keys --keyid-format LONG
#
# Export keys
# gpg --armor --export <ID>
