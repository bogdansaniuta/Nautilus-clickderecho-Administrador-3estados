# 🛡️ Nautilus Admin Warning

> Ventana de advertencia de seguridad al abrir Nautilus (explorador de archivos) como administrador en Linux.

![Ventana de advertencia](screenshot.png)

## 📋 Descripcion

**Nautilus Admin Warning** agrega una ventana de advertencia con formato visual (colores, iconos y texto en negrita) antes de abrir el Explorador de Archivos con permisos de administrador.

### ✨ Caracteristicas

- 🎨 **Ventana visual atractiva** con colores e iconos de advertencia
- ⚠️ **Mensaje claro** sobre los riesgos de modificar archivos del sistema
- 🔒 **Botones ACEPTAR / CANCELAR** para confirmar la accion
- 📁 **Funciona en cualquier lugar**: carpetas, archivos y espacio vacio
- 🖱️ **Integracion completa** en el menu contextual de Nautilus (clic derecho)
- 🚫 **Sin terminal**: todo se hace desde el explorador de archivos

## 🚀 Instalacion rapida

### Metodo 1: Script automatico (recomendado)

```bash
git clone https://github.com/TU_USUARIO/nautilus-admin-warning.git
cd nautilus-admin-warning
sudo ./install.sh
```

### Metodo 2: Instalacion manual

```bash
# 1. Clonar repositorio
git clone https://github.com/TU_USUARIO/nautilus-admin-warning.git
cd nautilus-admin-warning

# 2. Copiar archivos
sudo cp nautilus-admin-warning.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/nautilus-admin-warning.sh
sudo cp nautilus-admin-custom.py /usr/share/nautilus-python/extensions/

# 3. Reiniciar Nautilus
nautilus -q
```

## 📖 Uso

1. Abre el **Explorador de Archivos** (Nautilus)
2. Haz **clic derecho** en cualquier carpeta, archivo o espacio vacio
3. Selecciona: **"Abrir como Administrador (con advertencia)"**
4. Lee la advertencia y presiona **ACEPTAR** o **CANCELAR**

## 🖥️ Compatibilidad

| Distribucion | Estado |
|-------------|--------|
| Zorin OS | ✅ Probado |
| Ubuntu | ✅ Compatible |
| Linux Mint | ✅ Compatible |
| Debian | ✅ Compatible |
| Pop!_OS | ✅ Compatible |
| Fedora | ⚠️ Requiere adaptacion |

**Requisitos:**
- Nautilus (GNOME Files)
- `zenity`
- `python3-nautilus`

## 🗑️ Desinstalacion

```bash
sudo ./uninstall.sh
```

## 🎨 Personalizacion

Puedes modificar los colores, texto y tamano editando el archivo:
```bash
sudo nano /usr/local/bin/nautilus-admin-warning.sh
```

### Colores disponibles

| Codigo | Color |
|--------|-------|
| `#CC0000` | Rojo intenso |
| `#FF6600` | Naranja |
| `#990000` | Rojo oscuro |
| `#333333` | Gris oscuro |

## 🤝 Contribuir

1. Haz fork del repositorio
2. Crea una rama (`git checkout -b feature/nueva-funcion`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcion'`)
4. Push a la rama (`git push origin feature/nueva-funcion`)
5. Abre un Pull Request

## 📄 Licencia

MIT License - Libre para usar, modificar y distribuir.

## 🙏 Creditos

- **Autor:** Bogdan
- **Sistema:** Zorin OS
- **Inspiracion:** Funcion "Ejecutar como administrador" de Windows

---

⚠️ **ADVERTENCIA:** Usa esta herramienta con precaucion. Modificar archivos del sistema puede danar tu instalacion de Linux.
