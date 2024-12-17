#!/bin/bash

# Skript stoppt sofort, wenn ein Befehl fehlschlägt
set -e

# 1. Projekt bereinigen
echo "Cleaning previous builds..."
cabal clean

# 2. Abhängigkeiten aktualisieren
echo "Updating dependencies..."
cabal update

# 3. Projekt bauen
echo "Building the project..."
cabal build

# 4. Tests ausführen
echo "Running tests..."
cabal test

# 5. Programm starten und Zeit messen
echo "Starting the program with 'time'..."
time cabal run

echo "Program completed successfully!"
