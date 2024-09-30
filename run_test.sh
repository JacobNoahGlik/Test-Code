#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <program>"
    exit 1
fi

INSTRUCTION_FILE="test.x86"

"$1" &
PROGRAM_PID=$!

sleep 0.25
echo -e "\n" >&2
{
while IFS= read -r line; do
    trimmed_line=$(echo "$line" | xargs)

    if [[ -z "$trimmed_line" || "$trimmed_line" == //* ]]; then
        continue
    fi

    # if ! kill -0 $PROGRAM_PID 2>/dev/null; then
    #         echo "Program has exited unexpectedly (possibly a segfault). Stopping input." >&2
    #         break
    #     fi

    echo -e "\nInstruction? $trimmed_line" >&2
    sleep 0.1
    echo "$trimmed_line"

    sleep 0.1
done < "$INSTRUCTION_FILE"
} | "$1"


wait
