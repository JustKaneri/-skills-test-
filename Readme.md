# Задача: 

> Реализовать сервис с JSON - сервис для предоставления информации о списке товаров, а также возможностью заказа/удаления товара и заказа.

## Описание:

> Asp.net core 6;


> Ms Sql Server 2017;


## Доп. библиотеки

> ADO.NET Entity Framework;


> AutoMapper;


## Установка

1. Запустить скрипт для базы данных (script.sql).

2. Отредактировать строку подключения в файле appsettings.json.

3. Запустить проект.

## EndPoints:
> Получить все продукты (Get) 
	url = http://localhost:5017/api/products
	Результат при наличии данных: 
	```json
		[
		  {
		    "id": 0,
		    "name": "string",
		    "count": 0,
		    "price": 0
		  }
		]
	```
	
> Удалить продукт (Delete)
    url = http://localhost:5017/api/product/{id}
    {id} = Идентификатор продукта
    При успешном удалении продукта результат запроса будет:
    ```json
    {
      "id": 0,
      "name": "string",
      "count": 0,
      "price": 0
    }
    ```
 
> Получить все заказы (Get)
    url = http://localhost:5017/api/orders
    Результат при наличии данных:
    ```json
        [
          {
            "id": 0,
            "userId": 0,
            "productId": 0,
            "count": 0,
            "date_Order": "2023-02-20T18:26:19.299Z",
            "user": {
              "id": 0,
              "name": "string"
            },
            "product": {
              "id": 0,
              "name": "string",
              "count": 0,
              "price": 0
            }
          }
        ]
    ```
   
> Удалить заказ (Delete)
    url = http://localhost:5017/api/order/{id}
    {id} = Идентификатор заказа
    При успешном удалении заказа результат запроса будет:
    ```json
    {
      "id": 0,
      "userId": 0,
      "productId": 0,
      "count": 0,
      "date_Order": "2023-02-20T18:28:41.155Z",
      "user": {
        "id": 0,
        "name": "string"
      },
      "product": {
        "id": 0,
        "name": "string",
        "count": 0,
        "price": 0
      }
    }
    ```
 
> Создать заказ (Post)
    url = http://localhost:5017/api/order
    Принимает json:
    ```json
    {
      "userId": 0,
      "productId": 0,
      "count": 0,
      "date_Order": "2023-02-20T18:30:25.182Z"
    }
    ```
    При успешном создание результат запроса будет:
    ```json
    {
      "id": 0,
      "userId": 0,
      "productId": 0,
      "count": 0,
      "date_Order": "2023-02-20T18:28:41.155Z",
      "user": {
        "id": 0,
        "name": "string"
      },
      "product": {
        "id": 0,
        "name": "string",
        "count": 0,
        "price": 0
      }
    }
    ```