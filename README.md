# Flutter Technical Test

Este es un proyecto de prueba técnica en Flutter.

## Requisitos

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio)
- [JDK 11](https://adoptium.net/) - Descargar y configurar `JAVA_HOME` a `C:\Program Files\Java\openlogic-openjdk-11.0.23+9-windows-x64`

## Configuración del Entorno

1. **Configurar Variables de Entorno**:
    - Crea un archivo `.env` en la carpeta `assets` del proyecto y añade tu API Key:
      ```
      API_KEY=tu_api_key
      ```

2. **Instalar Flutter y Dart**: Sigue las [instrucciones de instalación de Flutter](https://flutter.dev/docs/get-started/install).

3. **Instalar Android Studio**: 
    - Descarga e instala [Android Studio](https://developer.android.com/studio).
    - Durante la instalación, asegúrate de instalar el SDK de Android y crear un dispositivo virtual para emulación.
    - Añade los plugins necesarios en Android Studio:
      - **Flutter**: [Instalación del Plugin Flutter](https://flutter.dev/docs/get-started/editor).
      - **Dart**: [Instalación del Plugin Dart](https://dart.dev/tools/dart-vm).

4. **Configurar el JDK**:
    - Descarga e instala [OpenJDK 11](https://adoptium.net/).
    - Configura la variable de entorno `JAVA_HOME` a la ruta de instalación del JDK:
      - Ejemplo: `C:\Program Files\Java\openlogic-openjdk-11.0.23+9-windows-x64`.

## Clonar y Ejecutar el Proyecto

1. **Clonar el Repositorio**:
    ```sh
    git clone https://github.com/RonaldBecerra/Flutter_Technical_Test.git
    cd Flutter_Technical_Test
    ```

2. **Instalar Dependencias**:
    ```sh
    flutter pub get
    ```

3. **Ejecutar el Proyecto**:
    ```sh
    flutter run
    ```

## Recursos Adicionales

- [Documentación de Flutter](https://docs.flutter.dev/)
- [Cookbook: Ejemplos Útiles de Flutter](https://docs.flutter.dev/cookbook)
- [Codelab: Escribe tu Primera Aplicación Flutter](https://docs.flutter.dev/get-started/codelab)

