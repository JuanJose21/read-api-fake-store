# Read API Fake Store

## Descripción de la Aplicación

Esta es una aplicación en Dart que consume el [API Fake Store](https://fakestoreapi.com/). La aplicación está diseñada para el manejo de errores utilizando la librería `dartz` y su tipo `Either`. La estructura de datos está definida según el API para poder tener todos los datos.

## Diseño de los Modelos de Datos

Los modelos de datos están diseñados para representar los productos obtenidos de la API.
Los modelos se encuentran en `lib/src/models/*`.

### ProductModel:

- `id`: (opcional) Identificador único del producto.
- `title`: Título del producto.
- `price`: Precio del producto.
- `description`: Descripción del producto.
- `category`: Categoría del producto.
- `image`: URL de la imagen del producto.
- `rating`: (opcional) Calificación del producto.

### CartModel:

- `id`: Identificador único del carrito.
- `userId`: Id del usuario.
- `date`: Fecha en la que se creo el carrito.
- `products`: Listado de productos agregados en el carrito.

## Solicitud y Procesamiento de la API

La solicitud a la API se realiza utilizando la librería `http`. La respuesta de la API se procesa para crear instancias de `ProductModel`. Se implementa un control de errores robusto utilizando `Either` de la librería `dartz`.
El consumo de servicios se encuentra en `lib/src/services/*`.

## Implementación del Control de Errores con `Either`

El tipo `Either` se usa para manejar errores de manera más funcional y clara.
La implementación de Either se encuentra en `lib/src/services/*` donde cada uno de los servicios retorna Right o Left según sea el caso.

## Requisitos

- Dart: Versión 3.4.3
- Dependencias en `pubspec.yaml`:
  ```yaml
  dependencies:
    dartz: ^0.10.1
    http: ^1.2.1
  ```

## Ejecución

Para ejecutar la aplicación, usa el siguiente comando:

```bash
dart run
```

Esto obtendrá los productos, los carritos de compra y creara un nuevo producto usando la API y los mostrará en la consola, manejando cualquier error que pueda ocurrir durante el proceso.
