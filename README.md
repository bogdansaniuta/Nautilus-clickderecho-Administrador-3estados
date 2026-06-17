# 🛡️ Nautilus Clic Derecho Administrador (3 Estados)

> Elimina archivos como administrador directamente desde el menú contextual con un diálogo de advertencia de seguridad integrado.

![Ventana de Advertencia](Advertencias.png)

## 📋 Tabla de Contenidos

- [Instalación Rápida](#-instalación-rápida)
- [Cómo Usar](#-cómo-usar)
- [Compatibilidad](#-compatibilidad)
- [Requisitos](#requisitos)
- [Desinstalación](#-desinstalación)
- [Personalización](#-personalización)
- [Contribuir](#-contribuir)
- [Licencia](#-licencia)

---

## 📦 Instalación Rápida

### Método 1: Instalación Automática (Recomendado)

```bash
git clone https://github.com/bogdansaniuta/Nautilus-clickderecho-Administrador-3estados.git
cd Nautilus-clickderecho-Administrador-3estados
sudo chmod +x install.sh
sudo ./install.sh
```

**⚠️ Importante:** Cierra sesión y vuelve a iniciar (o reinicia) después de instalar.

### Método 2: Instalación Manual

1. Copia el script a `/usr/local/bin/`:
```bash
sudo cp nautilus-admin-delete.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/nautilus-admin-delete-ES.sh
```

2. Copia el archivo `.desktop` a la carpeta de acciones de Nautilus:
```bash
sudo cp delete-as-admin.desktop ~/.local/share/nautilus/scripts/
```

---

## 📖 Cómo Usar

1. **Abre el Administrador de Archivos** (Nautilus/Archivos de GNOME)
2. **Navega a cualquier carpeta** con archivos protegidos
3. **Clic derecho en el archivo** que quieres eliminar
4. **Selecciona:** "Eliminar como Administrador"
5. **Lee la advertencia** de seguridad
6. **Pulsa ELIMINAR** para confirmar o **CANCELAR** para abortar
7. **Introduce tu contraseña** si te la solicita el sistema
8. **¡Listo!** El archivo se elimina directamente

> 💡 **Nota:** No se abre ninguna ventana nueva de terminal.

---

## 🖥️ Compatibilidad

| Distribución | Estado | Versión Mínima |
|---|---|---|
| 🟢 Zorin OS | ✅ Probado | 16+ |
| 🟢 Ubuntu | ✅ Compatible | 20.04+ |
| 🟢 Linux Mint | ✅ Compatible | 20+ |
| 🟢 Debian | ✅ Compatible | 10+ |
| 🟢 Pop!_OS | ✅ Compatible | 20.04+ |
| 🟢 Fedora | ✅ Compatible | 33+ |

---

## Requisitos

### Obligatorios:
- **Nautilus** (Archivos de GNOME) — `gnome-shell` o similar
- **zenity** — para diálogos gráficos
- **python3-nautilus** — extensión de Python para Nautilus
- **sudo** — acceso de administrador

### Instalación de Dependencias

**Ubuntu/Debian/Linux Mint/Zorin OS:**
```bash
sudo apt update
sudo apt install nautilus zenity python3-nautilus
```

**Fedora:**
```bash
sudo dnf install nautilus zenity python3-nautilus
```

**Arch Linux:**
```bash
sudo pacman -S nautilus zenity python-nautilus
```

---

## 🗑️ Desinstalación

```bash
sudo ./uninstall.sh
```

Luego:
1. Cierra sesión
2. Vuelve a iniciar sesión
3. O reinicia tu sistema

### Desinstalación Manual

```bash
sudo rm /usr/local/bin/nautilus-admin-delete-ES.sh
rm ~/.local/share/nautilus/scripts/delete-as-admin.desktop
nautilus -q  # Reinicia Nautilus
```

---

## 🎨 Personalización

Puedes modificar colores, texto, tamaño y comportamiento editando el script principal:

```bash
sudo nano /usr/local/bin/nautilus-admin-delete.sh
```

### Colores Disponibles

| Código | Color | Uso |
|---|---|---|
| `#CC0000` | Rojo intenso | ⚠️ Advertencias críticas |
| `#FF6600` | Naranja | ⚠️ Advertencias normales |
| `#990000` | Rojo oscuro | 🔴 Errores |
| `#333333` | Gris oscuro | ℹ️ Información |
| `#0066CC` | Azul | ✅ Confirmación |

### Variables Personalizables

```bash
# Título del diálogo
TITLE="Eliminar como Administrador"

# Altura y anchura del diálogo
HEIGHT=300
WIDTH=500

# Colores
WARNING_COLOR="#CC0000"
```

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Sigue estos pasos:

1. **Haz fork** del repositorio
```bash
git clone https://github.com/tu-usuario/Nautilus-clickderecho-Administrador-3estados.git
cd Nautilus-clickderecho-Administrador-3estados
```

2. **Crea una rama** para tu feature
```bash
git checkout -b feature/nueva-funcion
```

3. **Realiza tus cambios** y haz commits descriptivos
```bash
git commit -am 'Añadir nueva función: descripción'
```

4. **Sube la rama**
```bash
git push origin feature/nueva-funcion
```

5. **Abre una Pull Request** en GitHub

### Directrices de Contribución

- Escribe código limpio y documentado
- Prueba en al menos 2 distribuciones de Linux
- Usa comentarios en español o inglés según corresponda
- Sigue el formato de commits existente
- Actualiza el README.md si añades nuevas features

---

## 🐛 Reporte de Problemas

¿Encontraste un bug? ¡Abre un issue!

Incluye:
- Tu distribución de Linux y versión
- Versión de Nautilus (`nautilus --version`)
- Pasos para reproducir el problema
- Mensajes de error completos
- Screenshot si es relevante

---

## 📚 Estructura del Proyecto

```
Nautilus-clickderecho-Administrador-3estados/
├── README.md                    # Este archivo
├── install.sh                   # Script de instalación
├── uninstall.sh                 # Script de desinstalación
├── nautilus-admin-delete.sh     # Script principal
├── Advertencias.png             # Captura de pantalla
└── LICENSE                      # Licencia MIT
```

---

## 📄 Licencia

**MIT License** — Libre para usar, modificar y distribuir.

```
MIT License

Copyright (c) 2024 Bogdan Saniuta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```

Para más detalles, ver el archivo `LICENSE`.

---

## 🙏 Créditos

| Aspecto | Detalles |
|---|---|
| **Autor** | Bogdan Saniuta |
| **Sistema** | Zorin OS |
| **Inspiración** | Función "Ejecutar como administrador" de Windows |
| **Año** | 2024 |

---

## ⚠️ Aviso de Seguridad

**⚠️ ADVERTENCIA:** Usa esta herramienta con precaución.

- Los archivos eliminados **NO se pueden recuperar** (se eliminan permanentemente)
- Requiere acceso de **administrador (sudo)**
- Verifica siempre qué archivo estás a punto de eliminar
- No la uses en archivos del sistema a menos que sepas qué haces
- Los errores pueden causar pérdida de datos

**Usar bajo tu propia responsabilidad.**

---

## 📞 Contacto y Soporte

¿Preguntas o sugerencias?

- 📧 Abre un **Issue** en GitHub
- 💬 Revisa las **Discussions** del proyecto
- 🔗 Visita el [repositorio original](https://github.com/bogdansaniuta/Nautilus-clickderecho-Administrador-3estados)

---

## 📈 Roadmap (Futuras Características)

- [ ] Soporte para Caja (MATE) y Thunar (XFCE)
- [ ] Opción de mover archivos a papelera en lugar de eliminar
- [ ] Historial de archivos eliminados
- [ ] Interfaz gráfica de configuración
- [ ] Soporte para múltiples idiomas (i18n)
- [ ] Logs de actividad

---

## 🎓 Aprende Más

- [Nautilus Extensions](https://wiki.gnome.org/Apps/Files)
- [Zenity Documentation](https://help.gnome.org/users/zenity/)
- [Shell Scripting Guide](https://www.gnu.org/software/bash/manual/)

---

**⭐ Si te resultó útil, por favor dale una estrella ⭐**

Última actualización: 2024
