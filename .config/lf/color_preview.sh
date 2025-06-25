#!/bin/bash

#test test

codes=(
  "01;36"  # ln (LINK)
  "31;01"  # or (ORPHAN)
  "34"     # tw (STICKY_OTHER_WRITABLE)
  "34"     # ow (OTHER_WRITABLE)
  "01;34"  # st (STICKY)
  "01;34"  # di (DIR)
  "33"     # pi (FIFO)
  "01;35"  # so (SOCK)
  "33;01"  # bd (BLK)
  "33;01"  # cd (CHR)
  "01;32"  # su (SETUID)
  "01;32"  # sg (SETGID)
  "01;32"  # ex (EXEC)
  "00"     # fi (FILE)
)

labels=(
  "ln      LINK"
  "or      ORPHAN"
  "tw      STICKY_OTHER_WRITABLE"
  "ow      OTHER_WRITABLE"
  "st      STICKY"
  "di      DIR"
  "pi      FIFO"
  "so      SOCK"
  "bd      BLK"
  "cd      CHR"
  "su      SETUID"
  "sg      SETGID"
  "ex      EXEC"
  "fi      FILE"
)

for i in "${!codes[@]}"; do
  printf "\033[${codes[i]}m%s\033[0m\n" "${labels[i]}"
done
