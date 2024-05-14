/**
 * Created by Acar on 18/03/2024.
 */

public with sharing class EventsSelector extends fflib_SObjectSelector {
    public List<SObjectField> getSObjectFieldList() {
        return new List<SObjectField>{
                Event__c.Id,
                Event__c.Name,
                Event__c.CreatedDate,
                Event__c.LastModifiedDate,
                Event__c.EventStartTime__c,
                Event__c.EventEndTime__c,
                Event__c.EventType__c,
                Event__c.OwnerId
        };
    }
    public SObjectType getSObjectType() {
        return Event__c.SObjectType;
    }


    public List<Event__c> selectEventsById(Set<Id> idS) {
        return (List<Event__c>)
                Database.query(
                        newQueryFactory().setCondition('Id in :ids').toSOQL());
    }

    public Event__c selectEventById(String id) {
        return
                Database.query(
                        newQueryFactory().setCondition('Id = :id').toSOQL());
    }
}