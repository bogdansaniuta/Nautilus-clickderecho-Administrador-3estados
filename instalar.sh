#!/bin/bash
# Nautilus Admin Tools - Instalador automatico
# Autor: Bogdan (Zorin OS)

set -e

echo "=========================================="
echo "  Nautilus Admin Tools - Instalador"
echo "=========================================="
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Este script necesita permisos de administrador."
    echo "   Ejecuta: sudo ./instalar.sh"
    exit 1
fi

echo "📦 Verificando dependencias..."

if ! command -v zenity &> /dev/null; then
    echo "   Instalando zenity..."
    apt-get update && apt-get install -y zenity
fi

if ! dpkg -l | grep -q python3-nautilus; then
    echo "   Instalando python3-nautilus..."
    apt-get update && apt-get install -y python3-nautilus
fi

echo "✅ Dependencias listas."
echo ""

echo "📁 Instalando scripts..."

# Script de abrir
sudo tee /usr/local/bin/nautilus-admin-open.sh > /dev/null << 'EOF'
#!/bin/bash

FILE="$1"

if [ -d "$FILE" ]; then
    COMMAND="nautilus"
    TARGET="$FILE"
    TIPO="el Explorador de Archivos"
else
    COMMAND="mousepad"
    TARGET="$FILE"
    TIPO="el Editor de Texto"
fi

zenity --question \
  --window-icon="" \
  --title="Abrir como Administrador" \
  --text='<span foreground="#CC0000" size="xx-large" weight="bold">⚠️  ATENCION  ⚠️ </span>
<span foreground="#CC0000" size="large" weight="bold">━━━━━━━━━━━━━━━━━━━━━━</span>

<span foreground="#333333" size="large" weight="bold">Esta a punto de abrir '"$TIPO"' con</span>

<span foreground="#CC0000" size="x-large" weight="bold">PERMISOS DE ADMINISTRADOR</span>

<span foreground="#333333" weight="bold">Ubicacion:</span> <span foreground="#CC0000" weight="bold">'"$TARGET"'</span>

<span foreground="#333333" weight="bold">Puede modificar, <span foreground="#0066CC" weight="bold"> Crear </span> o <span foreground="#CC0000" weight="bold"> Eliminar </span> cualquier archivo del sistema.</span>

<span foreground="#333333" weight="bold">Esta accion</span> <span foreground="#CC0000" weight="bold" size="large">NO se puede deshacer</span><span foreground="#333333" weight="bold">.</span>

<span foreground="#990000" weight="bold" size="large"> ¿ Esta COMPLETAMENTE SEGURO ? </span>' \
  --ok-label="ABRIR" \
  --cancel-label="CANCELAR" \
  --width=550 \
  --height=400

if [ $? -eq 0 ]; then
    sudo -E "$COMMAND" "$TARGET" 2>/dev/null
fi
EOF

chmod +x /usr/local/bin/nautilus-admin-open.sh
echo "   ✅ /usr/local/bin/nautilus-admin-open.sh"

# Script de eliminar
sudo tee /usr/local/bin/nautilus-admin-delete.sh > /dev/null << 'EOF'
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
EOF

chmod +x /usr/local/bin/nautilus-admin-delete.sh
echo "   ✅ /usr/local/bin/nautilus-admin-delete.sh"

echo ""
echo "📁 Instalando extension de Nautilus..."

sudo tee /usr/share/nautilus-python/extensions/nautilus-admin-custom.py > /dev/null << 'EOF'
#!/usr/bin/env python3

from gi.repository import Nautilus, GObject
import subprocess

class AdminExtension(GObject.GObject, Nautilus.MenuProvider):

    def get_file_items(self, files):
        items = []

        # Opcion: Abrir como administrador
        item_open = Nautilus.MenuItem(
            name='AdminOpen',
            label='Abrir como administrador',
            tip='Abrir este archivo con permisos de administrador'
        )
        item_open.connect('activate', self.open_as_admin, files)
        items.append(item_open)

        # Opcion: Eliminar como administrador
        item_delete = Nautilus.MenuItem(
            name='AdminDelete',
            label='Eliminar como administrador',
            tip='Eliminar este archivo con permisos de administrador'
        )
        item_delete.connect('activate', self.delete_as_admin, files)
        items.append(item_delete)

        return items

    def get_background_items(self, current_folder):
        return []

    def open_as_admin(self, menu, files):
        for file in files:
            path = file.get_location().get_path()
            subprocess.Popen(['/usr/local/bin/nautilus-admin-open.sh', path])
            break

    def delete_as_admin(self, menu, files):
        for file in files:
            path = file.get_location().get_path()
            subprocess.Popen(['/usr/local/bin/nautilus-admin-delete.sh', path])
            break
EOF

chmod 644 /usr/share/nautilus-python/extensions/nautilus-admin-custom.py
echo "   ✅ /usr/share/nautilus-python/extensions/nautilus-admin-custom.py"

if [ -f "/usr/share/nautilus-python/extensions/nautilus-admin.py" ]; then
    echo "🗑️  Desactivando extension original de nautilus-admin..."
    mv /usr/share/nautilus-python/extensions/nautilus-admin.py \
       /usr/share/nautilus-python/extensions/nautilus-admin.py.bak
fi

echo "🔄 Reiniciando Nautilus..."
rm -rf /usr/share/nautilus-python/extensions/__pycache__
sudo -u "$SUDO_USER" nautilus -q 2>/dev/null || true

echo ""
echo "=========================================="
echo "  ✅ Instalacion completada!"
echo "=========================================="
echo ""
echo "📋 Instrucciones de uso:"
echo "   1. Abre el Explorador de Archivos (Nautilus)"
echo "   2. Haz clic derecho en cualquier archivo o carpeta"
echo "   3. Selecciona:"
echo "      - 'Abrir como administrador'"
echo "      - 'Eliminar como administrador'"
echo "   4. Lee la advertencia y confirma"
echo "   5. Ingresa tu contraseña si se solicita"
echo ""
echo "⚠️  ADVERTENCIA: Use esta herramienta con precaucion."
echo "   Los archivos eliminados no se pueden recuperar."
echo ""
