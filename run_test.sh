#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <program>"
    exit 1
fi

INSTRUCTION_FILE="test.x86"

# "$1" &
# PROGRAM_PID=$!

sleep 0.25
echo -e "\n" >&2
{
while IFS= read -r line; do
    trimmed_line=$(echo "$line" | xargs)

    if [[ "$trimmed_line" == GradersNote:* ]]; then
        echo -e "   \033[31m $trimmed_line \033[0m" >&2
    fi

    if [[ -z "$trimmed_line" || "$trimmed_line" == //* ||  "$trimmed_line" == GradersNote:* ]]; then
        continue
    fi
    # if [[ "$trimmed_line" == SLEEP* ]]; then
    #     echo -e "Test Completed\n\n\n" >&2
    #     sleep 10
    #     break
    # fi

    echo -e "\nInstruction? $trimmed_line" >&2
    sleep 0.1
    echo "$trimmed_line"

    sleep 0.1
done < "$INSTRUCTION_FILE"
} | "$1"

wait $PROGRAM_PID
