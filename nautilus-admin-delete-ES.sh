#!/bin/bash

FILE="$1"
FILENAME=$(basename "$FILE")

zenity --question \
  --window-icon="" \
  --title="⚠️ Eliminar como Administrador ⚠️ " \
  --text='<span foreground="#CC0000" size="xx-large" weight="bold">⚠️  ATENCION  ⚠️</span>
<span foreground="#CC0000" size="large" weight="bold">━━━━━━━━━━━━━━━━━━━━━━</span>

<span foreground="#333333" size="x-large" weight="bold">Esta a punto de ELIMINAR permanentemente:</span>

<span foreground="#FF6600" size="x-large" weight="bold">'"$FILENAME"'</span>

<span foreground="#333333">Ubicacion:</span> <span foreground="#CC0000">'"$FILE"'</span>

<span foreground="#333333">Esta accion</span> <span foreground="#CC0000" weight="bold" size="large">NO se puede deshacer</span><span foreground="#333333">.</span>

<span foreground="#990000" weight="bold" size="large"> ¿ Esta COMPLETAMENTE SEGURO ? </span>' \
  --ok-label="ELIMINAR" \
  --cancel-label="CANCELAR" \
  --width=550 \
  --height=400

if [ $? -eq 0 ]; then
    pkexec rm -f "$FILE"
    if [ $? -eq 0 ]; then
        zenity --info --title="✅  Eliminado  ✅" --text='<span foreground="#228B22" weight="bold">Archivo eliminado correctamente.</span>' --timeout=10
    else
        zenity --error --title="❌  Error  ❌" --text='<span foreground="#CC0000" weight="bold">No se pudo eliminar el archivo.</span>'
    fi
else
    exit 0
fi
