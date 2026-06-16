#!/bin/bash
# Nautilus Admin Warning - Instalador automatico
# Autor: Bogdan (Zorin OS)
# Descripcion: Agrega advertencia de seguridad al abrir Nautilus como administrador

set -e

echo "=========================================="
echo "  Nautilus Admin Warning - Instalador"
echo "=========================================="
echo ""

# Verificar que se ejecuta como root
if [ "$EUID" -ne 0 ]; then 
    echo "⚠️  Este script necesita permisos de administrador."
    echo "   Ejecuta: sudo ./install.sh"
    exit 1
fi

# Verificar dependencias
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

# Instalar script de advertencia
echo "📁 Instalando script de advertencia..."
cp nautilus-admin-warning.sh /usr/local/bin/
chmod +x /usr/local/bin/nautilus-admin-warning.sh
echo "   ✅ /usr/local/bin/nautilus-admin-warning.sh"

# Instalar extension de Nautilus
echo "📁 Instalando extension de Nautilus..."
cp nautilus-admin-custom.py /usr/share/nautilus-python/extensions/
chmod 644 /usr/share/nautilus-python/extensions/nautilus-admin-custom.py
echo "   ✅ /usr/share/nautilus-python/extensions/nautilus-admin-custom.py"

# Desactivar extension original de nautilus-admin si existe
if [ -f "/usr/share/nautilus-python/extensions/nautilus-admin.py" ]; then
    echo "🗑️  Desactivando extension original de nautilus-admin..."
    mv /usr/share/nautilus-python/extensions/nautilus-admin.py \
       /usr/share/nautilus-python/extensions/nautilus-admin.py.bak
fi

# Limpiar cache y reiniciar Nautilus
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
echo "   2. Haz clic derecho en cualquier carpeta o espacio vacio"
echo "   3. Selecciona: 'Abrir como Administrador (con advertencia)'"
echo "   4. Lee la advertencia y decide: ACEPTAR o CANCELAR"
echo ""
echo "🎨 Caracteristicas:"
echo "   • Ventana de advertencia con colores e iconos"
echo "   • Mensaje claro sobre riesgos del modo administrador"
echo "   • Botones ACEPTAR / CANCELAR"
echo "   • Funciona en carpetas, archivos y espacio vacio"
echo ""
echo "⚠️  ADVERTENCIA: Usa esta herramienta con precaucion."
echo "   Modificar archivos del sistema puede danar tu instalacion."
echo ""
