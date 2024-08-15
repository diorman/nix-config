import os

HOMEPATH = os.getenv("HOME")
CODEPATH = f'{HOMEPATH}/Code'

def which(program: str) -> str:
    return f'/etc/profiles/per-user/diorman//bin/{program}'
