case "$1" in
    --date|-d)
        date
        ;;
        
    --logs|-l)
        COUNT=${2:-100}
        for i in $(seq 1 $COUNT); do
            FILENAME="log${i}.txt"
            echo "Nazwa pliku: $FILENAME" > "$FILENAME"
            echo "Skrypt: $0" >> "$FILENAME"
            echo "Data utworzenia: $(date)" >> "$FILENAME"
        done
        ;;
        
    --error|-e)
        COUNT=${2:-100}
        for i in $(seq 1 $COUNT); do
            mkdir -p "error${i}"
            FILENAME="error${i}/error${i}.txt"
            echo "Nazwa pliku: $FILENAME" > "$FILENAME"
            echo "Skrypt: $0" >> "$FILENAME"
            echo "Data utworzenia: $(date)" >> "$FILENAME"
        done
        ;;
        
    --init)
        git clone https://github.com/Marcin60365/Narzedzia-IT-Lab4.git .
        export PATH="$PATH:$(pwd)"
        echo "Repozytorium sklonowane, ścieżka dodana do PATH."
        ;;
        
    --help|-h)
        echo "Dostępne opcje:"
        echo "  --date, -d         Wyświetla dzisiejszą datę"
        echo "  --logs, -l [N]     Tworzy N plików log (domyślnie 100)"
        echo "  --error, -e [N]    Tworzy N katalogów i plików error (domyślnie 100)"
        echo "  --init             Klonuje repozytorium i ustawia PATH"
        echo "  --help, -h         Wyświetla tę pomoc"
        ;;
        
    *)
        echo "Nieznana opcja. Użyj --help lub -h, aby zobaczyć dostępne flagi."
        exit 1
        ;;
esac