global with sharing class BulkDataLoad implements Database.Batchable<sobject>, Database.Stateful {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'SELECT Address, AnnualRevenue, City, Company, IsConverted, ConvertedAccountId, ConvertedContactId, ConvertedDate, ConvertedOpportunityId, Country, CreatedById, CreatedDate, Jigsaw, IsDeleted, Description, Email, EmailBouncedDate, EmailBouncedReason, NumberOfEmployees, FirstName, Name, GeocodeAccuracy, IndividualId, Industry, JigsawContactId, LastActivityDate, LastModifiedById, LastModifiedDate, LastName, LastReferencedDate, LastViewedDate, Latitude, LeadSource, Longitude, MasterRecordId, OwnerId, Phone, PhotoUrl, Rating, Salutation, State, Status, Street, SystemModstamp, ' +
            'Text_Area_Long_0__c, Text_Area_Long_1__c, Text_Area_Long_2__c, Text_Area_Long_3__c, Text_Area_Long_4__c, Text_Area_Long_5__c, Title, IsUnreadByOwner, Website, PostalCode FROM Lead where createddate < 2022-11-07T00:17:51.000+0000';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.batchableContext bc, List<sobject> leadsData ) { 
        List<Lead> leads = new List<Lead>();
        
        for( sobject leadData : leadsData ) {
            Lead lead = new Lead();
            
            lead.LastName = ((Lead)leadData).LastName;
            lead.Company = '6 text area fields';
            lead.Text_Area_Long_0__c = ((Lead)leadData).Text_Area_Long_0__c;
            lead.Text_Area_Long_1__c = ((Lead)leadData).Text_Area_Long_1__c;
            lead.Text_Area_Long_2__c = ((Lead)leadData).Text_Area_Long_2__c;
            lead.Text_Area_Long_3__c = ((Lead)leadData).Text_Area_Long_3__c;
            lead.Text_Area_Long_4__c = ((Lead)leadData).Text_Area_Long_4__c;
            lead.Text_Area_Long_5__c = ((Lead)leadData).Text_Area_Long_5__c;
            
            leads.add(lead);
        }
        
        insert leads;
    }
    
    global void finish(Database.batchableContext bc) {
    }
}