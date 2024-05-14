/**
 * Created by Yusuf.Acar on 22/04/2024.
 */

@RestResource(UrlMapping='/v2/event-meetings/*')
global class EventRestService2 {
    public static final String NO_RECORDS_FOUND = 'No Records Found';
    public static final String LIST_HAS_NO_ROWS = 'List has no rows';
    public static final String INVALID_ID = 'Invalid id';
    public static final String REQUIRED_FIELD_MISSING = 'REQUIRED_FIELD_MISSING';
    public static final String CANNOT_DESERIALIZE_INSTANCE = 'Cannot deserialize instance';
    public static final String VALIDATION_EXCEPTION = 'VALIDATION_EXCEPTION';
    public static final String EVENT_CREATED = 'Event is created';

    public static String recordId ;
    public static Event__c newEvent;
    public static Event__c event;

    public static RestRequest request = RestContext.request;
    public static RestResponse response = RestContext.response;

    public static Map<String, Object> responseBodyMap = new Map<String, Object>();
    public static Map<String, Object> requestBodyMap = new Map<String, Object>();
    public static Map<String, Object> eventMapById = new Map<String, Object>();

    @HttpGet
    global static void getEvents() {
        System.debug('getEvents method is start ');

        try {
            //Send data in JSON format. Otherwise, the data goes as text format.
            response.addHeader('Content-Type', 'application/json');

            //Get path variable from Endpoint after '/event-meetings/' section
            recordId = request.requestURI.substringAfter('/event-meetings/');

            //Event__c SOQL by Salesforce Record Id
            event = new EventsSelector().selectEventById(recordId);

            //Call the successful response method and get a filled response
            setSuccessfulResponse('GET');
         

        } catch (Exception error) {
            System.debug('error: '+error.getMessage());
            System.debug('error line number: '+error.getLineNumber());

            //Call the unsuccessful response method and get a filled response
            setUnsuccessfulResponse(error.getMessage());
        }

        System.debug('getEvents method is end ');

    }

    @HttpPost
    global static void createEvent() {
        System.debug('createEvent method is start ');
        try {
            //Send data in JSON format. Otherwise, the data goes as text format.
            response.addHeader('Content-Type', 'application/json');

            //Call the event insert helper method
            createEventHelper(request);

            //Call the successful response method and get a filled response
            setSuccessfulResponse('POST');
        } catch (Exception error) {
            System.debug('error  : ' + error.getMessage());
            System.debug('error line number: '+error.getLineNumber());

            //Call the unsuccessful response method and get a filled response
            setUnsuccessfulResponse(error.getMessage());
        }

        System.debug('createEvent method is end ');
    }

    //POST Helper Method Inserting Event
    private static void createEventHelper(RestRequest request) {
        newEvent = (Event__c) JSON.deserialize(request.requestBody.toString(), Event__c.class);
        System.debug('newEvent : ' + newEvent);
        insert newEvent;
    }

    @HttpPut
    global static void updateEventWithPut() {
        System.debug('updateEventWithPut method is start ');
        try {
            //Send data in JSON format. Otherwise, the data goes as text format.
            response.addHeader('Content-Type', 'application/json');

            //Get path variable from Endpoint after '/event-meetings/' section
            recordId = request.requestURI.substringAfter('/event-meetings/');

            //Event__c SOQL by Salesforce Record Id
            event = new EventsSelector().selectEventById(recordId);

            //Call the event update helper method
            updateEventPUTHelper();

            //Call the successful response method and get a filled response
            setSuccessfulResponse('PUT');


        } catch (Exception error) {
            //Call errorHandler method and get a filled response
             System.debug('error: '+error.getMessage());
             System.debug('error line number: '+error.getLineNumber());

            //Call the unsuccessful response method and get a filled response
            setUnsuccessfulResponse(error.getMessage());
        }
        System.debug('updateEventWithPut method is end ');
    }

    //PUT Helper Method Updating Event
    private static void updateEventPUTHelper() {
        eventMapById = (Map<String, Object>) JSON.deserializeUntyped(JSON.serialize(event));
        requestBodyMap = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());

        //Assign requested ApiNames and values to existing account
        for(String fieldApiName : requestBodyMap.keySet()){
            if (fieldApiName != 'Id' && fieldApiName !='OwnerId' ) {
                eventMapById.put(fieldApiName, requestBodyMap.get(fieldApiName));
            }
        }

        //If the request does not contain the ApiName in the current record, set the value to null
        for(String fieldApiName : eventMapById.keySet()){
            if (!requestBodyMap.containsKey(fieldApiName) && (fieldApiName != 'Id' && fieldApiName !='OwnerId') ) {
                eventMapById.put(fieldApiName, null);
            }
        }

        event = (Event__c) JSON.deserialize(JSON.serialize(eventMapById), Event__c.class);
        update event;
    }

    @HttpPatch
    global static void updateEventWithPatch() {
        System.debug('updateEventWithPatch method is start ');
        try {
            //Send data in JSON format. Otherwise, the data goes as text format.
            response.addHeader('Content-Type', 'application/json');

            //Get path variable from Endpoint after '/event-meetings/' section
            recordId = request.requestURI.substringAfter('/event-meetings/');

            //Event__c SOQL by Salesforce Record Id
            event = new EventsSelector().selectEventById(recordId);

            //Call the event update helper method
            updateEventPATCHHelper();

            //Call the successful response method and get a filled response
            setSuccessfulResponse('PATCH');

        } catch (Exception error) {
            System.debug('error: '+error.getMessage());
            System.debug('error line number: '+error.getLineNumber());

            //Call the unsuccessful response method and get a filled response
            setUnsuccessfulResponse(error.getMessage());
        }
        System.debug('updateEventWithPatch method is end ');
    }

    //PATCH Helper Method Updating Event
    private static void updateEventPATCHHelper() {
        System.debug('updateEventPATCHHelper method is start ');
        event = (Event__c) JSON.deserialize(request.requestBody.toString(), Event__c.class);
        event.Id = recordId;
        update event;
        System.debug('updateEventPATCHHelper method is end ');
    }

    //Successful Response Generic Method
    private static void setSuccessfulResponse(String httpMethodName) {
        System.debug('setSuccessfulResponse method is start ');

        switch on httpMethodName{
            when 'GET' {
                responseBodyMap.put('Id', event.Id);
                responseBodyMap.put('Name', event.Name);
                responseBodyMap.put('EventType__c', event.EventType__c);
                responseBodyMap.put('EventStartTime__c', event.EventStartTime__c);
                responseBodyMap.put('EventEndTime__c', event.EventEndTime__c);

                response.statusCode = 200 ;
                response.responseBody = Blob.valueOf(JSON.serialize(responseBodyMap));
            }
            when 'POST' {
                responseBodyMap.put('Id', newEvent.Id);
                responseBodyMap.put('message', EVENT_CREATED);

                response.statusCode = 201;
                response.responseBody = Blob.valueOf(JSON.serialize(responseBodyMap));

            }
            when 'PUT' {
                response.statusCode = 204;

            }
            when 'PATCH'{
                response.statusCode = 204;

            }
        }

        System.debug('setSuccessfulResponse method is end ');
    }

    //Unsuccessful Response Generic Method
    private static void setUnsuccessfulResponse(String message) {

        if (message.containsIgnoreCase(NO_RECORDS_FOUND) || message.containsIgnoreCase(LIST_HAS_NO_ROWS) ) {
            responseBodyMap.put('error', message);
            RestContext.response.statusCode = 404;
        } else if (message.containsIgnoreCase(INVALID_ID) || message.contains(REQUIRED_FIELD_MISSING) || message.contains(CANNOT_DESERIALIZE_INSTANCE) || message.containsIgnoreCase(VALIDATION_EXCEPTION)) {
            responseBodyMap.put('error', message);
            response.statusCode = 400;
        } else {
            responseBodyMap.put('error', message);
            response.statusCode = 500;
        }

        response.responseBody = Blob.valueOf(JSON.serialize(responseBodyMap));
    }
}