![ApiImage](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApiImage.jpg)


# RESTful APIs: Implementing HTTP Methods in Salesforce and Testing with Postman Collection  1

. With this study, we will learn the **REST API** working principle, a postman collection that we created by learning **HTTP** methods, and how these methods work by creating records on Salesforce and updating existing records.

. While doing these, we will learn structures such as **JSON**, **request**, **response**, **body** on **Postman** and run our tests with the opportunities **Postman** provides us.



## Understanding the Data Model

![DataModel](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/UnderstandingDataModel.png)
 
The data model of our work is like this. We see the areas of the **Event** and **Participant** objects, fields and their relationship with each other in the visual.

In this study, we will only deal with the **Event** object.




## HTTP GET Method
![Postman_Get](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/Postman_Get.gif)

**GET** method is a frequently used method in the **HTTP** protocol. Its function is to retrieve a specified resource. A **GET** request is generally used to retrieve data from the server and does not contain a request body. Instead, a **URI** (Uniform Resource Identifier) is sent that identifies the requested resource.

•	**Get** method only retrieve data.

•	Parameters in headers & URL in **Get** method.

•	**Get** method does not have a request body.

•	**Get** method can be called many times.

![ApexGet](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApexGetMethod.png)

### Response Codes:

•	For successful **GET** method transactions We return a response body containing account information and the “**200 OK**” Response Code.

•	For unsuccessful **GET** method transactions We return the “**404 Not Found**” Response Code and error message in the response body.




## HTTP POST Method

 ![Postman_POST](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/Postman_Post.gif)

The **HTTP POST** method is an **HTTP** method that a client uses to send data to a server. This method is typically used to pass user-supplied data to a server via a web form, but can also be used to send data via APIs.

• Posting a message to a bulletin board, newsgroup, mailing list.

• Adding a new user through a signup modal.

• Extending a database through an append operation.

• Providing a block of data, such as the result of submitting a form, to a data-handling process.

  ![APEX_POST](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApexPostMethod.png)

### Response Codes:

•	For successful **POST** method transactions, We return a response body containing account information and the “**201 Created**” Response Code.

•	For unsuccessful **POST** method transactions, We return the “**400 Bad Request**” and “**500 Internal Server Error**” Response Code and error message in the response body.




## HTTP PUT Method

 ![HTTP_PUT](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/HTTPPutMethod.png)

•	The **HTTP PUT** request method usually replaces the record it represents with the request it sends

•	According to the scenario, if the record it represents does not exist, it also performs the **CREATE** operation and continues its function as **UPSERT**.

•	Sent fields are updated, unsent fields are set to null and the entire record is renewed with the request body.

  ![APEX_PUT](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApexPutMethod.png)

### Response Codes:

•	For successful **PUT** method transactions, We return a response text with no response body and only the "**204 No Content**" Response Code.

•	For unsuccessful **PUT** method transactions, We return the "**404 Not Found**", "**400 Bad Request**" and "**500 Internal Server Error**" Response Code and error message in the response body.

 



## HTTP PATCH Method

 ![HTTP_PATCH](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/HTTPPatchMethod.png)
 
•	The **HTTP PATCH** request method updates the fields of the record it represents in the request sent. It does not make any changes to other fields that are not sent.

•	**HTTP PATCH** method is used only for **UPDATE** operation. 

  ![APEX_PATCH](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApexPatchMethod.png)

  ![APEX_RESPONSE](https://github.com/yusufacarr18/REST-API-Integration-HTTP-Methods-In-Salesforce-with-Postman-Testing/blob/main/images/ApexResponseMethod.png)

### Response Codes:

•	For successful **PATCH** method transactions, We return a response text with no response body and only the "**204 No Content**" Response Code.

•	For unsuccessful **PATCH** method transactions, We return the "**404 Not Found**", "**400 Bad Request**" and "**500 Internal Server Error**" Response Code and error message in the response body.





 


