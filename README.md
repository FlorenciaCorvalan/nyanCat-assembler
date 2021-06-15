# Lab Org. y Arq. de Computadoras

* Configuración de pantalla: `640x480` pixels, formato `ARGB` 32 bits.
* El registro `X0` contiene la dirección base del FrameBuffer (Pixel 1)
* El archivo _start.s_ contiene la inicialización del FrameBuffer, al finalizar llama a _app.s_
* Nuestro código pinta al simpático Nyan Cat, con su animación incluida!

![ Nyan Cat](nyan.gif)

## Estructura

* **[app.s](app.s)** Este archivo contiene la aplicación. Todo el hardware ya está inicializado anteriormente.
* **[start.s](start.s)** Este archivo realiza la inicialización del hardware.
* **[Makefile](Makefile)** Archivo que describe cómo construir el software _(qué ensamblador utilizar, qué salida generar, etc.)_
* **[memmap](memmap)** Este archivo contiene la descripción de la distribución de la memoria del programa y dónde colocar cada sección.
* **README.md** este archivo.

## Uso

El archivo _Makefile_ contiene lo necesario para construir el proyecto.

**Para correr el proyecto ejecutar**

```bash
$ make run
```
Esto construirá el código y ejecutará qemu para su emulación.

Si indica que falta alguna dependencia para correrlo, basta con instalarla con su nombre de paquete correspondiente.
