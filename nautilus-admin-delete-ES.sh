#!/bin/bash
# ============================================
# Script: nautilus-admin-delete-ES.sh (FINAL)
# Autor: Para Bogdan - Zorin OS
# Fecha: 2026-06-20
# Descripción: Elimina archivos/carpetas como administrador
#              Pide contraseña UNA SOLA VEZ para todos los archivos
# ============================================

# Si no hay argumentos, salir
if [ $# -eq 0 ]; then
    zenity --error --title="❌ Error ❌" --text="No se seleccionó ningún archivo." --timeout=5
    exit 1
fi

# Contar archivos seleccionados
TOTAL=$#

# Crear lista de archivos para mostrar
LISTA=""
for archivo in "$@"; do
    LISTA="${LISTA}<span foreground=\"#FF6600\" weight=\"bold\">$(basename "$archivo")</span>\n<span foreground=\"#666666\">→ $(dirname "$archivo")</span>\n\n"
done

# Mostrar diálogo de confirmación
zenity --question   --window-icon=""   --title="⚠️ Eliminar como Administrador ⚠️"   --text="<span foreground=\"#CC0000\" size=\"xx-large\" weight=\"bold\">⚠️  ATENCION  ⚠️</span>
<span foreground=\"#CC0000\" size=\"large\" weight=\"bold\">━━━━━━━━━━━━━━━━━━━━━━</span>

<span foreground=\"#333333\" size=\"x-large\" weight=\"bold\">Esta a punto de ELIMINAR permanentemente:</span>

<span foreground=\"#333333\">Total de archivos/carpetas:</span> <span foreground=\"#CC0000\" size=\"x-large\" weight=\"bold\">$TOTAL</span>

<span foreground=\"#333333\">Archivos seleccionados:</span>

${LISTA}
<span foreground=\"#333333\">Esta accion</span> <span foreground=\"#CC0000\" weight=\"bold\" size=\"large\">NO se puede deshacer</span><span foreground=\"#333333\">.</span>

<span foreground=\"#990000\" weight=\"bold\" size=\"large\"> ¿ Esta COMPLETAMENTE SEGURO ? </span>"   --ok-label="ELIMINAR TODO"   --cancel-label="CANCELAR"   --width=600   --height=500

# Si el usuario cancela, salir
if [ $? -ne 0 ]; then
    exit 0
fi

# ============================================================
# TRUCO: Crear un script temporal con TODOS los comandos rm
# y ejecutarlo con pkexec UNA SOLA VEZ
# ============================================================

# Crear script temporal
TEMP_SCRIPT=$(mktemp /tmp/nautilus-admin-delete-XXXXXX.sh)

# Escribir el script temporal
echo "#!/bin/bash" > "$TEMP_SCRIPT"
echo "# Script temporal para eliminar archivos" >> "$TEMP_SCRIPT"
echo "" >> "$TEMP_SCRIPT"

# Añadir cada archivo al script temporal
for archivo in "$@"; do
    # Escapar comillas simples en el path para seguridad
    escaped_path=$(echo "$archivo" | sed "s/'/'\\''/g")
    echo "rm -rf '$escaped_path'" >> "$TEMP_SCRIPT"
done

# Hacer ejecutable el script temporal
chmod +x "$TEMP_SCRIPT"

# Ejecutar el script temporal CON pkexec (pide contraseña UNA VEZ)
pkexec bash "$TEMP_SCRIPT"
RESULT=$?

# Borrar el script temporal (con o sin éxito)
rm -f "$TEMP_SCRIPT"

# Mostrar resultado
if [ $RESULT -eq 0 ]; then
    zenity --info         --title="✅ Eliminado ✅"         --text="<span foreground=\"#228B22\" weight=\"bold\" size=\"large\">$TOTAL archivos eliminados correctamente.</span>"         --timeout=10
else
    zenity --error         --title="❌ Error ❌"         --text="<span foreground=\"#CC0000\" weight=\"bold\">No se pudieron eliminar los archivos.</span>\n\nVerifica que tienes permisos de administrador."         --timeout=15
fi
