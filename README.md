# Flutter Technical Test

Este es un proyecto de prueba técnica en Flutter.

## Requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio)
- [JDK 11](https://adoptium.net/) - Descargar y configurar `JAVA_HOME` a `C:\Program Files\Java\openlogic-openjdk-11.0.23+9-windows-x64`

## Configuración del Entorno

1. **Configurar el JDK**:
    - Descarga e instala [OpenJDK 11](https://adoptium.net/).
    - Configura la variable de entorno `JAVA_HOME` a la ruta de instalación del JDK:
      - Ejemplo: `C:\Program Files\Java\openlogic-openjdk-11.0.23+9-windows-x64`.

2. **Instalar Flutter y Dart**: Sigue las [instrucciones de instalación de Flutter](https://flutter.dev/docs/get-started/install).

3. **Instalar Android Studio**: 
    - Descarga e instala [Android Studio](https://developer.android.com/studio).
    - Durante la instalación, asegúrate de instalar el SDK de Android y crear un dispositivo virtual para emulación.
    - Añade los plugins necesarios en Android Studio:
      - **Flutter**: [Instalación del Plugin Flutter](https://flutter.dev/docs/get-started/editor).
      - **Dart**: [Instalación del Plugin Dart](https://dart.dev/tools/dart-vm).

## Clonar y Ejecutar el Proyecto

1. **Clonar el Repositorio**:
    ```sh
    git clone https://github.com/RonaldBecerra/Flutter_Technical_Test.git
    cd Flutter_Technical_Test
    ```

2. **Configurar Variable de Entorno**:
    - Crea un archivo `.env` en la carpeta `assets` del proyecto y añade tu API Key:
      ```
      API_KEY=tu_api_key
      ```
    - Ejemplo: API_KEY=bf123456a

2. **Instalar Dependencias**:
    ```sh
    flutter pub get
    ```

3. **Ejecutar el Proyecto**:
    ```sh
    flutter run
    ```

    - Normalmente pide el navegador en el que se va a emular (Chrome, Edge).
    - También se puede abrir el proyecto en Android Studio y ejecutarlo con el botón RUN de la barra de herramientas superior.
