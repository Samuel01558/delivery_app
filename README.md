# Delivery App

Esta es una aplicación móvil basada en Flutter para la entrega de comida. La aplicación incluye características como autenticación de usuarios, un carrito de compras y una pantalla de inicio.

## Tabla de Contenidos

- [Introducción](#introducción)
- [Instalación](#instalación)
- [Ejecución](#ejecución)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Funcionalidades](#funcionalidades)
- [Proveedores](#proveedores)
- [Tema](#tema)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Introducción

Este proyecto tiene como objetivo proporcionar una solución eficiente y fácil de usar para la entrega de alimentos. Utiliza Flutter para la interfaz de usuario y Firebase para la autenticación.

## Instalación

### Prerrequisitos

- Flutter SDK
- Dart SDK
- Un IDE como Visual Studio Code o Android Studio

### Pasos

1. Clona el repositorio:
    ```sh
    git clone https://github.com/tuusuario/delivery_app.git
    ```
2. Navega al directorio del proyecto:
    ```sh
    cd delivery_app
    ```
3. Instala las dependencias:
    ```sh
    flutter pub get
    ```

## Ejecución

Para ejecutar la aplicación en un emulador o un dispositivo físico, usa el siguiente comando:
```sh
flutter run
```

## Estructura del Proyecto

- `lib/main.dart`: El punto de entrada principal de la aplicación.
- `lib/screens/login_screen.dart`: La pantalla de inicio de sesión de la aplicación.
- `lib/providers/auth_provider.dart`: Proveedor para la lógica de autenticación.
- `lib/providers/cart_provider.dart`: Proveedor para la gestión del carrito.
- `lib/theme/app_theme.dart`: Contiene los datos del tema para la aplicación.

## Funcionalidades

### Pantalla de Inicio (SplashScreen)

La pantalla de inicio se muestra cuando se lanza la aplicación. Muestra el logo de la aplicación y un indicador de carga durante 3 segundos antes de navegar a la pantalla de inicio de sesión.

```dart
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 200, 
              height: 200, 
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
```

## Proveedores

### AuthProvider

Maneja la lógica de autenticación de usuarios utilizando Firebase Authentication.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      notifyListeners();
    } catch (e) {
      // Manejar errores de autenticación
      print(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }

  // ...otros métodos de autenticación...
}
```

### CartProvider

Gestiona el estado del carrito de compras.

## Tema

La aplicación utiliza un tema claro personalizado definido en `lib/theme/app_theme.dart`.

## Contribuciones

Las contribuciones son bienvenidas. Por favor, abre un issue o un pull request para discutir cualquier cambio que desees realizar.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE) para más detalles.
