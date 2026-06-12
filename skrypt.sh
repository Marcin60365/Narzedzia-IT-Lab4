if [ "$1" == "--date" ]; then
    date
fi

if [ "$1" == "--logs" ]; then
    COUNT=${2:-100}
    for i in $(seq 1 $COUNT); do
        FILENAME="log${i}.txt"
        echo "Nazwa pliku: $FILENAME" > "$FILENAME"
        echo "Skrypt: $0" >> "$FILENAME"
        echo "Data utworzenia: $(date)" >> "$FILENAME"
    done
fi