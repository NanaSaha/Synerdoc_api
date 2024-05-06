   require 'csv' 

 ActiveRecord::Base.establish_connection(
    adapter:  'mysql2',
    host:     'localhost',
    username: 'saha',
    password: 'password',
    database: 'synerdoc'
)


class Associate < ActiveRecord::Base
  self.table_name = 'associates'

   def self.retrieve_associates

    select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  end

  def self.retrieve_single_associate(url)

  

  puts  physic_obj = Associate.where(url: url).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
    
   
   phys_address_arr = []
     physic_obj.each do |item| 
   
      puts  home_obj = Agency.where(url: item.homeAgency).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
       puts  org_obj = Organization.where(url: item.organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       puts  super_obj = Associate.where(url: item.supervisor).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
 


    phys_address_arr << {"id": item.id, "organization_details": org_obj, "agency_details": home_obj,"supervisor_details": super_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"ssn": item.ssn,"birthDate": item.birthDate,"race": item.race,"email": item.email,"mobileEmail": item.mobileEmail,"schedulingRank": item.schedulingRank,"classification": item.classification,"discipline": item.discipline,"hireDate": item.hireDate,"startDate": item.startDate,"supervisor": item.supervisor,
      "homeAgency": item.homeAgency,"associateNumber": item.associateNumber,"associateNPI": item.associateNPI, "evvVendorID": item.evvVendorID,"evvAdminEmail": item.evvAdminEmail,"status": item.status,"image": item.image,"url": item.url,"statusReason": item.statusReason,"statusDate": item.statusDate,"eligibleForRehire": item.eligibleForRehire,"gender": item.gender,"organizationUrl": item.organizationUrl}
    end
    return phys_address_arr 

  end

   def self.retrieve_associate_with_organizationUrl(organizationUrl)

    
    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")

    puts  physic_obj = Associate.where(organizationUrl: organizationUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
    
   
   phys_address_arr = []
     physic_obj.each do |item| 
   
      puts  home_obj = Agency.where(url: item.homeAgency).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
    
    phys_address_arr << {"id": item.id, "organization_details": org_obj, "agency_details": home_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"ssn": item.ssn,"birthDate": item.birthDate,"race": item.race,"mobileEmail": item.mobileEmail,"email": item.email,"schedulingRank": item.schedulingRank,"classification": item.classification,"discipline": item.discipline,"hireDate": item.hireDate,"startDate": item.startDate,"supervisor": item.supervisor,
      "homeAgency": item.homeAgency,"associateNumber": item.associateNumber,"associateNPI": item.associateNPI, "evvVendorID": item.evvVendorID,"evvAdminEmail": item.evvAdminEmail,"status": item.status,"image": item.image,"url": item.url,"statusReason": item.statusReason,"statusDate": item.statusDate,"eligibleForRehire": item.eligibleForRehire,"gender": item.gender,"organizationUrl": item.organizationUrl}
    end
    return phys_address_arr 

  end

   def self.delete_associate(url)

    Associate.where(url: url).delete

  end


   def self.retrieve_associate_payrates_with_organizationUrl(organizationUrl)

    
    # puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")

    puts  physic_obj = Associate.where(organizationUrl: organizationUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

       

    
   
   phys_address_arr = []
     physic_obj.each do |item| 

    

       puts  payRate_obj = Payrate.where(associateUrl: item.url).select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate")
  
    
    phys_address_arr << {"id": item.id,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"ssn": item.ssn,"birthDate": item.birthDate,"race": item.race,"mobileEmail": item.mobileEmail,"email": item.email,"schedulingRank": item.schedulingRank,"classification": item.classification,"discipline": item.discipline,"hireDate": item.hireDate,"startDate": item.startDate,"supervisor": item.supervisor,
      "homeAgency": item.homeAgency,"associateNumber": item.associateNumber,"associateNPI": item.associateNPI, "evvVendorID": item.evvVendorID,"evvAdminEmail": item.evvAdminEmail,"status": item.status,"image": item.image,"url": item.url,"statusReason": item.statusReason,"statusDate": item.statusDate,"eligibleForRehire": item.eligibleForRehire,"gender": item.gender,"organizationUrl": item.organizationUrl,  "payRate": payRate_obj}
    end
    return phys_address_arr 

  end

end




#######Physician
class Physician < ActiveRecord::Base
  self.table_name = 'physicians'

   def self.retrieve_physician

    select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")
  end

  def self.retrieve_single_physician(url)

    # select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated").where(
    # "url = ?","#{url}"
    # )

    
    puts  physic_obj = Physician.where(url: url).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")
    
     phys_address_arr = []
     physic_obj.each do |item| 

      puts  org_obj = Organization.where(url: item.organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")


        puts associate_obj  = Associate.where(url: item.salesRep).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
  

    phys_address_arr << {"id": item.id, "organization_details": org_obj,"salesRep_details": associate_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"title": item.title,"speciality": item.speciality,"email": item.email,"physicianGroup": item.physicianGroup,"endDate": item.endDate,"startDate": item.startDate,"status": item.status,"url": item.url,"salesRep": item.salesRep,"updated": item.updated}
    end
    return phys_address_arr 
  end

  def self.retrieve_physician_with_organizationUrl(organizationUrl)

     puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")

    puts  physic_obj = Physician.where(organizationUrl: organizationUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")
    
     phys_address_arr = []
     physic_obj.each do |item| 

        puts associate_obj  = Associate.where(url: item.salesRep).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
   
   

    phys_address_arr << {"id": item.id, "organization_details": org_obj,"salesRep_details": associate_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"title": item.title,"speciality": item.speciality,"email": item.email,"physicianGroup": item.physicianGroup,"endDate": item.endDate,"startDate": item.startDate,"status": item.status,"url": item.url,"salesRep": item.salesRep,"updated": item.updated}
    end
    return phys_address_arr 
  end

   def self.delete_physicians(url)

    Physician.where(url: url).delete

  end
end


####### Facilties
class Facility < ActiveRecord::Base
  self.table_name = 'facilities'

   def self.retrieve_facilities

    select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,
      patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
  end

  def self.retrieve_single_facility(url)

    # select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated").where(
    # "url = ?","#{url}"
    # )


    puts fac_obj = Facility.where(url: url).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
    
     
     
     phys_address_arr = []
     fac_obj.each do |item| 

      puts  org_obj = Organization.where(url: item.organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    

      puts associate_obj  = Associate.where(url: item.salesRep).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
    phys_address_arr << {"id": item.id,"organization_details": org_obj, "salesRep_details": associate_obj,"facilityName": item.facilityName, "facilityType": item.facilityType,"email": item.email, "salesRep": item.salesRep, "endDate": item.endDate, "startDate": item.startDate,"status": item.status,"url": item.url, "organizationUrl": item.organizationUrl, "updated": item.updated}
    end
    return phys_address_arr 
  end


  def self.retrieve_single_facility_with_organizationUrl(organizationUrl)
  puts fac_obj = Facility.where(organizationUrl: organizationUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
     phys_address_arr = []
     fac_obj.each do |item| 

      puts associate_obj  = Associate.where(url: item.salesRep).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
    phys_address_arr << {"id": item.id,"organization_details": org_obj, "salesRep_details": associate_obj,"facilityName": item.facilityName, "facilityType": item.facilityType,"email": item.email, "salesRep": item.salesRep, "endDate": item.endDate, "startDate": item.startDate,"status": item.status,"url": item.url, "organizationUrl": item.organizationUrl, "updated": item.updated}
    end
    return phys_address_arr 
  end


end

####### statusHistory
class StatusHistory < ActiveRecord::Base
  self.table_name = 'statusHistory'

   def self.retrieve_status

    select("id,associateUrl,changedBy,newStatus,date,effective,priorStatus,priorStatusReason,newStatusReason")
  end

  def self.retrieve_single_status(associateUrl)

    # select("id,associateUrl,changedBy,newStatus,date,effective,priorStatus,priorStatusReason,newStatusReason").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

    puts  anPhIn_obj = StatusHistory.where(associateUrl: associateUrl).select("id,associateUrl,changedBy,newStatus,date,effective,priorStatus,priorStatusReason,newStatusReason")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"changedBy": item.changedBy, "newStatus": item.newStatus,"newStatus": item.newStatus,"date": item.date, "effective": item.effective, "priorStatus": item.priorStatus,"priorStatusReason": item.priorStatusReason,"newStatusReason": item.newStatusReason}
    end
    return phys_address_arr 
  end
end



####### WEB ACCESS
class WebAccess < ActiveRecord::Base
  self.table_name = 'website_access'

   def self.retrieve_access

    select("id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated")
  end

  def self.retrieve_single_access(associateUrl)

    # select("id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


    
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
    puts  web_Access_obj = WebAccess.where(associateUrl: associateUrl).select("id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated")
    
     
     phys_address_arr = []
     web_Access_obj.each do |item| 

      puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")


    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"organization_details": org_obj,"userName": item.userName,"password": item.password,"startDate": item.startDate,"email": item.email,"isActive": item.isActive,"isLockedOut": item.isLockedOut,"endDate": item.endDate,"lastLogin": item.lastLogin,"previousLogin": item.previousLogin,"passwordExpires": item.passwordExpires,"created": item.created,"roles": item.roles,"regionUrls": item.regionUrls,"agencyUrls": item.agencyUrls,"updated": item.updated}
    end
    return phys_address_arr
  end


  def self.retrieve_access_with_username(userName)

    # select("id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated").where(
    # "userName = ?","#{userName}"
    # )


    puts  web_Access_obj = WebAccess.where(userName: userName).select("id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated")
    
     
     phys_address_arr = []
     web_Access_obj.each do |item| 

      puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       puts associate_obj  = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  

    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"organization_details": org_obj,"userName": item.userName,"startDate": item.startDate,"email": item.email,"isActive": item.isActive,"password": item.password,"isLockedOut": item.isLockedOut,"endDate": item.endDate,"lastLogin": item.lastLogin,"previousLogin": item.previousLogin,"passwordExpires": item.passwordExpires,"created": item.created,"roles": item.roles,"regionUrls": item.regionUrls,"agencyUrls": item.agencyUrls,"updated": item.updated}
    end
    return phys_address_arr 
  end


end


####### Organizations
class Organization < ActiveRecord::Base
  self.table_name = 'organizations'

   def self.retrieve_organizations

    select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
  end

  def self.retrieve_single_organization(url)

    select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate").where(
    "url = ?","#{url}"
    )
  end


   def self.retrieve_single_organization_with_organizationCode(organizationCode)

    # select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate").where(
    # "organizationCode = ?","#{organizationCode}"
    # )

      #puts  anPhIn_obj = Payroll.where(associateUrl: associateUrl).select("id,associateUrl,salary,payrollType,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck")
   puts  org_obj = Organization.where(organizationCode: organizationCode).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     phys_address_arr = []
     org_obj.each do |item| 

      puts associate_obj  = Associate.where(url: item.primaryContact).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
    phys_address_arr << {"id": item.id, "primaryContact_details": associate_obj,"url": item.url,"organizationName": item.organizationName, "organizationCode": item.organizationCode,"email": item.email, "phoneType": item.phoneType, "phone": item.phone, "companyStartDate": item.companyStartDate,"companyEndDate": item.companyEndDate}
    end
    return phys_address_arr 
  end
end


####### Associate Notes
class AssociateNote < ActiveRecord::Base
  self.table_name = 'associate_notes'

   def self.retrieve_associate_notes

    select("id,associateUrl,noteBy,document,note,active,date,noteType")
  end

  def self.retrieve_single_associate_notes(associateUrl)

    # select("id,associateUrl,noteBy,document,note,active,date,noteType").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

     puts  anPhIn_obj = AssociateNote.where(associateUrl: associateUrl).select("id,associateUrl,noteBy,document,note,active,date,noteType")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"noteBy": item.noteBy, "document": item.document,"note": item.note,"active": item.active, "date": item.date, "noteType": item.noteType}
    end
    return phys_address_arr 
  end
end

####### ancillaryPhoneInfo 
class AncillaryPhoneInfo < ActiveRecord::Base
  self.table_name = 'ancillaryPhoneInfo'

   def self.retrieve_ancillaryPhoneInfo

    select("id,associateUrl,phoneType,phone,description")


  end

  def self.retrieve_single_ancillaryPhoneInfo(associateUrl)

    # select("id,associateUrl,phoneType,phone,description").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


    puts  anPhIn_obj = AncillaryPhoneInfo.where(associateUrl: associateUrl).select("id,associateUrl,phoneType,phone,description")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"phoneType": item.phoneType, "phone": item.phone,"description": item.description}
    end
    return phys_address_arr 
  end
end

####### addressPhoneInfo 
class AddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'addressPhoneInfo'

   def self.retrieve_addressPhoneInfo

    select("id,associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")
  end

  def self.retrieve_single_addressPhoneInfo(associateUrl)

    # select("id,associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

     puts  anPhIn_obj = AddressPhoneInfo.where(associateUrl: associateUrl).select("id,associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"addressType": item.addressType, "address1": item.address1,"address2": item.address2,"city": item.city, "state": item.state, "zip": item.zip, "addressPhoneInfoPhones": item.addressPhoneInfoPhones}
    end
    return phys_address_arr 
  end




def self.retrieve_ass_with_zip(zip)

  #  puts  phys_address = AddressPhoneInfo.joins("LEFT JOIN associates on associates.url = addressPhoneInfo.associateUrl INNER JOIN ass_lookup_discipline_types on ass_lookup_discipline_types.disciplineCode = associates.discipline ")
  #              .select("addressPhoneInfo.id,associates.firstName as associates_name,associates.discipline as associates_discipline,addressPhoneInfo.zip as zip_code,ass_lookup_discipline_types.disciplineCode as discipline_codes")
  #              .where("zip = ?","#{zip}")


  #  AddressPhoneInfo.joins("LEFT JOIN associates on addressPhoneInfo.associateUrl =  associates.url")
  #              .select("associates.url as url,associates.firstName as associates_name,associates.discipline as discipline,addressPhoneInfo.zip as zip_code")
  #              .where("zip = ?","#{zip}").group(url);

  # AssLookupDisciplineTypes.joins("INNER JOIN associates ON ass_lookup_discipline_types.id = associates.discipline  ")


  #  result = AddressPhoneInfo
  #   .select("ass_lookup_discipline_types.id,ass_lookup_discipline_types.description AS discipline, COUNT(associates.id) AS associateInZipcode")
  #   .joins("INNER JOIN associates ON addressPhoneInfo.associateUrl = associates.url INNER JOIN ass_lookup_discipline_types ON associates.discipline = ass_lookup_discipline_types.id ")
  #   .where("CAST(addressPhoneInfo.zip AS SIGNED) BETWEEN ? AND ?", zip.to_i - 2, zip.to_i + 2)
  #   .group("ass_lookup_discipline_types.description, ass_lookup_discipline_types.id")
  

    result = AssLookupDisciplineTypes
    .select("ass_lookup_discipline_types.id, ass_lookup_discipline_types.description AS discipline")

  
    phys_address_arr = []
   result.each do |item| 

   puts "---->>> DISCIPLINE--->>>>>#{item.discipline}"


    result2 =  AddressPhoneInfo
    .select("associates.id,associates.discipline, COUNT(associates.id) AS associateInZipcode")
    .joins("INNER JOIN associates ON addressPhoneInfo.associateUrl = associates.url ")
    .where("CAST(addressPhoneInfo.zip AS SIGNED) BETWEEN ? AND ?", zip.to_i - 2, zip.to_i + 2)
    .group("associates.discipline, associates.id")

  # phys_address_arr <<  result2.map do |record|
  # {
  #   discipline: {
  #     name: item.discipline,
  #     id: item.id
  #   },
  #   associatesInZipcode: record.associateInZipcode.to_i,
  #   totalAssociates: Associate.where(discipline: item.id).count
  # }

  output = result2.map do |record|
  {
    discipline: {
      name: item.discipline,
      id: item.id
    },
    associatesInZipcode: record.associateInZipcode.to_i,
    totalAssociates: Associate.where(discipline: item.id).count
  }
end



json_output = output.first
puts json_output

 puts "----- OTUTPUT <><><><><> #{json_output}"

  phys_address_arr <<  json_output
end
return phys_address_arr

    



end


def self.retrieve_ass_with_no_zip
  #  results = AddressPhoneInfo
  #   .select("associates.discipline AS discipline, COUNT(associates.id) AS associateInZipcode")
  #   .joins("INNER JOIN associates ON addressPhoneInfo.associateUrl = associates.url")
  #   .group("associates.discipline")
  #   .map do |result|
  #     {
  #       Discipline: result.discipline,
  #       AssociatesInZipcode: result.associateInZipcode,
  #       ActiveAssociate: Associate.where(discipline: result.discipline).count
  #     }
  #   end


    # AssLookupDisciplineTypes.select("ass_lookup_discipline_types.id,ass_lookup_discipline_types.description As discipline, COUNT(associates.id) AS associateInZipcode").joins("INNER JOIN associates ON ass_lookup_discipline_types.id = associates.discipline").group("ass_lookup_discipline_types.description,ass_lookup_discipline_types.id").map do |result|
    #   {
    #     Discipline: result.discipline,
    #     AssociatesInZipcode: result.associateInZipcode,
    #     TotalAssociate: Associate.where(discipline: result.id).count
    #   }
    # end

    result = AssLookupDisciplineTypes
  .select("ass_lookup_discipline_types.id, ass_lookup_discipline_types.description AS discipline, COUNT(associates.id) AS associateInZipcode")
  .joins("INNER JOIN associates ON ass_lookup_discipline_types.id = associates.discipline")
  .group("ass_lookup_discipline_types.description, ass_lookup_discipline_types.id")

output = result.map do |record|
  {
    discipline: {
      name: record.discipline,
      id: record.id
    },
    associatesInZipcode: 0,
    totalAssociates: Associate.where(discipline: record.id).count
  }
end



    #  results = AddressPhoneInfo
    # .select("associates.discipline AS discipline, COUNT(associates.id) AS associateInZipcode")
    # .joins("INNER JOIN associates ON addressPhoneInfo.associateUrl = associates.url INNER JOIN associates ON ass_lookup_discipline_types.id = associates.discipline")
    # .where("CAST(addressPhoneInfo.zip AS SIGNED) BETWEEN ? AND ?", zip.to_i - 2, zip.to_i + 2)
    # .group("associates.discipline")
    # .map do |result|
    #   {
    #     Discipline: result.discipline,
    #     AssociatesInZipcode: result.associateInZipcode,
    #     ActiveAssociates: Associate.where(discipline: result.discipline).count
    #   }
    # end
end
end

####### emergencyContacts 
class EmergencyContact < ActiveRecord::Base
  self.table_name = 'emergencyContacts'

   def self.retrieve_emergencyContacts

    select("id,associateUrl,relationship,firstName,lastName,priority,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")
  end

  def self.retrieve_single_emergencyContact(associateUrl)

    # select("id,associateUrl,relationship,firstName,lastName,priority,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones").where(
    # "associateUrl = ?","#{associateUrl}"
    # ) 



    puts  emergency_obj = EmergencyContact.where(associateUrl: associateUrl).select("id,associateUrl,relationship,firstName,lastName,priority,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")

    puts  associate_obj = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
    
     phys_address_arr = []
     emergency_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"relationship": item.relationship,"firstName": item.firstName,"lastName": item.lastName,"priority": item.priority,"addressType": item.addressType,"address1": item.address1,"address2": item.address2,"city": item.city,"state": item.state,"zip": item.zip,"addressPhoneInfoPhones": item.addressPhoneInfoPhones}
    end
    return phys_address_arr 
  end


end

####### documents 
class Document < ActiveRecord::Base
  self.table_name = 'documents'

   def self.retrieve_documents

    select("id,associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate")
  end

  def self.retrieve_single_document(id)

    select("id,associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_document_with_associateUrl(associateUrl)

    # select("id,associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


      puts  anPhIn_obj = Document.where(associateUrl: associateUrl).select("id,associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"file": item.file, "documentType": item.documentType,"documentStatus": item.documentStatus,"description": item.description, "note": item.note, "uploadedBy": item.uploadedBy, "uploadedDate": item.uploadedDate}
    end
    return phys_address_arr 
  end
end



####### documents 
class AssociateAvailability < ActiveRecord::Base
  self.table_name = 'associate_availabilities'

   def self.retrieve_associate_availabilities

    select("id,associateUrl,date,day,start,end,availability_type,reason")
  end

  def self.retrieve_single_associate_availability(associateUrl)

    # select("id,associateUrl,date,day,start,end,availability_type,reason").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

  puts  anPhIn_obj = AssociateAvailability.where(associateUrl: associateUrl).select("id,associateUrl,date,day,start,end,availability_type,reason")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"date": item.date, "day": item.day,"start": item.start,"end": item.end, "availability_type": item.availability_type, "reason": item.reason}
    end
    return phys_address_arr 
  end
end

####### payroll 
class Payroll < ActiveRecord::Base
  self.table_name = 'payroll'

   def self.retrieve_payroll

    select("id,associateUrl,salary,payrollType,federalDeductions,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck")
  end

  def self.retrieve_single_payroll(associateUrl)

    # select("id,associateUrl,salary,payrollType,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

     puts  anPhIn_obj = Payroll.where(associateUrl: associateUrl).select("id,associateUrl,salary,payrollType,federalDeductions,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"salary": item.salary, "payrollType": item.payrollType,"federalDeductions": item.federalDeductions,"federalFillingStatus": item.federalFillingStatus,"stateFillingStatus": item.stateFillingStatus, "stateDeductions": item.stateDeductions, "startDate": item.startDate, "wbCheck": item.wbCheck}
    end
    return phys_address_arr 
  end
end


####### agency 
class Agency < ActiveRecord::Base
  self.table_name = 'agencies'

   def self.retrieve_agencies

    select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")

  end

  def self.retrieve_single_agency(url)

    select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated").where(
    "url = ?","#{url}"
    )
  end

   def self.retrieve_single_agency_with_regionUrl(regionUrl)

    # select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated").where(
    # "regionUrl = ?","#{regionUrl}"
    # )


     puts  org_obj = Region.where(url: regionUrl).select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated")

    puts  physic_obj = Agency.where(regionUrl: regionUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
    
     phys_address_arr = []
     physic_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "region_details": org_obj,"url": item.url,"agencyName": item.agencyName,"agencyType": item.agencyType,"payrollCutoff": item.payrollCutoff,"procActionDate": item.procActionDate,"nameOnInvoice": item.nameOnInvoice,"agencyCode": item.agencyCode,"email": item.email,"primaryContact": item.primaryContact,"startDate": item.startDate,"endDate": item.endDate,"externalFacilityID": item.externalFacilityID,"agencyReportID": item.agencyReportID,"updated": item.updated}
    end
    return phys_address_arr 
  end

  def self.retrieve_single_agency_with_organizationUrl(organizationUrl)

    # select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated").where(
    # "organizationUrl = ?","#{organizationUrl}"
    # )
     puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")

    puts  physic_obj = Agency.where(organizationUrl: organizationUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
    
     phys_address_arr = []
     physic_obj.each do |item| 

    puts  region_obj = Region.where(url: item.regionUrl).select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated")
     puts primaryContact_obj  = Associate.where(url: item.primaryContact).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
    
   

    phys_address_arr << {"id": item.id, "organization_details": org_obj,"region_details": region_obj,"primary_contact_details": primaryContact_obj,"url": item.url,"agencyName": item.agencyName,"agencyType": item.agencyType,"payrollCutoff": item.payrollCutoff,"procActionDate": item.procActionDate,"nameOnInvoice": item.nameOnInvoice,"agencyCode": item.agencyCode,"email": item.email,"primaryContact": item.primaryContact,"startDate": item.startDate,"endDate": item.endDate,"externalFacilityID": item.externalFacilityID,"agencyReportID": item.agencyReportID,"updated": item.updated}
    end
    return phys_address_arr 
  end
end

####### regions 
class Region < ActiveRecord::Base
  self.table_name = 'regions'

   def self.retrieve_regions

    select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated")

  end

  def self.retrieve_single_region(url)

    select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated").where(
    "url = ?","#{url}"
    )
  end

   def self.retrieve_single_region_with_org(organizationUrl)

    select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated").where(
    "organizationUrl = ?","#{organizationUrl}"
    )



    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")

    puts  region_obj = Region.where(organizationUrl: organizationUrl).select("id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated")
    
    

     phys_address_arr = []
     region_obj.each do |item| 

      puts primaryContact_obj  = Associate.where(url: item.primaryContact).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
    
   

    phys_address_arr << {"id": item.id, "organization_details": org_obj,"primary_contact_details": primaryContact_obj,"url": item.url,"organizationUrl": item.organizationUrl,"regionName": item.regionName,"regionCode": item.regionCode,"email": item.email,"primaryContact": item.primaryContact,"startDate": item.startDate,"endDate": item.endDate,"updated": item.updated}
    end
    return phys_address_arr 
  end
end


####### deductions 
class Deduction < ActiveRecord::Base
  self.table_name = 'deductions'

   def self.retrieve_deductions

    select("id,associateUrl,deduction,amount,startDate,endDate")

  end

  def self.retrieve_single_deduction(id)

    select("id,associateUrl,deduction,amount,startDate,endDate").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_deduction_with_associateUrl(associateUrl)

    # select("id,associateUrl,deduction,amount,startDate,endDate").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


      puts  anPhIn_obj = Deduction.where(associateUrl: associateUrl).select("id,associateUrl,deduction,amount,startDate,endDate")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"deduction": item.deduction, "amount": item.amount,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 
  end
end


####### Payrates 
class Payrate < ActiveRecord::Base
  self.table_name = 'payrates'

   def self.retrieve_payrates

    select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate")

  end

  def self.retrieve_single_payrate(id)

    select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_single_payrate_with_ass_url(associateUrl)

    # select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

    puts  anPhIn_obj = Payrate.where(associateUrl: associateUrl).select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"payType": item.payType, "serviceDescription": item.serviceDescription,"weekdayRate": item.weekdayRate,"weekendRate": item.weekendRate, "allowOverride": item.allowOverride, "startDate": item.startDate}
    end
    return phys_address_arr 
  end
end


####### License 
class License < ActiveRecord::Base
  self.table_name = 'licenses'

   def self.retrieve_licenses

    select("id,associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate")

  end

  def self.retrieve_single_license(id)

    select("id,associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_license_with_assUrl(associateUrl)

    # select("id,associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


     puts  physician_obj = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

    puts  phys_address_obj = License.where(associateUrl: associateUrl).select("id,associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "associate_details": physician_obj,"licenseType": item.licenseType,"licenseNumber": item.licenseNumber,"licenseState": item.licenseState,"issueDate": item.issueDate,"licenseStatus": item.licenseStatus,"expirationDate": item.expirationDate}
    end
    return phys_address_arr 
  end
end


####### Skills 
class Skill < ActiveRecord::Base
  self.table_name = 'skills'

   def self.retrieve_skills

    select("id,associateUrl,skills")

  end

  def self.retrieve_single_skills(id)

    # select("id,associateUrl,skills").where(
    # "id = ?","#{id}"
    # )


    puts  ass_skills = Skill.where(id: id).select("id,associateUrl,skills")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
      
     phys_address_arr = []
     ass_skills.each do |item| 

       puts associate_obj  = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
  
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"skills": item.skills}
    end
    return phys_address_arr 
  end

  def self.retrieve_single_skills_withAssUrl(associateUrl)

    # select("id,associateUrl,skills").where(
    # "associateUrl = ?","#{associateUrl}"
    # )

    puts  ass_skills = Skill.where(associateUrl: associateUrl).select("id,associateUrl,skills")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     ass_skills.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"skills": item.skills}
    end
    return phys_address_arr 
  end
end


####### Complians 
class Compliance < ActiveRecord::Base
  self.table_name = 'compliances'

   def self.retrieve_compliances

    select("id,associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative")

  end

  def self.retrieve_single_compliances(id)

    select("id,associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative").where(
    "id = ?","#{id}"
    )
  end

  def self.retrieve_single_compliances_with_associateUrl(associateUrl)

    # select("id,associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


       puts  anPhIn_obj = Compliance.where(associateUrl: associateUrl).select("id,associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative")
    # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"item": item.item, "complianceType": item.complianceType,"lastModifiedBy": item.lastModifiedBy,"lastModifiedByDate": item.lastModifiedByDate, "result": item.result, "completed": item.completed,"renewal": item.renewal,"compliant": item.compliant, "notNeeded": item.notNeeded, "comment": item.comment, "narrative": item.narrative}
    end
    return phys_address_arr 
  end
end


####### physician_address 
class PhysicianAddress < ActiveRecord::Base
  self.table_name = 'physician_address'

   def self.retrieve_physician_address

    select("id,physicianUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,created_at")

  end

  def self.retrieve_single_physician_address(id)

    
     puts  phys_address_obj = PhysicianAddress.where(id: id).select("id,physicianUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,created_at")


     phys_address_arr = []
     phys_address_obj.each do |item| 

   puts  physician_obj = Physician.where(url: item.physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")
    
   
    phys_address_arr << {"id": item.id, "physician_details": physician_obj, "addressType": item.addressType,"address1": item.address1,"address2": item.address2,"city": item.city,"state": item.state,"zip": item.zip,"addressPhoneInfoPhones": item.addressPhoneInfoPhones,"created_at": item.created_at}


    return phys_address_arr 
end


end





def self.retrieve_single_physician_address_with_physicianUrl(physicianUrl)
 
    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianAddress.where(physicianUrl: physicianUrl).select("id,physicianUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,created_at")
       
     phys_address_arr = []
     phys_address_obj.each do |item| 

    phys_address_arr << {"id": item.id, "physician_details": physician_obj, "addressType": item.addressType,"address1": item.address1,"address2": item.address2,"city": item.city,"state": item.state,"zip": item.zip,"addressPhoneInfoPhones": item.addressPhoneInfoPhones,"created_at": item.created_at}

   
  end

   return phys_address_arr 

  end
end





####### physician_referral_source_contacts 
class PhysicianReferralSourceContacts < ActiveRecord::Base
  self.table_name = 'physician_referral_source_contacts'

   def self.retrieve_physician_referral_source_contacts

    select("id,physicianUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy,created_at")

  end

  def self.retrieve_single_physician_referral_source_contacts(id)
select("id,physicianUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_single_physician_referral_source_contacts_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianReferralSourceContacts.where(physicianUrl: physicianUrl).select("id,physicianUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"phone1": item.phone1,"phone2": item.phone2,"information": item.information,"email": item.email,"startDate": item.startDate,"updatedBy": item.updatedBy}
    end
    return phys_address_arr 
   

  end

end



####### physician_referral_source_contacts 
class PhysicianAncillaryPhoneInfo < ActiveRecord::Base
  self.table_name = 'physician_ancillary_phone_info'

   def self.retrieve_physician_ancillary_phone_info

    select("id,physicianUrl,phoneType,phone,description,updatedBy,created_at")

  end

  def self.retrieve_single_physician_ancillary_phone_info(id)
select("id,physicianUrl,phoneType,phone,description,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_physician_ancillary_phone_info_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianAncillaryPhoneInfo.where(physicianUrl: physicianUrl).select("id,phoneType,phone,description,updatedBy,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"phoneType": item.phoneType,"phone": item.phone,"description": item.description,"updatedBy": item.updatedBy,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end



####### creating_physician_notes 
class PhysicianNote < ActiveRecord::Base
  self.table_name = 'physician_notes'

   def self.retrieve_physician_notes

    select("id,physicianUrl,date,noteBy,noteType,document,note,active,updatedBy,created_at")

  end

  def self.retrieve_single_physician_notes(id)
select("id,physicianUrl,date,noteBy,noteType,document,note,active,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_physician_notes_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianNote.where(physicianUrl: physicianUrl).select("id,date,noteBy,noteType,document,note,active,updatedBy,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"date": item.date,"noteBy": item.noteBy,"noteType": item.noteType,"document": item.document,"note": item.note,"active": item.active,"updatedBy": item.updatedBy,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end



####### physician_licenses 
class PhysicianLicenses < ActiveRecord::Base
  self.table_name = 'physician_licenses'

   def self.retrieve_physician_licenses

    select("id,physicianUrl,licenseNumber,state,expirationDate,verificationDate,status,created_at")

  end

  def self.retrieve_single_physician_licenses(id)
select("id,physicianUrl,licenseNumber,state,expirationDate,verificationDate,status,created_at").where(
    "id = ?","#{id}"
    )
  end



    def self.retrieve_physician_licenses_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianLicenses.where(physicianUrl: physicianUrl).select("id,licenseNumber,state,expirationDate,verificationDate,status,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"licenseNumber": item.licenseNumber,"state": item.state,"expirationDate": item.expirationDate,"verificationDate": item.verificationDate,"status": item.status,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end

####### physician_identifier 
class PhysicianIdentifier < ActiveRecord::Base
  self.table_name = 'physician_identifier'

   def self.retrieve_physician_identifier

    select("id,physicianUrl,identifierType,identifierValue,startDate,endDate,updatedBy,created_at")

  end

  def self.retrieve_single_physician_identifier(id)
select("id,physicianUrl,identifierType,identifierValue,startDate,endDate,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_physician_identifier_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianIdentifier.where(physicianUrl: physicianUrl).select("id,identifierType,identifierValue,startDate,endDate,updatedBy,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"identifierType": item.identifierType,"identifierValue": item.identifierValue,"startDate": item.startDate,"endDate": item.endDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end


####### physician_Docs
class PhysicianDocuments < ActiveRecord::Base
  self.table_name = 'physician_documents'

   def self.retrieve_physician_documents

    select("id,physicianUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at")

  end

  def self.retrieve_single_physician_documents(id)
select("id,physicianUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_physician_documents_with_physicianUrl(physicianUrl)

    puts  physician_obj = Physician.where(url: physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    puts  phys_address_obj = PhysicianDocuments.where(physicianUrl: physicianUrl).select("id,physicianUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "physician_details": physician_obj,"attachTo": item.attachTo,"file": item.file,"documentType": item.documentType,"documentStatus": item.documentStatus,"description": item.description,"note": item.note,"uploadedBy": item.uploadedBy,"uploadedDate": item.uploadedDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end
end



####### facility_ancillary_phones 
class FacilityAncillaryPhone < ActiveRecord::Base
  self.table_name = 'facility_ancillary_phones'

   def self.retrieve_facility_ancillary_phones

    select("id,facilityUrl,phoneType,phone,description,updatedBy")

  end

  def self.retrieve_single_facility_ancillary_phones(id)
# select("id,physicianUrl,phoneType,phone,description,updatedBy").where(
#     "id = ?","#{id}"
#     )


 
    puts  facility_Ancillary_obj = FacilityAncillaryPhone.where(id: id).select("id,facilityUrl,phoneType,phone,description,updatedBy")
    
     phys_address_arr = []
     facility_Ancillary_obj.each do |item| 
   
      puts  physician_obj = Facility.where(url: item.facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")

    phys_address_arr << {"id": item.id, "facility_details": physician_obj,"phoneType": item.phoneType,"phone": item.phone,"description": item.description,"updatedBy": item.updatedBy}
    end
    return phys_address_arr 
  end


   def self.retrieve_facility_ancillary_phones_with_facilityUrl(facilityUrl)

    puts  physician_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")

    puts  facility_Ancillary_obj = FacilityAncillaryPhone.where(facilityUrl: facilityUrl).select("id,physicianUrl,phoneType,phone,description,updatedBy")
    
     phys_address_arr = []
     facility_Ancillary_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "facility_details": physician_obj,"phoneType": item.phoneType,"phone": item.phone,"description": item.description,"updatedBy": item.updatedBy}
    end
    return phys_address_arr 
   

  end
end





####### facility_referral_source_contacts 
class FacilityReferralSourceContact < ActiveRecord::Base
  self.table_name = 'facility_referral_source_contacts'

   def self.retrieve_facility_referral_source_contacts

    select("id,facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy")

  end

  def self.retrieve_single_facility_referral_source_contacts(id)
# select("id,facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy").where(
#     "id = ?","#{id}"
#     )

    puts  facility_referral_source_contacts_obj = FacilityReferralSourceContact.where(id: id).select("id,facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy")
    
     phys_address_arr = []
     facility_referral_source_contacts_obj.each do |item| 

    puts fac_obj = Facility.where(url: item.facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")
   
     # puts  physician_obj = Physician.where(url: item.physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"phone1": item.phone1, "phone2": item.phone2, "information": item.information, "email": item.email, "startDate": item.startDate, "updatedBy": item.updatedBy}
    end
    return phys_address_arr 
  end


   def self.retrieve_facility_referral_source_contacts_with_facilityUrl(facilityUrl)

      puts  facility_referral_source_contacts_obj = FacilityReferralSourceContact.where(facilityUrl: facilityUrl).select("id,facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy")
      puts fac_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")
   

     phys_address_arr = []
     facility_referral_source_contacts_obj.each do |item| 

    
     # puts  physician_obj = Physician.where(url: item.physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"phone1": item.phone1, "phone2": item.phone2, "information": item.information, "email": item.email, "startDate": item.startDate, "updatedBy": item.updatedBy}
    end
    return phys_address_arr 
   

  end
end





####### facility_address_phone_infos 
class FacilityAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'facility_address_phone_infos'

   def self.retrieve_facility_address_phone_infos

    select("id,facilityUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,updatedBy,placeOfService,startDate,endDate")

  end

  def self.retrieve_single_facility_address_phone_infos(id)


    puts  facility_address_phone_infos_obj = FacilityAddressPhoneInfo.where(id: id).select("id,facilityUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,updatedBy,placeOfService,startDate,endDate")
    
     phys_address_arr = []
     facility_address_phone_infos_obj.each do |item| 

    puts fac_obj = Facility.where(url: item.facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")
   
     # puts  physician_obj = Physician.where(url: item.physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"placeOfService": item.placeOfService,"startDate": item.startDate,"endDate": item.endDate,"addressType": item.addressType,"address1": item.address1,"address2": item.address2,"city": item.city, "state": item.state, "zip": item.zip, "addressPhoneInfoPhones": item.addressPhoneInfoPhones, "updatedBy": item.updatedBy}
    end
    return phys_address_arr 
  end


   def self.retrieve_facility_address_phone_infos_with_facilityUrl(facilityUrl)

      puts  facility_address_phone_infos_obj = FacilityAddressPhoneInfo.where(facilityUrl: facilityUrl).select("id,facilityUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,updatedBy,placeOfService,startDate,endDate")
      puts fac_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")
   

     phys_address_arr = []
     facility_address_phone_infos_obj.each do |item| 

    
     # puts  physician_obj = Physician.where(url: item.physicianUrl).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated")

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"placeOfService": item.placeOfService,"startDate": item.startDate,"endDate": item.endDate,"addressType": item.addressType,"address1": item.address1,"address2": item.address2,"city": item.city, "state": item.state, "zip": item.zip, "addressPhoneInfoPhones": item.addressPhoneInfoPhones, "updatedBy": item.updatedBy}
     
    end
    return phys_address_arr 
   

  end
end






class CollectorAssignment < ActiveRecord::Base
  self.table_name = 'collector_assignments'

  def self.retrieve_collector_assignments

    select("id,agency,level,assignTo,payer,payerCategory,team,patientEncounter,organizationUrl")

  end

  def self.retrieve_single_collector_assignments(id)

    select("id,agency,level,assignTo,payer,payerCategory,team,patientEncounter,organizationUrl").where(
    "id = ?","#{id}")

  end

    def self.retrieve_single_collector_assignments_with_organizationUrl(organizationUrl)

    select("id,agency,level,assignTo,payer,payerCategory,team,patientEncounter,organizationUrl").where(
    "organizationUrl = ?","#{organizationUrl}")

  end

end



####### ReferralData 
class ReferralData < ActiveRecord::Base
  self.table_name = 'referralData'

  def self.retrieve_referralData

   puts  referralData_obj = ReferralData.select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,
referralSourceContact,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy,patientID,signature,primaryPhysicianPreferredAddress,created_at")



     phys_address_arr = []

  referralData_obj.each do |a| 

     referralSource_obj = ReferralSource.where(uid: a.referralSourceID).select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")

      referralSourceContact_obj = ReferralSourceContact.where(uid: a.referralSourceContact).select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")
   

    phys_address_arr << {"uid": a.uid, "Referral_Source_details": referralSource_obj,"Referral_SourceContact_details": referralSourceContact_obj, "uid": a.uid,"isCompleted": a.isCompleted,"status": a.status, "agency": a.agency,"agencyType": a.agencyType,
"referralSourceID": a.referralSourceID,"modeOfDelivery": a.modeOfDelivery, "referralSourceContact": a.referralSourceContact,
"payerCategory": a.payerCategory,
"referralDate": a.referralDate,
"referralSOC": a.referralSOC,
"admissionSource": a.admissionSource,
"admissionType": a.admissionType,
"disciplines": a.disciplines,
"primaryPhysician": a.primaryPhysician,
"physicians": a.physicians,
"physicianType": a.physicianType,
"requestedSOC": a.requestedSOC,
"physicianOrders": a.physicianOrders,
"orderDate": a.orderDate,
"surgicalProcedures": a.surgicalProcedures,
"nutritionalRequirements": a.nutritionalRequirements,
"supplyInformation": a.supplyInformation,
"diagnosisCode": a.diagnosisCode,
"diagnosis": a.diagnosis,
"medications": a.medications,
"zipCode": a.zipCode,
"skills": a.skills,"organization_url": a.organization_url,"createdBy": a.createdBy,"modifiedBy": a.modifiedBy,"patientID": a.patientID, "signature": a.signature,"primaryPhysicianPreferredAddress": a.primaryPhysicianPreferredAddress, "created_at": a.created_at
}
    end
    return phys_address_arr 


  end

  def self.retrieve_single_referralData(uid)


   puts  referralData_obj = ReferralData.where(uid: uid).select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,
referralSourceContact,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy,patientID,signature,primaryPhysicianPreferredAddress,created_at")


    phys_address_arr = []

  referralData_obj.each do |a| 

     referralSource_obj = ReferralSource.where(uid: a.referralSourceID).select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")

      referralSourceContact_obj = ReferralSourceContact.where(uid: a.referralSourceContact).select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")
   

    phys_address_arr << {"uid": a.uid, "Referral_Source_details": referralSource_obj,"Referral_SourceContact_details": referralSourceContact_obj, "uid": a.uid,"isCompleted": a.isCompleted,"status": a.status, "agency": a.agency, "agencyType": a.agencyType,
"referralSourceID": a.referralSourceID,"modeOfDelivery": a.modeOfDelivery, "referralSourceContact": a.referralSourceContact,
"payerCategory": a.payerCategory,
"referralDate": a.referralDate,
"referralSOC": a.referralSOC,
"admissionSource": a.admissionSource,
"admissionType": a.admissionType,
"disciplines": a.disciplines,
"primaryPhysician": a.primaryPhysician,
"physicians": a.physicians,
"physicianType": a.physicianType,
"requestedSOC": a.requestedSOC,
"physicianOrders": a.physicianOrders,
"orderDate": a.orderDate,
"surgicalProcedures": a.surgicalProcedures,
"nutritionalRequirements": a.nutritionalRequirements,
"supplyInformation": a.supplyInformation,
"diagnosisCode": a.diagnosisCode,
"diagnosis": a.diagnosis,
"medications": a.medications,
"zipCode": a.zipCode,
"skills": a.skills,"organization_url": a.organization_url,"createdBy": a.createdBy,"modifiedBy": a.modifiedBy,"patientID": a.patientID,"signature": a.signature,"primaryPhysicianPreferredAddress": a.primaryPhysicianPreferredAddress,"created_at": a.created_at
}
    end
    return phys_address_arr 

  end


  def self.retrieve_single_by_organization_url(organization_url)
      select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,
referralSourceContact,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy,patientID,signature,primaryPhysicianPreferredAddress,created_at").where(
    "organization_url = ?","#{organization_url}")
  end



   

      def self.retrieve_single_by_referralSourceID(referralSourceID)
          puts  referralData_obj = ReferralData.where(referralSourceID: referralSourceID).select("uid,isCompleted,status,agency,
          agencyType,
          referralSourceID,
          modeOfDelivery,
          referralSourceContact,
          payerCategory,
          referralDate,
          referralSOC,
          admissionSource,
          admissionType,
          disciplines,
          primaryPhysician,
          physicians,
          physicianType,
          requestedSOC,
          physicianOrders,
          orderDate,
          surgicalProcedures,
          nutritionalRequirements,
          supplyInformation,
          diagnosisCode,
          diagnosis,
          medications,
          zipCode,
          skills,
          organization_url,
          createdBy,
          modifiedBy,
          patientID,
          signature,
          primaryPhysicianPreferredAddress,
          created_at"
)

          referralSource_obj = ReferralSource.where(uid: referralSourceID).select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")

           phys_address_arr = []

     referralData_obj.each do |a| 
   

    phys_address_arr << {"uid": a.uid, "ReferralSource": referralSource_obj, "uid": a.uid,"isCompleted": a.isCompleted,"status": a.status, "agency": a.agency, "agencyType": a.agencyType,
"referralSourceID": a.referralSourceID,"modeOfDelivery": a.modeOfDelivery,  "referralSourceContact": a.referralSourceContact,
"payerCategory": a.payerCategory,
"referralDate": a.referralDate,
"referralSOC": a.referralSOC,
"admissionSource": a.admissionSource,
"admissionType": a.admissionType,
"disciplines": a.disciplines,
"primaryPhysician": a.primaryPhysician,
"physicians": a.physicians,
"physicianType": a.physicianType,
"requestedSOC": a.requestedSOC,
"physicianOrders": a.physicianOrders,
"orderDate": a.orderDate,
"surgicalProcedures": a.surgicalProcedures,
"nutritionalRequirements": a.nutritionalRequirements,
"supplyInformation": a.supplyInformation,
"diagnosisCode": a.diagnosisCode,
"diagnosis": a.diagnosis,
"medications": a.medications,
"zipCode": a.zipCode,
"skills": a.skills,"organization_url": a.organization_url,"createdBy": a.createdBy,"modifiedBy": a.modifiedBy,"patientID": a.patientID,
"signature": a.signature,"primaryPhysicianPreferredAddress": a.primaryPhysicianPreferredAddress,
"created_at": a.created_at
}
    end
    return phys_address_arr 
 
  end



      def self.fetch_all_patient_referred_by_referral_source(referralSourceID)
          
        referralData_obj = ReferralData.where(referralSourceID: referralSourceID).select("uid,isCompleted,status,agency,
          agencyType,
          referralSourceID,
          modeOfDelivery,
          referralSourceContact,
          payerCategory,
          referralDate,
          referralSOC,
          admissionSource,
          admissionType,
          disciplines,
          primaryPhysician,
          physicians,
          physicianType,
          requestedSOC,
          physicianOrders,
          orderDate,
          surgicalProcedures,
          nutritionalRequirements,
          supplyInformation,
          diagnosisCode,
          diagnosis,
          medications,
          zipCode,
          skills,
          organization_url,
          createdBy,
          modifiedBy,
          patientID,
          signature,
          primaryPhysicianPreferredAddress,
          created_at"
)

          referralSource_obj = ReferralSource.where(uid: referralSourceID).select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")

           phys_address_arr = []

     referralData_obj.each do |a| 

      patient_obj = Patient.where(uid: a.patientID).select("id,uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives,image,created_at").first

    # patient_data = patient_obj.as_json(only: [:id, :patientType, :status])

#     patient_data = {}

# patient_obj.each do |patient_obj|
#   patient_data[patient_obj.id.to_s] = {
#     "patientType" => patient_obj.patientType,
#     "status" => patient_obj.status
#   }
# end

    phys_address_arr << {"uid": a.uid,"PatientData" => patient_obj.as_json, "ReferralSource": referralSource_obj, "uid": a.uid,"isCompleted": a.isCompleted,"status": a.status, "agency": a.agency, "agencyType": a.agencyType,
"referralSourceID": a.referralSourceID,"modeOfDelivery": a.modeOfDelivery,  "referralSourceContact": a.referralSourceContact,
"payerCategory": a.payerCategory,
"referralDate": a.referralDate,
"referralSOC": a.referralSOC,
"admissionSource": a.admissionSource,
"admissionType": a.admissionType,
"disciplines": a.disciplines,
"primaryPhysician": a.primaryPhysician,
"physicians": a.physicians,
"physicianType": a.physicianType,
"requestedSOC": a.requestedSOC,
"physicianOrders": a.physicianOrders,
"orderDate": a.orderDate,
"surgicalProcedures": a.surgicalProcedures,
"nutritionalRequirements": a.nutritionalRequirements,
"supplyInformation": a.supplyInformation,
"diagnosisCode": a.diagnosisCode,
"diagnosis": a.diagnosis,
"medications": a.medications,
"zipCode": a.zipCode,
"skills": a.skills,"organization_url": a.organization_url,"createdBy": a.createdBy,"modifiedBy": a.modifiedBy,"patientID": a.patientID,
"signature": a.signature,"primaryPhysicianPreferredAddress": a.primaryPhysicianPreferredAddress,
"created_at": a.created_at
}
    end
    return phys_address_arr
 
  end







   def self.retrieve_single_by_referralSourceContact(referralSourceContact)
          puts  referralData_obj = ReferralData.where(referralSourceContact: referralSourceContact).select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,
referralSourceContact,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy,patientID,signature,primaryPhysicianPreferredAddress,created_at")



          referralSource_obj = ReferralSourceContact.where(uid: referralSourceContact).select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")

           phys_address_arr = []

     referralData_obj.each do |a| 
   

    phys_address_arr << {"uid": a.uid, "ReferralSourceContact": referralSource_obj, "uid": a.uid, "isCompleted": a.isCompleted,"status": a.status, "agency": a.agency,"agencyType": a.agencyType,
"referralSourceID": a.referralSourceID,"modeOfDelivery": a.modeOfDelivery, "referralSourceContact": a.referralSourceContact,
"payerCategory": a.payerCategory,
"referralDate": a.referralDate,
"referralSOC": a.referralSOC,
"admissionSource": a.admissionSource,
"admissionType": a.admissionType,
"disciplines": a.disciplines,
"primaryPhysician": a.primaryPhysician,
"physicians": a.physicians,
"physicianType": a.physicianType,
"requestedSOC": a.requestedSOC,
"physicianOrders": a.physicianOrders,
"orderDate": a.orderDate,
"surgicalProcedures": a.surgicalProcedures,
"nutritionalRequirements": a.nutritionalRequirements,
"supplyInformation": a.supplyInformation,
"diagnosisCode": a.diagnosisCode,
"diagnosis": a.diagnosis,
"medications": a.medications,
"zipCode": a.zipCode,
"skills": a.skills,"organization_url": a.organization_url,"createdBy": a.createdBy,"modifiedBy": a.modifiedBy,"patientID": a.patientID,"signature": a.signature,"primaryPhysicianPreferredAddress": a.primaryPhysicianPreferredAddress,"created_at": a.created_at
}
    end
    return phys_address_arr 
 
  end




   def self.patient_primary_physician(patientID)


   puts  referralData_obj = ReferralData.where(patientID: patientID).select("uid,isCompleted,status,agency,
    agencyType,
    referralSourceID,
    modeOfDelivery,
    referralSourceContact,
    payerCategory,
    referralDate,
    referralSOC,
    admissionSource,
    admissionType,
    disciplines,
    primaryPhysician,
    physicians,
    physicianType,
    requestedSOC,
    physicianOrders,
    orderDate,
    surgicalProcedures,
    nutritionalRequirements,
    supplyInformation,
    diagnosisCode,
    diagnosis,
    medications,
    zipCode,
    skills,organization_url,createdBy,modifiedBy,patientID,signature,primaryPhysicianPreferredAddress,created_at"
)


    phys_address_arr = []

  referralData_obj.each do |a| 

   physician_obj = Physician.where(url: a.primaryPhysician).select("id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,created_at")
   
    phys_address_arr << {"uid": a.uid, "Physician": physician_obj
}

    end
    return phys_address_arr 

  end






   def self.patient_referal_fetch(organization_url)


 referralData_obj = ReferralData.where(organization_url: organization_url).select("uid,status,agency,
    agencyType,
    payerCategory,organization_url,createdBy,patientID,created_at"
)

    phys_address_arr = []

  referralData_obj.each do |a| 

 agency_obj = Agency.where(url: a.agency).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
    
    if agency_obj[0].nil?
    else
      agency_name = agency_obj[0].agencyName
      agencyType = agency_obj[0].agencyType
    end

   patient_obj = Patient.where(uid: a.patientID).select("uid,id,firstName,lastName,middleName,status,admissionDate,nonAdmitDate,status")
    
     patient_obj.each do |p| 
    
          phys_address_arr << {"uid": p.uid, "firstName": p.firstName, "lastName": p.lastName,"middleName": p.middleName,"lastCertPeriod": "","agencyName": agency_name, "agencyType": agencyType,"team": "","admitDate": p.admissionDate,"nonAdmitDate": p.nonAdmitDate,"status": p.status,"payerName": "", "payerCategory": a.payerCategory
}
     end

    end
    return phys_address_arr 

  end
end



class Patient < ActiveRecord::Base
  self.table_name = 'patients'

  def self.retrieve_patients


     puts  patient_obj = Patient.select("id,uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives,image,created_at,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate")

    
     phys_address_arr = []

     patient_obj.each do |item| 

          puts  referal_obj = ReferralData.where(uid: item.referralID).select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,salesRep,
referralSourceContact,
phoneOne,
phoneOneType,
phoneTwo,
phoneTwoType,
referralEmail,
referralInformation,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy")
   

    phys_address_arr << {"id": item.id, "referal_details": referal_obj, "uid": item.uid,"patientType": item.patientType,"status": item.status,"encounterNumber": item.encounterNumber,"referralID": item.referralID,"presentation": item.presentation,"patientInformation": item.patientInformation,
    "placeOfAdmission": item.placeOfAdmission,
    "admissionDate": item.admissionDate,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"dateOfBirth": item.dateOfBirth,"gender": item.gender,"race": item.race,"maritalStatus": item.maritalStatus,
    "email": item.email,"readmitID": item.readmitID,"facilities": item.facilities,"organization_url": item.organization_url,"medicalRecord": item.medicalRecord,"socialSecurity": item.socialSecurity,
    "characteristics": item.characteristics,"county": item.county,"lastFacilityStayed": item.lastFacilityStayed,"transferedFromAnotherAgency": item.transferedFromAnotherAgency,"residence": item.residence,"excludeFromPatientSurvey": item.excludeFromPatientSurvey,"herpesZoosterVacSOC": item.herpesZoosterVacSOC,"advancePlanCareAtSOC": item.advancePlanCareAtSOC,"influenzaVaccineAtSOC": item.influenzaVaccineAtSOC,
    "pneumoniaVaccineAtSOC": item.pneumoniaVaccineAtSOC,"dnrStatus": item.dnrStatus,"advanceDirectivesNaratives": item.advanceDirectivesNaratives, "image": item.image,"dischargeReason": item.dischargeReason,"dischargeDate": item.dischargeDate,"dischargeTime": item.dischargeTime,"team": item.team,"facilityName": item.facilityName,"onHold": item.onHold,"offHold": item.offHold,"declineReason": item.declineReason,"declineDate": item.declineDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

end


  def self.retrieve_single_patient(uid)

  


  puts  patient_obj = Patient.where(uid: uid).select("id,uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,image,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives,created_at,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate")

    
     phys_address_arr = []

     patient_obj.each do |item| 

          puts  referal_obj = ReferralData.where(uid: item.referralID).select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,salesRep,
referralSourceContact,
phoneOne,
phoneOneType,
phoneTwo,
phoneTwoType,
referralEmail,
referralInformation,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy,primaryPhysicianPreferredAddress")
   

    phys_address_arr << {"id": item.id, "referal_details": referal_obj, "uid": item.uid,"patientType": item.patientType,"status": item.status,"encounterNumber": item.encounterNumber,"referralID": item.referralID,"presentation": item.presentation,"patientInformation": item.patientInformation,
    "placeOfAdmission": item.placeOfAdmission,
    "admissionDate": item.admissionDate,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"dateOfBirth": item.dateOfBirth,"gender": item.gender,"race": item.race,"maritalStatus": item.maritalStatus,
    "email": item.email,"readmitID": item.readmitID,"facilities": item.facilities,"organization_url": item.organization_url,"medicalRecord": item.medicalRecord,"socialSecurity": item.socialSecurity,
    "characteristics": item.characteristics,"county": item.county,"lastFacilityStayed": item.lastFacilityStayed,"transferedFromAnotherAgency": item.transferedFromAnotherAgency,"residence": item.residence,"excludeFromPatientSurvey": item.excludeFromPatientSurvey,"herpesZoosterVacSOC": item.herpesZoosterVacSOC,"advancePlanCareAtSOC": item.advancePlanCareAtSOC,"influenzaVaccineAtSOC": item.influenzaVaccineAtSOC,
    "pneumoniaVaccineAtSOC": item.pneumoniaVaccineAtSOC,"dnrStatus": item.dnrStatus,"advanceDirectivesNaratives": item.advanceDirectivesNaratives, "image": item.image,"dischargeReason": item.dischargeReason,"dischargeDate": item.dischargeDate,"dischargeTime": item.dischargeTime,"team": item.team,"facilityName": item.facilityName,"onHold": item.onHold,"offHold": item.offHold,"declineReason": item.declineReason,"declineDate": item.declineDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

end



  def self.retrieve_single_patient_by_org_url(organization_url)

    select("id,uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,image,advanceDirectivesNaratives,created_at,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate").where(
    "organization_url = ?","#{organization_url}")

  end

  




   def self.retrieve_single_patient_by_referralID(referralID)

    puts  patient_obj = Patient.where(referralID: referralID).select("id,uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,image,advanceDirectivesNaratives,created_at,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate")

    puts  referal_obj = ReferralData.where(uid: referralID).select("uid,isCompleted,status,agency,
 agencyType,
referralSourceID,
modeOfDelivery,salesRep,
referralSourceContact,
phoneOne,
phoneOneType,
phoneTwo,
phoneTwoType,
referralEmail,
referralInformation,
payerCategory,
referralDate,
referralSOC,
admissionSource,
admissionType,
disciplines,
primaryPhysician,
physicians,
physicianType,
requestedSOC,
physicianOrders,
orderDate,
surgicalProcedures,
nutritionalRequirements,
supplyInformation,
diagnosisCode,
diagnosis,
medications,
zipCode,
skills,organization_url,createdBy,modifiedBy")
    
     phys_address_arr = []

     patient_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "referal_details": referal_obj, "uid": item.uid,"patientType": item.patientType,"status": item.status,"encounterNumber": item.encounterNumber,"referralID": item.referralID,"presentation": item.presentation,"patientInformation": item.patientInformation,
    "placeOfAdmission": item.placeOfAdmission,
    "admissionDate": item.admissionDate,"firstName": item.firstName,"middleName": item.middleName,"lastName": item.lastName,"dateOfBirth": item.dateOfBirth,"gender": item.gender,"race": item.race,"maritalStatus": item.maritalStatus,
    "email": item.email,"readmitID": item.readmitID,"facilities": item.facilities,"organization_url": item.organization_url,"medicalRecord": item.medicalRecord,"socialSecurity": item.socialSecurity,
    "characteristics": item.characteristics,"county": item.county,"lastFacilityStayed": item.lastFacilityStayed,"transferedFromAnotherAgency": item.transferedFromAnotherAgency,"residence": item.residence,"excludeFromPatientSurvey": item.excludeFromPatientSurvey,"herpesZoosterVacSOC": item.herpesZoosterVacSOC,"advancePlanCareAtSOC": item.advancePlanCareAtSOC,"influenzaVaccineAtSOC": item.influenzaVaccineAtSOC,
    "pneumoniaVaccineAtSOC": item.pneumoniaVaccineAtSOC,"dnrStatus": item.dnrStatus,"advanceDirectivesNaratives": item.advanceDirectivesNaratives, "image": item.image,"dischargeReason": item.dischargeReason,"dischargeDate": item.dischargeDate,"dischargeTime": item.dischargeTime,"team": item.team,"facilityName": item.facilityName,"onHold": item.onHold,"offHold": item.offHold,"declineReason": item.declineReason,"declineDate": item.declineDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end




    def self.retrieve_patient_with_certification_order(organization_url)



subquery = PatientCertifications
  .select("patientUid, MAX(id) as max_certification_id")
  .group(:patientUid)
  .to_sql


  result = Patient
  .joins("LEFT JOIN (#{subquery}) subquery ON subquery.patientUid = patients.uid")
  .joins("LEFT JOIN patient_certifications ON patient_certifications.id = subquery.max_certification_id ")
  .select("MAX(patient_certifications.id) as certification_Id,patient_certifications.service_status as serviceStatus, patients.uid as patientID,patients.organization_url, firstName,middleName, lastName,patients.status, admissionDate as admitDate,certFrom, certTo")
  .where("patients.organization_url = ?", organization_url)
  .where.not("patient_certifications.id" => nil).group("patientID,firstName,lastName,middleName,patients.status,patients.organization_url,admitDate,certFrom, certTo")
  .order("certification_Id DESC") 

  phys_address_arr = []

  result.each do |item| 
    puts  referal_obj = Agency.where(organizationUrl: item.organization_url).select("agencyName,agencyType")
    puts "AGENCY SLECTEED ------>>>> #{item.inspect}"
  
 phys_address_arr << {"certification_Id": item.certification_Id,  "patientID": item.patientID,"firstName": item.firstName,"lastName": item.lastName,"middleName": item.middleName,"serviceStatus": item.serviceStatus, "status": item.status,"admitDate": item.admitDate,"agencyName": referal_obj[0].agencyName,"agencyType": referal_obj[0].agencyType,"certFrom": item.certFrom,"certTo": item.certTo, "payerReportingGroup": "","serviceCategory": ""
}
 end
 return phys_address_arr 




   end

end




####### Facility _identifier 
class FacilityDocuments < ActiveRecord::Base
  self.table_name = 'facility_documents'

   def self.retrieve_facility_documents

    select("id,facilityUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at")

  end

  def self.retrieve_single_facility_documents(id)
select("id,facilityUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_facility_documents_with_facilityUrl(facilityUrl)

    puts  fac_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")

    puts  fac_address_obj = FacilityDocuments.where(facilityUrl: facilityUrl).select("id,facilityUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at")
    
     phys_address_arr = []
     fac_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"attachTo": item.attachTo,"file": item.file,"documentType": item.documentType,"documentStatus": item.documentStatus,"description": item.description,"note": item.note,"uploadedBy": item.uploadedBy,"uploadedDate": item.uploadedDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end
end





####### physician_identifier 
class FacilityIdentifier < ActiveRecord::Base
  self.table_name = 'facility_identifier'

   def self.retrieve_facility_identifier

    select("id,facilityUrl,identifierType,identifierValue,startDate,endDate,updatedBy,created_at")

  end

  def self.retrieve_single_facility_identifier(id)
select("id,facilityUrl,identifierType,identifierValue,startDate,endDate,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_facility_identifier_with_facilityUrl(facilityUrl)

    puts  fac_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")

    puts  fac_address_obj = FacilityIdentifier.where(facilityUrl: facilityUrl).select("id,identifierType,identifierValue,startDate,endDate,updatedBy,created_at")
    
     phys_address_arr = []
     fac_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"identifierType": item.identifierType,"identifierValue": item.identifierValue,"startDate": item.startDate,"endDate": item.endDate,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end



####### creating_physician_notes 
class FacilityNote < ActiveRecord::Base
  self.table_name = 'facility_notes'

   def self.retrieve_facility_notes

    select("id,facilityUrl,date,noteBy,noteType,document,note,active,updatedBy,created_at")

  end

  def self.retrieve_single_facility_notes(id)
select("id,facilityUrl,date,noteBy,noteType,document,note,active,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_facility_notes_with_facilityUrl(facilityUrl)

     puts  fac_obj = Facility.where(url: facilityUrl).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated")

    puts  phys_address_obj = FacilityNote.where(facilityUrl: facilityUrl).select("id,date,noteBy,noteType,document,note,active,updatedBy,created_at")
    
     phys_address_arr = []
     phys_address_obj.each do |item| 
   

    phys_address_arr << {"id": item.id, "facility_details": fac_obj,"date": item.date,"noteBy": item.noteBy,"noteType": item.noteType,"document": item.document,"note": item.note,"active": item.active,"updatedBy": item.updatedBy,"created_at": item.created_at}
    end
    return phys_address_arr 
   

  end

end




####### creating_payments 
class Payment < ActiveRecord::Base
  self.table_name = 'payments'

   def self.retrieve_payments

    select("id,paymentSource,paymentMethod,paymentAmount,remitDate,depositDate,referenceNumber,applyPaymentsTo,
    noteType,note,agency,paymentType,accountBalance,amountToApply,paymentBalance,appliedToRemit,organizationUrl,paymentStatus,created_at")

  end

  def self.retrieve_single_payments(id)
select("id,paymentSource,paymentMethod,paymentAmount,remitDate,depositDate,referenceNumber,applyPaymentsTo,
    noteType,note,agency,paymentType,accountBalance,amountToApply,paymentBalance,appliedToRemit,organizationUrl,paymentStatus,created_at").where(
    "id = ?","#{id}"
    )
  end


end



####### creating_PayerNotes
class PayerNotes < ActiveRecord::Base
  self.table_name = 'payer_notes'

   def self.retrieve_payer_notes

    select("id,payerUrl,date,noteBy,noteType,document,note,active,created_at")

  end

  def self.retrieve_single_payer_notes(id)
select("id,payerUrl,date,noteBy,noteType,document,note,active,created_at").where(
    "id = ?","#{id}"
    )
  end


 def self.retrieve_single_payer_notes_payerUrl(payerUrl)
select("id,payerUrl,date,noteBy,noteType,document,note,active,created_at").where(
    "payerUrl = ?","#{payerUrl}"
    )
  end



end


####### creating_PatientAncillaryPhones
class PatientAncillaryPhones < ActiveRecord::Base
  self.table_name = 'patient_ancillary_phones'

   def self.retrieve_patient_ancillary_phones

    select("id,uid,patientID,phone,phoneType,extension,description,created_at")

  end

  def self.retrieve_single_patient_ancillary_phones(uid)
select("id,uid,patientID,phone,phoneType,extension,description,created_at").where(
    "uid = ?","#{uid}"
    )
  end


    def self.retrieve_single_patient_ancillary_phones_patientID(patientID)
select("id,uid,patientID,phone,phoneType,extension,description,created_at").where(
    "patientID = ?","#{patientID}"
    )
  end
end



####### PatientAddressPhoneInfo
class PatientAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'patient_address_phone_info'

   def self.retrieve_patient_address_phone_info

    select("uid,patientID,addressType,addressOne,addressTwo,city,state,zipcode,phoneType,phone,created_at,startDate,endDate") 

  end

  def self.retrieve_single_patient_address_phone_info(uid)
select("uid,patientID,addressType,addressOne,addressTwo,city,state,zipcode,phoneType,phone,created_at,startDate,endDate").where(
    "uid = ?","#{uid}"
    )
  end

    def self.retrieve_single_patient_address_phone_info_with_patientID(patientID)
select("uid,patientID,addressType,addressOne,addressTwo,city,state,zipcode,phoneType,phone,created_at,startDate,endDate").where(
    "patientID = ?","#{patientID}"
    )
  end
end



####### PayerSettings
class PayerSettings < ActiveRecord::Base
  self.table_name = 'payer_settings'

   def self.retrieve_payer_settings

    select("id,payerUrl,startDate,endDate,lastBilledDay,nextBillingDay,holdBillingDate,processThroughDate,
    reportingGroup,dayOfTheMonth,overrideWeekendingDate,restrictPayer,created_at")

  end

  def self.retrieve_single_payer_settings(id)
select("id,payerUrl,startDate,endDate,lastBilledDay,nextBillingDay,holdBillingDate,processThroughDate,
    reportingGroup,dayOfTheMonth,overrideWeekendingDate,restrictPayer,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_single_payer_settings_payerUrl(payerUrl)
select("id,payerUrl,startDate,endDate,lastBilledDay,nextBillingDay,holdBillingDate,processThroughDate,
    reportingGroup,dayOfTheMonth,overrideWeekendingDate,restrictPayer,created_at").where(
    "payerUrl = ?","#{payerUrl}"
    )
  end
end




####### PayerContactInfo
class PayerContactInfo < ActiveRecord::Base
  self.table_name = 'payer_ContactInfo'

   def self.retrieve_payer_ContactInfo

    select("id,payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,created_at,billTo,attention,description")

  end

  def self.retrieve_single_payer_ContactInfo(id)
select("id,payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,created_at,billTo,attention,description").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_single_payer_ContactInfo_with_payerUrl(payerUrl)
   
     puts  payer = Payer.where(url: payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,status,created_at")
     
     puts  org_obj = PayerContactInfo.where(payerUrl: payerUrl).select("id,payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,created_at,billTo,attention,description")
       

   
   org_obj_arr = [] 
     org_obj.each do |item| 
   
            org_obj_arr << {"id": item.id, "payer_details": payer, "addressType": item.addressType,"address1": item.address1,"address2": item.address2,
      "city": item.city,"billTo": item.billTo,"attention": item.attention,"description": item.description,"state": item.state,"zip": item.zip,"addressPhoneInfoPhones": item.addressPhoneInfoPhones
    }
    end
    return org_obj_arr 
  end
end




####### PayerContacts
class PayerContacts < ActiveRecord::Base
  self.table_name = 'payer_Contacts'

   def self.retrieve_payer_Contacts

    select("id,payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones,created_at")

  end

  def self.retrieve_single_payer_Contacts(id)
select("id,payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones,created_at").where(
    "id = ?","#{id}"
    )
  end

    def self.retrieve_single_payer_Contacts_payerUrl(payerUrl)
select("id,payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones,created_at").where(
    "payerUrl = ?","#{payerUrl}"
    )
  end
end


####### Payer
class Payer < ActiveRecord::Base
  self.table_name = 'payer'

   def self.retrieve_payer

    select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")

  end

  def self.retrieve_single_payer(url)
   

     puts  payer = Payer.where(url: url).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,status,url,created_at")
    
   
   phys_address_arr = []
     payer.each do |item| 
   
         puts  org_obj = Organization.where(url: item.organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       
    phys_address_arr << {"id": item.id, "organization_details": org_obj, "payerName": item.payerName,"payerCategory": item.payerCategory,"oasisCategory": item.oasisCategory,
      "claimFilingType": item.claimFilingType,"invoiceType": item.invoiceType,"invoiceCycle": item.invoiceCycle,"startDate": item.startDate,"endDate": item.endDate,"payerEmail": item.payerEmail,"applySalesTax": item.applySalesTax,"updated": item.updated,"url": item.url,"created_at": item.created_at,
    }
    end
    return phys_address_arr 
  end



  def self.retrieve_single_payer_with_org_url(organizationUrl)
   
     puts  payer = Payer.where(organizationUrl: organizationUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,status,created_at")
     puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       

   
   phys_address_arr = []
     payer.each do |item| 
   
            phys_address_arr << {"id": item.id, "organization_details": org_obj, "payerName": item.payerName,"payerCategory": item.payerCategory,"oasisCategory": item.oasisCategory,
      "claimFilingType": item.claimFilingType,"invoiceType": item.invoiceType,"invoiceCycle": item.invoiceCycle,"startDate": item.startDate,"endDate": item.endDate,"payerEmail": item.payerEmail,"applySalesTax": item.applySalesTax,"updated": item.updated,"url": item.url,"created_at": item.created_at,
    }
    end
    return phys_address_arr 
  end



  
end




####### PayerAncillaryPhone 
class PayerAncillaryPhone < ActiveRecord::Base
  self.table_name = 'payer_ancillary_phone'

   def self.retrieve_payer_ancillary_phone

    select("id,payerUrl,phoneType,phone,description")


  end



  def self.retrieve_single_payer_ancillary_phone(id)

    # select("id,associateUrl,phoneType,phone,description").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


    puts  anPhIn_obj = PayerAncillaryPhone.where(id: id).select("id,id,payerUrl,phoneType,phone,description")
    
 puts  payer = Payer.where(url: payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "payer_details": payer,"phoneType": item.phoneType, "phone": item.phone,"description": item.description}
    end
    return phys_address_arr 
  end

  def self.retrieve_single_payer_ancillary_phone_payerUrl(payerUrl)

    # select("id,associateUrl,phoneType,phone,description").where(
    # "associateUrl = ?","#{associateUrl}"
    # )


    puts  anPhIn_obj = PayerAncillaryPhone.where(payerUrl: payerUrl).select("id,payerUrl,phoneType,phone,description")
    
 puts  payer = Payer.where(url: payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

    
    phys_address_arr << {"id": item.id, "payer_details": payer,"phoneType": item.phoneType, "phone": item.phone,"description": item.description}
    end
    return phys_address_arr 
  end
end



####### PayerContacts
class PatientNotes < ActiveRecord::Base
  self.table_name = 'patient_notes'

   def self.retrieve_patient_notes

    select("id,uid,note,noteType,noteBy,patientID,document,active,date,created_at")

  end

  def self.retrieve_single_patient_notes(uid)
select("id,uid,note,noteType,noteBy,patientID,document,active,date,created_at").where(
    "uid = ?","#{uid}"
    )
  end


   def self.retrieve_single_patient_notes_patientID(patientID)
select("id,uid,note,noteType,noteBy,patientID,document,active,date,created_at").where(
    "patientID = ?","#{patientID}"
    )
  end
end



####### PayerContacts
class PatientContacts < ActiveRecord::Base
  self.table_name = 'patient_contacts'

   def self.retrieve_patient_contacts

    select("id,uid,patientID,relationship,contactType,firstName,lastName,dateOfBirth,sequence,email,misc,created_at")

  end

  def self.retrieve_single_patient_contacts(uid)
select("id,uid,patientID,relationship,contactType,firstName,lastName,dateOfBirth,sequence,email,misc,created_at").where(
    "uid = ?","#{uid}"
    )
  end

  def self.retrieve_single_patient_contacts_with_patientID(patientID)
select("id,uid,patientID,relationship,contactType,firstName,lastName,dateOfBirth,sequence,email,misc,created_at").where(
    "patientID = ?","#{patientID}"
    )
  end


  
end



####### referral_source_contacts
class ReferralSourceContact < ActiveRecord::Base
  self.table_name = 'referral_source_contacts'

   def self.retrieve_referral_source_contacts

    select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")

  end

  def self.retrieve_single_referral_source_contacts(uid)
select("uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information").where(
    "uid = ?","#{uid}"
    )
  end


    def self.retrieve_single_referral_source_contacts_with_org_url(organizationUrl)
   
     puts  payer = ReferralSourceContact.where(organizationUrl: organizationUrl).select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")
     puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       

   
   phys_address_arr = []
     payer.each do |item| 
   
            phys_address_arr << {"id": item.id, "organization_details": org_obj, "uid": item.uid,"firstName": item.firstName,"lastName": item.lastName,
      "email": item.email,"startDate": item.startDate,"phoneOne": item.phoneOne,"phoneTwo": item.phoneTwo,"phoneOneType": item.phoneOneType,"phoneTwoType": item.phoneTwoType,"referralSourceID": item.referralSourceID,"organizationUrl": item.organizationUrl,"information": item.information,"created_at": item.created_at,
    }
    end
    return phys_address_arr 
  end




  def self.retrieve_single_referral_source_contacts_with_referralSourceID(referralSourceID)
    select("uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information").where(
    "referralSourceID = ?","#{referralSourceID}"
    )
   
   #   puts  payer = ReferralSourceContact.where(organizationUrl: organizationUrl).select("id,uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,created_at,referralSourceID,organizationUrl,information")
   #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       

   
   # phys_address_arr = []
   #   payer.each do |item| 
   
   #          phys_address_arr << {"id": item.id, "organization_details": org_obj, "uid": item.uid,"firstName": item.firstName,"lastName": item.lastName,
   #    "email": item.email,"startDate": item.startDate,"phoneOne": item.phoneOne,"phoneTwo": item.phoneTwo,"phoneOneType": item.phoneOneType,"phoneTwoType": item.phoneTwoType,"referralSourceID": item.referralSourceID,"organizationUrl": item.organizationUrl,"information": item.information,"created_at": item.created_at,
   #  }
   #  end
   #  return phys_address_arr 
  end
end


####### ReferralSource
class ReferralSource < ActiveRecord::Base
  self.table_name = 'referral_source'

   def self.retrieve_referral_source

    select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")

  end

  def self.retrieve_single_referral_source(uid)
select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at").where(
    "uid = ?","#{uid}"
    )
  end


  def self.retrieve_single_referral_source_with_org_url(organizationUrl)
   
     puts  payer = ReferralSource.where(organizationUrl: organizationUrl).select("id,uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,
      middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated,created_at")
     puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
       

   
   phys_address_arr = []
     payer.each do |item| 
   
            phys_address_arr << {"id": item.id, "organization_details": org_obj, "uid": item.uid,"firstName": item.firstName,"lastName": item.lastName,
      "email": item.email,"startDate": item.startDate,"referralType": item.referralType,"middleName": item.middleName,"salesRep": item.salesRep,"endDate": item.endDate,
      "physicianGroup": item.physicianGroup,"specialty": item.specialty,"title": item.title,"organizationUrl": item.organizationUrl,"created_at": item.created_at,"facilityName": item.facilityName,
      "facilityType": item.facilityType,"referralCompany": item.referralCompany, "status": item.status,"updated": item.updated
    }
    end
    return phys_address_arr 
  end
end




####### AssociateMedicalCompliance
class AssociateMedicalCompliance < ActiveRecord::Base
  self.table_name = 'associate_medical_compliance'

   def self.retrieve_associate_medical_compliance

    select("id,associateUrl,comment,completed,complianceType,compliant,item,lastModifiedBy,lastModifiedByDate,narrative,notNeeded,renewal,result,created_at")

  end

  def self.retrieve_single_associate_medical_compliance(id)

  puts  anPhIn_obj = AssociateMedicalCompliance.where(id: id).select("id,associateUrl,comment,completed,complianceType,compliant,item,lastModifiedBy,lastModifiedByDate,narrative,notNeeded,renewal,result,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts associate_obj  = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"comment": item.comment, "completed": item.completed,"complianceType": item.complianceType,"compliant": item.compliant,
      "item": item.item,"lastModifiedBy": item.lastModifiedBy,"lastModifiedByDate": item.lastModifiedByDate,"narrative": item.narrative,"notNeeded": item.notNeeded,"renewal": item.renewal,"result": item.result}
    end
    return phys_address_arr 

   
  end



  def self.retrieve_single_associate_medical_compliance_with_ass_url(associateUrl)

  puts  anPhIn_obj = AssociateMedicalCompliance.where(associateUrl: associateUrl).select("id,associateUrl,comment,completed,complianceType,compliant,item,lastModifiedBy,lastModifiedByDate,narrative,notNeeded,renewal,result,created_at")
     puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

 phys_address_arr << {"id": item.id, "associate_details": associate_obj,"comment": item.comment, "completed": item.completed,"complianceType": item.complianceType,"compliant": item.compliant,
      "item": item.item,"lastModifiedBy": item.lastModifiedBy,"lastModifiedByDate": item.lastModifiedByDate,"narrative": item.narrative,"notNeeded": item.notNeeded,"renewal": item.renewal,"result": item.result}
  
    

        end
    return phys_address_arr 

   
  end


end




####### AssociateReport
class AssociateReport < ActiveRecord::Base
  self.table_name = 'associate_reports'

   def self.retrieve_associate_reports

    select("id,associateUrl,reportName,startDate,endDate,created_at")

  end

  def self.retrieve_single_associate_reports(id)

  puts  anPhIn_obj = AssociateReport.where(id: id).select("id,associateUrl,reportName,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts associate_obj  = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

    phys_address_arr << {"id": item.id, "associate_details": associate_obj,"reportName": item.reportName, "startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end



  def self.retrieve_single_associate_reports_with_ass_url(associateUrl)

  puts  anPhIn_obj = AssociateReport.where(associateUrl: associateUrl).select("id,associateUrl,reportName,startDate,endDate,created_at")
      puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

   phys_address_arr << {"id": item.id, "associate_details": associate_obj,"reportName": item.reportName, "startDate": item.startDate,"endDate": item.endDate}

    

        end
    return phys_address_arr 

   
  end


end


####### PayerForm
class PayerForm < ActiveRecord::Base
  self.table_name = 'payer_form'

   def self.retrieve_payer_form

    select("id,payerUrl,automatedFormType,uploadDocumentType,orderToRecheck,startDate,endDate,created_at")

  end

  def self.retrieve_single_payer_form(id)

  puts  anPhIn_obj = PayerForm.where(id: id).select("id,payerUrl,automatedFormType,uploadDocumentType,orderToRecheck,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"automatedFormType": item.automatedFormType, "uploadDocumentType": item.uploadDocumentType,"orderToRecheck": item.orderToRecheck,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end



   def self.retrieve_single_payer_form_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerForm.where(payerUrl: payerUrl).select("id,payerUrl,automatedFormType,uploadDocumentType,orderToRecheck,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"automatedFormType": item.automatedFormType, "uploadDocumentType": item.uploadDocumentType,"orderToRecheck": item.orderToRecheck,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end

end




####### PayerForm
class PayerRule < ActiveRecord::Base
  self.table_name = 'payer_rules'

   def self.retrieve_payer_rules

    select("id,payerUrl,rule,description,groupCode,modifiedBy,modifiedDate,createdDate,startDate,endDate,status,created_at")

  end

  def self.retrieve_single_payer_rules(id)

  puts  anPhIn_obj = PayerRule.where(id: id).select("id,payerUrl,rule,description,groupCode,modifiedBy,modifiedDate,createdDate,startDate,endDate,status,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"rule": item.rule, "description": item.description,"groupCode": item.groupCode,"modifiedBy": item.modifiedBy,"modifiedDate": item.modifiedDate,"createdDate": item.createdDate,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end




   def self.retrieve_single_payer_rules_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerRule.where(payerUrl: payerUrl).select("id,payerUrl,rule,description,groupCode,modifiedBy,modifiedDate,createdDate,startDate,endDate,status,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"rule": item.rule, "description": item.description,"groupCode": item.groupCode,"modifiedBy": item.modifiedBy,"modifiedDate": item.modifiedDate,"createdDate": item.createdDate,"startDate": item.startDate,"endDate": item.endDate, "status": item.status, "created_at": item.created_at}
    end
    return phys_address_arr 

   
  end

end



####### PayerDocuments
class PayerDocuments < ActiveRecord::Base
  self.table_name = 'payer_documents'

   def self.retrieve_payer_documents

    select("id,payerUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,attachTo,created_at")

  end

  def self.retrieve_single_payer_documents(id)

  puts  anPhIn_obj = PayerDocuments.where(id: id).select("id,payerUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,attachTo,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"file": item.file, "documentType": item.documentType,"documentStatus": item.documentStatus,"description": item.description,"note": item.note,"uploadedBy": item.uploadedBy,"uploadedDate": item.uploadedDate,"attachTo": item.attachTo}
    end
    return phys_address_arr 

   
  end




   def self.retrieve_single_payer_documents_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerDocuments.where(payerUrl: payerUrl).select("id,payerUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,attachTo,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"file": item.file, "documentType": item.documentType,"documentStatus": item.documentStatus,"description": item.description,"note": item.note,"uploadedBy": item.uploadedBy,"uploadedDate": item.uploadedDate,"attachTo": item.attachTo}
    end
    return phys_address_arr 

   
  end

end


####### PayerDocuments
class PayerBillRates < ActiveRecord::Base
  self.table_name = 'payer_bill_rates'

   def self.retrieve_payer_bill_rates

    select("id,payerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at")

  end

  def self.retrieve_single_payer_bill_rates(id)

  puts  anPhIn_obj = PayerBillRates.where(id: id).select("id,payerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"serviceCategory": item.serviceCategory, "service": item.service,"description": item.description,"unitOfMeasure": item.unitOfMeasure,"payerRate": item.payerRate,"allowOverride": item.allowOverride,"startDate": item.startDate,"revenueCode": item.revenueCode, "hcpcCode": item.hcpcCode,
      "agency": item.agency,"assessment": item.assessment,"endDate": item.endDate, "useAgencyChargeAmount": item.useAgencyChargeAmount,"chargeAmount": item.chargeAmount,"serviceType": item.serviceType,"hcpcModifier1": item.hcpcModifier1,"hcpcModifier2": item.hcpcModifier2,
      "hcpcModifier3": item.hcpcModifier3,"hcpcModifier4": item.hcpcModifier4,"treatmentCodeNeeded": item.treatmentCodeNeeded,"unitMultiplier": item.unitMultiplier,"incrementalBillingCode": item.incrementalBillingCode,
      "sendBillingDescriptionForEdit": item.sendBillingDescriptionForEdit,"evvProgram": item.evvProgram,"evvGroupedProcedureCode": item.evvGroupedProcedureCode,"lastUpdated": item.lastUpdated,"modifyUser": item.modifyUser, "created_at": item.created_at
    }
    end
    return phys_address_arr 

   
  end



  def self.retrieve_single_payer_bill_rates_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerBillRates.where(payerUrl: payerUrl).select("id,payerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"serviceCategory": item.serviceCategory, "service": item.service,"description": item.description,"unitOfMeasure": item.unitOfMeasure,"payerRate": item.payerRate,"allowOverride": item.allowOverride,"startDate": item.startDate,"revenueCode": item.revenueCode, "hcpcCode": item.hcpcCode,
    "agency": item.agency,"assessment": item.assessment,"endDate": item.endDate, "useAgencyChargeAmount": item.useAgencyChargeAmount,"chargeAmount": item.chargeAmount,"serviceType": item.serviceType,"hcpcModifier1": item.hcpcModifier1,"hcpcModifier2": item.hcpcModifier2,
      "hcpcModifier3": item.hcpcModifier3,"hcpcModifier4": item.hcpcModifier4,"treatmentCodeNeeded": item.treatmentCodeNeeded,"unitMultiplier": item.unitMultiplier,"incrementalBillingCode": item.incrementalBillingCode,
      "sendBillingDescriptionForEdit": item.sendBillingDescriptionForEdit,"evvProgram": item.evvProgram,"evvGroupedProcedureCode": item.evvGroupedProcedureCode,"lastUpdated": item.lastUpdated,"modifyUser": item.modifyUser, "created_at": item.created_at}
    end
    return phys_address_arr 

   
  end

end




####### PayerRequirements
class PayerRequirements < ActiveRecord::Base
  self.table_name = 'payer_requirements'

   def self.retrieve_payer_requirements

    select("id,payerUrl,generalReq_patientLevelOverride,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,clinicalReq_patientLevelOverride,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission, assessmentVisits,physiciansOrders,clinicalNotes,copayRep_patientLevelOverride,
   copayType,copaySplit,billOvertime,miscBilling,eligible,insuredInformation,invoice_patientLevelOverride,invoice_patientLevelOverride,patientLevelOverride,serviceDescription,created_at")

  end

  def self.retrieve_single_payer_requirements(id)

  puts  anPhIn_obj = PayerRequirements.where(id: id).select("id,payerUrl,generalReq_patientLevelOverride,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,clinicalReq_patientLevelOverride,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission, assessmentVisits,physiciansOrders,clinicalNotes,copayRep_patientLevelOverride,
   copayType,copaySplit,billOvertime,miscBilling,eligible,insuredInformation,invoice_patientLevelOverride,invoiceFrequencyOverride,patientLevelOverride,serviceDescription,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"generalReq_patientLevelOverride": item.generalReq_patientLevelOverride,"authorizationHash": item.authorizationHash,"byDiscipline": item.byDiscipline,
    "byServiceCode": item.byServiceCode,"byVisits": item.byVisits,"byHours": item.byHours,"byAmount": item.byAmount,"clinicalReq_patientLevelOverride": item.clinicalReq_patientLevelOverride,"oasis": item.oasis,"certificationPeriodDays": item.certificationPeriodDays,
   "noticeOfElection": item.noticeOfElection,"noticeOfAdmission": item.noticeOfAdmission, "assessmentVisits": item.assessmentVisits,"physiciansOrders": item.physiciansOrders,"clinicalNotes": item.clinicalNotes,"copayRep_patientLevelOverride": item.copayRep_patientLevelOverride,
   "copayType": item.copayType,"copaySplit": item.copaySplit,"billOvertime": item.billOvertime,"miscBilling": item.miscBilling,"eligible": item.eligible,"insuredInformation": item.insuredInformation,"invoice_patientLevelOverride": item.invoice_patientLevelOverride,"invoiceFrequencyOverride": item.invoiceFrequencyOverride,"patientLevelOverride": item.patientLevelOverride}
    end
    return phys_address_arr 

   
  end



    def self.retrieve_single_payer_requirements_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerRequirements.where(payerUrl: payerUrl).select("id,payerUrl,generalReq_patientLevelOverride,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,clinicalReq_patientLevelOverride,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission, assessmentVisits,physiciansOrders,clinicalNotes,copayRep_patientLevelOverride,
   copayType,copaySplit,billOvertime,miscBilling,eligible,insuredInformation,invoice_patientLevelOverride,invoiceFrequencyOverride,patientLevelOverride,serviceDescription,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"generalReq_patientLevelOverride": item.generalReq_patientLevelOverride,"authorizationHash": item.authorizationHash,"byDiscipline": item.byDiscipline,
    "byServiceCode": item.byServiceCode,"byVisits": item.byVisits,"byHours": item.byHours,"byAmount": item.byAmount,"clinicalReq_patientLevelOverride": item.clinicalReq_patientLevelOverride,"oasis": item.oasis,"certificationPeriodDays": item.certificationPeriodDays,
   "noticeOfElection": item.noticeOfElection,"noticeOfAdmission": item.noticeOfAdmission, "assessmentVisits": item.assessmentVisits,"physiciansOrders": item.physiciansOrders,"clinicalNotes": item.clinicalNotes,"copayRep_patientLevelOverride": item.copayRep_patientLevelOverride,
   "copayType": item.copayType,"copaySplit": item.copaySplit,"billOvertime": item.billOvertime,"miscBilling": item.miscBilling,"eligible": item.eligible,"insuredInformation": item.insuredInformation,"invoice_patientLevelOverride": item.invoice_patientLevelOverride,"invoiceFrequencyOverride": item.invoiceFrequencyOverride,"patientLevelOverride": item.patientLevelOverride,"serviceDescription": item.serviceDescription}

    end
    return phys_address_arr 

   
  end

end




####### PatientPayerRequirements
class PatientPayerRequirements < ActiveRecord::Base
  self.table_name = 'patient_payer_requirements'

   def self.retrieve_patient_payer_requirements

    select("id,patientPayerUrl,assessmentVisits,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission,physiciansOrders,clinicalNotes,
   copayType,billOvertime,miscBilling,eligible,insuredInformation,invoiceCycle,invoiceType,oasisWbStartDate,supervisoryWbStartDate,serviceDescription,formWbStartDate,created_at")

  end

  def self.retrieve_single_patient_payer_requirements(id)

  puts  anPhIn_obj = PatientPayerRequirements.where(id: id).select("id,patientPayerUrl,assessmentVisits,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission,physiciansOrders,clinicalNotes,
   copayType,billOvertime,miscBilling,eligible,insuredInformation,invoiceCycle,invoiceType,oasisWbStartDate,supervisoryWbStartDate,serviceDescription,formWbStartDate,created_at")
     return anPhIn_obj
  end



    def self.retrieve_payer_payer_requirements_patientPayerUrl(patientPayerUrl)

  puts  anPhIn_obj = PatientPayerRequirements.where(patientPayerUrl: patientPayerUrl).select("id,patientPayerUrl,assessmentVisits,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission,physiciansOrders,clinicalNotes,
   copayType,billOvertime,miscBilling,eligible,insuredInformation,invoiceCycle,invoiceType,oasisWbStartDate,supervisoryWbStartDate,serviceDescription,formWbStartDate,created_at")
     return anPhIn_obj
     
    end
end





####### PatientVendors
class PatientVendors < ActiveRecord::Base
  self.table_name = 'patient_vendors'

   def self.retrieve_patient_vendors

    select("id,uid,startDate,endDate,sequence,prefered,patientID,vendor,vendorID,vendorType,created_at")

  end

  def self.retrieve_single_patient_vendors(uid)

  puts  anPhIn_obj = PatientVendors.where(uid: uid).select("id,uid,startDate,endDate,sequence,prefered,patientID,vendor,vendorID,vendorType,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"startDate": item.startDate, "endDate": item.endDate,"sequence": item.sequence,"prefered": item.prefered,"patientID": item.patientID, "vendor": item.vendor, "vendorID": item.vendorID, "vendorType": item.vendorType}
    end
    return phys_address_arr 

   
  end




    def self.retrieve_single_patient_vendors_with_patientID(patientID)

  puts  anPhIn_obj = PatientVendors.where(patientID: patientID).select("id,uid,startDate,endDate,sequence,prefered,patientID,vendor,vendorID,vendorType,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"id": item.id,"uid": item.uid, "patient_details": payer_obj,"startDate": item.startDate, "endDate": item.endDate,"sequence": item.sequence,"prefered": item.prefered,"patientID": item.patientID, "vendor": item.vendor, "vendorID": item.vendorID, "vendorType": item.vendorType}
    end
    return phys_address_arr 

   
  end

end



####### PatientVaccine
class PatientVaccine < ActiveRecord::Base
  self.table_name = 'patient_vaccine'

   def self.retrieve_patient_vaccine

    select("uid,description,datePerformed,patientID,vaccineID,created_at")

  end

  def self.retrieve_single_patient_vaccine(uid)

  puts  anPhIn_obj = PatientVaccine.where(uid: uid).select("uid,description,datePerformed,patientID,vaccineID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "datePerformed": item.datePerformed,"patientID": item.patientID, "vaccineID": item.vaccineID}
    end
    return phys_address_arr 
   
  end





    def self.retrieve_single_patient_vaccine_with_patientID(patientID)

  puts  anPhIn_obj = PatientVaccine.where(patientID: patientID).select("uid,description,datePerformed,patientID,vaccineID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "datePerformed": item.datePerformed,"patientID": item.patientID, "vaccineID": item.vaccineID}
    end
    return phys_address_arr 
   
  end
end



####### PatientVitalSigns
class PatientVitalSigns < ActiveRecord::Base
  self.table_name = 'patient_vital_signs'

   def self.retrieve_patient_vital_signs

    select("id,uid,description,high,low,patientID,vitalID,created_at")

  end

  def self.retrieve_single_patient_vital_signs(uid)

  puts  anPhIn_obj = PatientVitalSigns.where(uid: uid).select("id,uid,description,high,low,patientID,vitalID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "high": item.high,"low": item.low,"patientID": item.patientID, "vitalID": item.vitalID}
    end
    return phys_address_arr 
   
  end


    def self.retrieve_single_patient_vital_signs_with_patient(patientID)

  puts  anPhIn_obj = PatientVitalSigns.where(patientID: patientID).select("id,uid,description,high,low,patientID,vitalID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "high": item.high,"low": item.low,"patientID": item.patientID, "vitalID": item.vitalID}
    end
    return phys_address_arr 
   
  end
end




####### PatientVitalSigns
class PatientAllergies < ActiveRecord::Base
  self.table_name = 'patient_allergies'

   def self.retrieve_patient_allergies

    select("id,uid,description,status,startDate,endDate,createdBy,modifiedBy,patientID,created_at")

  end

  def self.retrieve_single_patient_allergies(uid)

  puts  anPhIn_obj = PatientAllergies.where(uid: uid).select("id,uid,description,status,startDate,endDate,createdBy,modifiedBy,patientID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "status": item.status,"startDate": item.startDate,"endDate": item.endDate,"createdBy": item.createdBy,"patientID": item.patientID}
    end
    return phys_address_arr 
   
  end



   def self.retrieve_single_patient_allergies_with_patientID(patientID)

  puts  anPhIn_obj = PatientAllergies.where(patientID: patientID).select("id,uid,description,status,startDate,endDate,createdBy,modifiedBy,patientID,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"description": item.description, "status": item.status,"startDate": item.startDate,"endDate": item.endDate,"createdBy": item.createdBy,"modifiedBy": item.modifiedBy,"patientID": item.patientID}
    end
    return phys_address_arr 
   
  end
end




####### PatientAdvanceDirectives
class PatientAdvanceDirectives < ActiveRecord::Base
  self.table_name = 'patients_advance_directives'

   def self.retrieve_patient_advance_directives

    select("id,uid,file,attachTo,documentType,documentStatus,note,description,patientID,advanceDirective,created_at,signedDate")

  end

  def self.retrieve_single_patient_advance_directives(uid)

  puts  anPhIn_obj = PatientAdvanceDirectives.where(uid: uid).select("id,uid,file,attachTo,documentType,documentStatus,note,description,patientID,advanceDirective,created_at,signedDate")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"file": item.file, "attachTo": item.attachTo,"documentType": item.documentType,"documentStatus": item.documentStatus,"note": item.note,
      "patientID": item.patientID,"description": item.description,"advanceDirective": item.advanceDirective, "signedDate": item.signedDate}
    end
    return phys_address_arr 
   
  end




   def self.retrieve_single_patient_advance_directives_with_patientID(patientID)

  puts  anPhIn_obj = PatientAdvanceDirectives.where(patientID: patientID).select("id,uid,file,attachTo,documentType,documentStatus,note,description,patientID,advanceDirective,created_at,signedDate")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"file": item.file, "attachTo": item.attachTo,"documentType": item.documentType,"documentStatus": item.documentStatus,"note": item.note,
      "patientID": item.patientID,"description": item.description, "advanceDirective": item.advanceDirective,"signedDate": item.signedDate}
    end
    return phys_address_arr 
   
  end





end



####### PatientConsent
class PatientConsent < ActiveRecord::Base
  self.table_name = 'patients_consent'

   def self.retrieve_patient_consent

    select("id,file,attachTo,documentType,documentStatus,note,description,patientID,uploadedBy,created_at,notice,signatureDate,infoSource,infoSourceDate,signatureSource,signatureSourceDate")

  end

  def self.retrieve_single_patient_consent(id)

  puts  anPhIn_obj = PatientConsent.where(id: id).select("id,file,attachTo,documentType,documentStatus,note,description,patientID,uploadedBy,created_at,notice,signatureDate,infoSource,infoSourceDate,signatureSource,signatureSourceDate")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"id": item.id,"file": item.file, "attachTo": item.attachTo,"documentType": item.documentType,"documentStatus": item.documentStatus,"note": item.note,
      "patientID": item.patientID,"description": item.description, "uploadedBy": item.uploadedBy, "notice": item.notice,"signatureDate": item.signatureDate,"infoSource": item.infoSource,"infoSourceDate": item.infoSourceDate,"signatureSource": item.signatureSource,"signatureSourceDate": item.signatureSourceDate}
    end
    return phys_address_arr 
   
  end




    def self.retrieve_single_patient_consent_patientID(patientID)

  puts  anPhIn_obj = PatientConsent.where(patientID: patientID).select("id,file,attachTo,documentType,documentStatus,note,description,patientID,uploadedBy,created_at,notice,signatureDate,infoSource,infoSourceDate,signatureSource,signatureSourceDate")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"id": item.id,"file": item.file, "attachTo": item.attachTo,"documentType": item.documentType,"documentStatus": item.documentStatus,"note": item.note,
      "patientID": item.patientID,"description": item.description, "uploadedBy": item.uploadedBy, "notice": item.notice,"signatureDate": item.signatureDate,"infoSource": item.infoSource,"infoSourceDate": item.infoSourceDate,"signatureSource": item.signatureSource,"signatureSourceDate": item.signatureSourceDate}
    end
    return phys_address_arr 
   
  end





end



####### PatientDme
class PatientDme < ActiveRecord::Base
  self.table_name = 'patients_dme'

   def self.retrieve_patient_dme

    select("id,uid,vendor,deliveryDate,returnDate,comment,patientID,description,created_at")

  end

  def self.retrieve_single_patient_dme(uid)

  puts  anPhIn_obj = PatientDme.where(uid: uid).select("id,uid,vendor,deliveryDate,returnDate,comment,patientID,description,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"vendor": item.vendor, "deliveryDate": item.deliveryDate,"returnDate": item.returnDate,"comment": item.comment,"description": item.description}
    end
    return phys_address_arr 
   
  end

    def self.retrieve_single_patient_dme_with_patientID(patientID)

  puts  anPhIn_obj = PatientDme.where(patientID: patientID).select("id,uid,vendor,deliveryDate,returnDate,comment,patientID,description,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Patient.where(id: item.patientID).select("patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities")

    

    phys_address_arr << {"uid": item.uid, "patient_details": payer_obj,"vendor": item.vendor, "deliveryDate": item.deliveryDate,"returnDate": item.returnDate,"comment": item.comment,"description": item.description}
    end
    return phys_address_arr 
   
  end
end








####### PayerIdentifiers
class PayerIdentifiers < ActiveRecord::Base
  self.table_name = 'payer_identifiers'

   def self.retrieve_payer_identifiers

    select("id,payerUrl,agencyUrl,identifierType,identifierValue,startDate,endDate,created_at")

  end

  def self.retrieve_single_payer_identifiers(id)

  puts  anPhIn_obj = PayerIdentifiers.where(id: id).select("id,payerUrl,agencyUrl,identifierType,identifierValue,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"agency_details": agency_obj,"identifierType": item.identifierType, "identifierValue": item.identifierValue,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end





    def self.retrieve_payer_identifiers_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerIdentifiers.where(payerUrl: payerUrl).select("id,payerUrl,agencyUrl,identifierType,identifierValue,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"agency_details": agency_obj,"identifierType": item.identifierType, "identifierValue": item.identifierValue,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end

end


####### PayerInvoiceReviews
class PayerInvoiceReviews < ActiveRecord::Base
  self.table_name = 'payer_invoice_reviews'

   def self.retrieve_payer_invoice_reviews

    select("id,payerUrl,title,startDate,endDate,created_at")

  end

  def self.retrieve_single_payer_invoice_reviews(id)

  puts  anPhIn_obj = PayerInvoiceReviews.where(id: id).select("id,payerUrl,title,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"title": item.title,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 
  end



   def self.retrieve_single_payer_invoice_reviews_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerInvoiceReviews.where(payerUrl: payerUrl).select("id,payerUrl,title,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"title": item.title,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 
  end




end




####### PayerHcpc
class PayerHcpc < ActiveRecord::Base
  self.table_name = 'payer_hcpc'

   def self.retrieve_payer_hcpc

    select("id,payerUrl,placeOfService,serviceCode,hcpcCode,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,startDate,endDate,created_at")

  end

  def self.retrieve_single_payer_hcpc(id)

  puts  anPhIn_obj = PayerHcpc.where(id: id).select("id,payerUrl,placeOfService,serviceCode,hcpcCode,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"placeOfService": item.placeOfService,"hcpcCode": item.hcpcCode,"hcpcModifier1": item.hcpcModifier1,
      "hcpcModifier2": item.hcpcModifier2,"hcpcModifier3": item.hcpcModifier3,"hcpcModifier4": item.hcpcModifier4,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end




    def self.retrieve_single_payer_hcpc_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerHcpc.where(payerUrl: payerUrl).select("id,payerUrl,placeOfService,serviceCode,hcpcCode,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"placeOfService": item.placeOfService,"serviceCode": item.serviceCode,"hcpcCode": item.hcpcCode,"hcpcModifier1": item.hcpcModifier1,
      "hcpcModifier2": item.hcpcModifier2,"hcpcModifier3": item.hcpcModifier3,"hcpcModifier4": item.hcpcModifier4,"startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end

end



####### PayerCarrierCode
class PayerCarrierCode < ActiveRecord::Base
  self.table_name = 'payer_carrier_code'

   def self.retrieve_payer_carrier_code

    select("id,payerUrl,relationalPayer,carrierCode,startDate,endDate,created_at")

  end

  def self.retrieve_single_payer_carrier_code(id)

  puts  anPhIn_obj = PayerCarrierCode.where(id: id).select("id,payerUrl,relationalPayer,carrierCode,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"relationalPayer": item.relationalPayer,"carrierCode": item.carrierCode,
      "startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end



    def self.retrieve_single_payer_carrier_code_payerUrl(payerUrl)

  puts  anPhIn_obj = PayerCarrierCode.where(payerUrl: payerUrl).select("id,payerUrl,relationalPayer,carrierCode,startDate,endDate,created_at")
    
     
     phys_address_arr = []
     anPhIn_obj.each do |item| 

  puts payer_obj  = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    
  #puts agency_obj  = Agency.where(url: item.agencyUrl).select("id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated")
   

    phys_address_arr << {"id": item.id, "payer_details": payer_obj,"relationalPayer": item.relationalPayer,"carrierCode": item.carrierCode,
      "startDate": item.startDate,"endDate": item.endDate}
    end
    return phys_address_arr 

   
  end

end




####### PayerCarrierCode
class AssLookupInactiveReasonTypes < ActiveRecord::Base
  self.table_name = 'ass_lookup_inactive_reason_types'

   def self.retrieve_all_inactive_reason_types
    select("id,organizationUrl,code,description,groupCode,sortOrder,startDate,endDate,created_at")
  end


    def self.retrieve_inactive_reason_types(id)
select("id,organizationUrl,code,description,groupCode,sortOrder,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end




   def self.retrieve_inactive_reason_types_with_organizationUrl(organizationUrl)
  puts fac_obj = AssLookupInactiveReasonTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,code,description,groupCode,sortOrder,startDate,endDate,created_at")
    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
     phys_address_arr = []
     fac_obj.each do |item| 
 
    phys_address_arr << {"id": item.id,"organization_details": org_obj,"code": item.code, "description": item.description,"groupCode": item.groupCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl}
    end
    return phys_address_arr 
  end

  end




  class AssLookupDisciplineTypes < ActiveRecord::Base
  self.table_name = 'ass_lookup_discipline_types'

   def self.retrieve_all_discipline_types
    select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
    allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  end


    def self.retrieve_discipline_types(id)
select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
    allowConnectionToPhysician,assessmentGroup,payCode,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
    allowConnectionToPhysician,assessmentGroup,payCode,created_at")
    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
     phys_address_arr = []
     fac_obj.each do |item| 
 
    phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
     "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
    end
    return phys_address_arr 
  end



  end




   class Notes < ActiveRecord::Base
  self.table_name = 'notes'

   def self.retrieve_all_notes
    select("id,noteType,payer,followUpDate,note,created_at")
  end


    def self.retrieve_notes(id)
select("id,noteType,payer,followUpDate,note,created_at").where(
    "id = ?","#{id}"
    )
  end

    def self.retrieve_notes(id)
select("id,noteType,payer,followUpDate,note,created_at").where(
    "id = ?","#{id}"
    )
  end

  end



  class AssLookupDeductions < ActiveRecord::Base
  self.table_name = 'ass_lookup_deductions'

   def self.retrieve_all_lookup_deductions
    select("id,organizationUrl,isRecurring,description,isPretax,calculation,coverage,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_lookup_deduction(id)
select("id,organizationUrl,isRecurring,description,isPretax,calculation,coverage,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_lookup_deduction_organizationUrl(organizationUrl)
select("id,organizationUrl,isRecurring,description,isPretax,calculation,coverage,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end




  class AssLookupNoteType < ActiveRecord::Base
  self.table_name = 'ass_lookup_noteType'

   def self.retrieve_all_lookup_noteType
    select("id,organizationUrl,code,description,doNotGenerateWbTask,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_lookup_noteType(id)
select("id,organizationUrl,code,description,doNotGenerateWbTask,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end

      def self.retrieve_lookup_noteType_organizationUrl(organizationUrl)
select("id,organizationUrl,code,description,doNotGenerateWbTask,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



    class AssLookupcontractorCompanies < ActiveRecord::Base
  self.table_name = 'ass_lookup_contractorCompanies'

   def self.retrieve_all_lookup_contractorCompanies
    select("id,organizationUrl,name,phone,created_at")
  end


    def self.retrieve_lookup_contractorCompanies(id)
    select("id,organizationUrl,name,phone,created_at").where(
    "id = ?","#{id}"
    )
  end


      def self.retrieve_lookup_contractorCompanies_organizationUrl(organizationUrl)
    select("id,organizationUrl,name,phone,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



   class AssLookupCompliance < ActiveRecord::Base
  self.table_name = 'ass_lookup_compliance'

   def self.retrieve_all_lookup_compliance
    select("id,organizationUrl,name,description,category,appliesTo,requiredForScheduling,dateType,
    startDate,endDate,complianceDisciplines,created_at")
  end


    def self.retrieve_lookup_compliance(id)
select("id,organizationUrl,name,description,category,appliesTo,requiredForScheduling,dateType,
    startDate,endDate,complianceDisciplines,created_at").where(
    "id = ?","#{id}"
    )
  end

     def self.retrieve_lookup_compliance_organizationUrl(organizationUrl)
select("id,organizationUrl,name,description,category,appliesTo,requiredForScheduling,dateType,
    startDate,endDate,complianceDisciplines,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end



  end



 class AssLookupLicenseType < ActiveRecord::Base
  self.table_name = 'ass_lookup_licenseType'

   def self.retrieve_all_lookup_licenseType
    select("id,organizationUrl,description,code,groupCode,requiredForScheduling,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_lookup_licenseType(id)
select("id,organizationUrl,description,code,groupCode,requiredForScheduling,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_lookup_licenseType_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,requiredForScheduling,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end


   class AssLookupSchedulingRankType < ActiveRecord::Base
  self.table_name = 'ass_lookup_schedulingRankType'

   def self.retrieve_all_lookup_schedulingRankType
    select("id,organizationUrl,description,
    startDate,endDate,created_at")
  end


    def self.retrieve_lookup_schedulingRankType(id)
select("id,organizationUrl,description,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


     def self.retrieve_lookup_schedulingRankType_organizationUrl(organizationUrl)
select("id,organizationUrl,description,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end


    class ArLookupHcpcModifierType < ActiveRecord::Base
  self.table_name = 'ar_lookup_hcpc_modifier_types'

   def self.retrieve_all_arlookup_hcpcModifierType
    select("id,organizationUrl,description,hcpcModifierCodes,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_arlookup_hcpcModifierType(id)
select("id,organizationUrl,description,hcpcModifierCodes,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end



    def self.retrieve_arlookup_hcpcModifierType_organizationUrl(organizationUrl)
select("id,organizationUrl,description,hcpcModifierCodes,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end



  end



    class ArLookupPaymentSources < ActiveRecord::Base
  self.table_name = 'ar_lookup_paymentSources'

   def self.retrieve_all_arlookup_paymentSources
    select("id,organizationUrl,paymentSource,paymentMethod,created_at")
  end


    def self.retrieve_arlookup_paymentSources(id)
select("id,organizationUrl,paymentSource,paymentMethod,created_at").where(
    "id = ?","#{id}"
    )
  end



    def self.retrieve_arlookup_paymentSources_organizationUrl(organizationUrl)
select("id,organizationUrl,paymentSource,paymentMethod,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end




      class ArLookupEraReasonType < ActiveRecord::Base
  self.table_name = 'ar_lookup_era_reason_type'

   def self.retrieve_all_arlookup_eraReasonType
    select("id,organizationUrl,eraReasonCode,arAdjustmentReason,adjustmentLevel,
    startDate,endDate,created_at")
  end


    def self.retrieve_arlookup_eraReasonType(id)
select("id,organizationUrl,eraReasonCode,arAdjustmentReason,adjustmentLevel,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_arlookup_eraReasonType_organizationUrl(organizationUrl)
select("id,organizationUrl,eraReasonCode,arAdjustmentReason,adjustmentLevel,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
end




  ####### PatientAddressPhoneInfo
class PatientServiceFacility < ActiveRecord::Base
  self.table_name = 'patient_service_facilities'

   def self.retrieve_patient_service_facilities

    select("uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt,created_at")

  end

  def self.retrieve_single_patient_service_facilities(uid)
select("uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt,created_at").where(
    "uid = ?","#{uid}"
    )
  end


   def self.retrieve_patient_service_facilities_with_facilityUrl(facilityUrl)
select("uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt,created_at").where(
    "facilityUrl = ?","#{facilityUrl}"
    )
  end

    def self.retrieve_patient_service_facilities_with_patientID(patientID)


     phys_address = PatientServiceFacility.joins("LEFT JOIN patients on patients.uid = patient_service_facilities.patientID")
               .select("patient_service_facilities.uid,patientID,patient_service_facilities.facilityName,placeOfService,addressType,addressOne,organizationUrl,admitDate,phone,isLastFacilityStayedAt,lastFacilityStayed,patient_service_facilities.created_at")
               .where("patientID = ?","#{patientID}")
  end


 

  


  def self.retrieve_patient_service_facilities_with_org_url(organizationUrl)
  puts fac_obj = PatientServiceFacility.where(organizationUrl: organizationUrl).select("id,uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt,created_at")
    puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
     phys_address_arr = []
     fac_obj.each do |item| 
 
    phys_address_arr << {"id": item.id,"organization_details": org_obj,"uid": item.uid,"admitDate": item.admitDate ,"dischargeDate": item.dischargeDate,"comment": item.comment, "patientID": item.patientID,"facilityUrl": item.facilityUrl, "placeOfService": item.placeOfService, "startDate": item.startDate, "endDate": item.endDate,"isLastFacilityStayedAt": item.isLastFacilityStayedAt,"organizationUrl": item.organizationUrl}
    end
    return phys_address_arr 
  end
end



class ArLookupInvoiceNoteType < ActiveRecord::Base
  self.table_name = 'ar_lookup_invoice_note_type'

   def self.retrieve_all_lookup_invoice_note_type
    select("id,organizationUrl,description,code,groupCode,generateWorkflow,followupDays,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_lookup_invoice_note_type(id)
select("id,organizationUrl,description,code,groupCode,generateWorkflow,followupDays,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


     def self.retrieve_lookup_invoice_note_type_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,generateWorkflow,followupDays,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end



  class PhysicianOrdersSuggestedText < ActiveRecord::Base
  self.table_name = 'physician_orders_suggested_text'

   def self.retrieve_all_physician_orders_suggested_text
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_physician_orders_suggested_text(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_physician_orders_suggested_text_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end




  class PhysicianOrdersQuickPickTypes < ActiveRecord::Base
  self.table_name = 'physician_orders_quick_pick_types'

   def self.retrieve_all_physician_orders_quick_pick_types
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_physician_orders_quick_pick_types(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_physician_orders_quick_pick_types_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end



   class OasisVoidReasonType < ActiveRecord::Base
  self.table_name = 'oasis_void_reason_type'

   def self.retrieve_all_oasis_void_reason_type
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_oasis_void_reason_type(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end




    def self.retrieve_oasis_void_reason_type_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end






   class CareNeedTaskActionResponse < ActiveRecord::Base
  self.table_name = 'care_need_task_action_response'

   def self.retrieve_all_care_need_task_action_response
    select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_care_need_task_action_response(id)
select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end



    def self.retrieve_care_need_task_action_response_with_organizationUrl(organizationUrl)
select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end



  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end



    class Vaccines < ActiveRecord::Base
  self.table_name = 'vaccines'

   def self.retrieve_all_vaccines
    select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_vaccines(id)
select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_vaccines_with_organizationUrl(organizationUrl)
select("id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end


    class GoalStatusTypes < ActiveRecord::Base
  self.table_name = 'goal_status_types'

   def self.retrieve_all_goal_status_types
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_goal_status_types(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end

    def self.retrieve_goal_status_types_with_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end





    class CareNeedLevels < ActiveRecord::Base
  self.table_name = 'care_need_levels'

   def self.retrieve_all_care_need_levels
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_care_need_levels(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_care_need_levels_with_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end


  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end




class MedicationAdministeredByType < ActiveRecord::Base
  self.table_name = 'medication_administered_by_type'

   def self.retrieve_all_medication_administered_by_type
    select("id,organizationUrl,description,code,
    startDate,endDate,created_at")
  end


    def self.retrieve_medication_administered_by_type(id)
select("id,organizationUrl,description,code,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end

     def self.retrieve_medication_administered_by_type_with_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
end



  end



  class VitalType < ActiveRecord::Base
  self.table_name = 'vital_type'

   def self.retrieve_all_vital_type
    select("id,organizationUrl,vitalDescription,lowValue,highValue,matchingCode,
    startDate,endDate,created_at")
  end


    def self.retrieve_vital_type(id)
select("id,organizationUrl,vitalDescription,lowValue,highValue,matchingCode,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


  def self.retrieve_vital_type_with_organizationUrl(organizationUrl)
select("id,organizationUrl,vitalDescription,lowValue,highValue,matchingCode,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  # def self.retrieve_discipline_types_with_organizationUrl(organizationUrl)
  # puts fac_obj = AssLookupDisciplineTypes.where(organizationUrl: organizationUrl).select("id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
  #   allowConnectionToPhysician,assessmentGroup,payCode,created_at")
  #   puts  org_obj = Organization.where(url: organizationUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
    
     
     
  #    phys_address_arr = []
  #    fac_obj.each do |item| 
 
  #   phys_address_arr << {"id": item.id,"organization_details": org_obj,"disciplineCode": item.disciplineCode, "description": item.description,"serviceCategoryCode": item.serviceCategoryCode,"orderDisciplineCode": item.orderDisciplineCode, "sortOrder": item.sortOrder, "endDate": item.endDate, "startDate": item.startDate, "organizationUrl": item.organizationUrl,
  #    "allowConnectionToPhysician": item.allowConnectionToPhysician, "assessmentGroup": item.assessmentGroup, "payCode": item.payCode, "created_at": item.created_at}
  #   end
  #   return phys_address_arr 
  # end
  end



    class WoundArea < ActiveRecord::Base
  self.table_name = 'wound_area'

   def self.retrieve_all_wound_area
    select("id,organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_wound_area(id)
select("id,organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_wound_area_with_organizationUrl(organizationUrl)
select("id,organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



    class ReferralSourceNotes < ActiveRecord::Base
  self.table_name = 'referral_source_notes'

   def self.retrieve_referral_source_notes
    select("id,referralSourceUid,date,noteBy,noteType,document,note,active,updatedBy,created_at")
  end


    def self.retrieve_single_referral_source_notes(id)
select("id,referralSourceUid,date,noteBy,noteType,document,note,active,updatedBy,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_single_referral_source_notes_referralSourceUid(referralSourceUid)
select("id,referralSourceUid,date,noteBy,noteType,document,note,active,updatedBy,created_at").where(
    "referralSourceUid = ?","#{referralSourceUid}"
    )
  end

  end




    class ReferralSourceAncillaryPhone < ActiveRecord::Base
  self.table_name = 'referral_source_ancillary_phone'

   def self.retrieve_referral_source_ancillary_phone
    select("id,referralSourceUid,phoneType,phone,description,created_at")
  end


    def self.retrieve_single_referral_source_ancillary_phone(id)
select("id,referralSourceUid,phoneType,phone,description,created_at").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_referral_source_ancillary_phone_with_referralSourceUid(referralSourceUid)
select("id,referralSourceUid,phoneType,phone,description,created_at").where(
    "referralSourceUid = ?","#{referralSourceUid}"
    )
  end

  end




       class ArLookupAgencyPaymentTypes < ActiveRecord::Base
  self.table_name = 'ar_lookup_agency_payment_types'

   def self.retrieve_all_arlookup_agency_payment_types
    select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_arlookup_agency_payment_type(id)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_arlookup_agency_payment_type_organizationUrl(organizationUrl)
select("id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end
end





  class ArAdjustmentReasonType < ActiveRecord::Base
  self.table_name = 'ar_adjustment_reason_type'

   def self.retrieve_all_ar_adjustment_reason_type
    select("id,organizationUrl,code,description,arSubcategory,allowForGross,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_ar_adjustment_reason_type(id)
select("id,organizationUrl,code,description,arSubcategory,allowForGross,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}" 
    )
  end


     def self.retrieve_ar_adjustment_reason_type_organizationUrl(organizationUrl)
select("id,organizationUrl,code,description,arSubcategory,allowForGross,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}" 
    )
  end
  
  end




    class AssessmentVoidReasonType < ActiveRecord::Base
  self.table_name = 'assessment_void_reason_type'

   def self.retrieve_all_assessment_void_reason_type
    select("id,organizationUrl,code,description,followupDays,generateWorkflow,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_assessment_void_reason_type(id)
select("id,organizationUrl,code,description,followupDays,generateWorkflow,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_assessment_void_reason_type_with_organizationUrl(organizationUrl)
select("id,organizationUrl,code,description,followupDays,generateWorkflow,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end





    class CareNeeds < ActiveRecord::Base
  self.table_name = 'care_needs'

   def self.retrieve_all_care_needs
    select("id,organizationUrl,restrictToAgencyType,description,groupCode,sortOrder,
    startDate,endDate,created_at")
  end


    def self.retrieve_care_needs(id)
select("id,organizationUrl,restrictToAgencyType,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


      def self.retrieve_care_needs_organizationUrl(organizationUrl)
select("id,organizationUrl,restrictToAgencyType,description,groupCode,sortOrder,
    startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



    class CarePlanPrognosis < ActiveRecord::Base
  self.table_name = 'care_plan_prognosis'

   def self.retrieve_all_care_plan_prognosis
    select("id,organizationUrl,code,description,useOnCarePlan,sortOrder,created_at")
  end


    def self.retrieve_care_plan_prognosis(id)
select("id,organizationUrl,code,description,useOnCarePlan,sortOrder,created_at").where(
    "id = ?","#{id}"
    )
  end


     def self.retrieve_care_plan_prognosis_with_organizationUrl(organizationUrl)
select("id,organizationUrl,code,description,useOnCarePlan,sortOrder,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



     class CaseCommunicationDescriptions < ActiveRecord::Base
  self.table_name = 'case_communication_descriptions'

   def self.retrieve_all_case_communication_descriptions
    select("id,organizationUrl,prefix,description,suffix,startDate,endDate,created_at")
  end


    def self.retrieve_case_communication_descriptions(id)
select("id,organizationUrl,prefix,description,suffix,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_case_communication_descriptions_with_organizationUrl(organizationUrl)
select("id,organizationUrl,prefix,description,suffix,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end





     class Goals < ActiveRecord::Base
  self.table_name = 'goals'

   def self.retrieve_all_goals
    select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at")
  end


    def self.retrieve_goals(id)
select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at").where(
    "id = ?","#{id}"
    )
  end



    def self.retrieve_goals_with_organizationUrl(organizationUrl)
select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



     class Interventions < ActiveRecord::Base
  self.table_name = 'interventions'

   def self.retrieve_all_interventions
    select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at")
  end


    def self.retrieve_interventions(id)
select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_interventions_with_organizationUrl(organizationUrl)
select("id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end


       class QuickPickMedications < ActiveRecord::Base
  self.table_name = 'physician_orders_quick_pick_medications'

   def self.retrieve_all_quick_pick_medications
    select("id,organizationUrl,medicationName,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,created_at")
  end


    def self.retrieve_quick_pick_medications(id)
select("id,organizationUrl,medicationName,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )
  end

     def self.retrieve_quick_pick_medications_organizationUrl(organizationUrl)
select("id,organizationUrl,medicationName,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end


        class MedicationKits < ActiveRecord::Base
  self.table_name = 'medication_kits'

   def self.retrieve_all_medication_kits
    select("id,organizationUrl,medicationKit,description,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,medType,created_at")
  end


    def self.retrieve_medication_kits(id)
select("id,organizationUrl,medicationKit,description,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,medType,created_at").where(
    "id = ?","#{id}"
    )
  end



      def self.retrieve_medication_kits_organizationUrl(organizationUrl)
select("id,organizationUrl,medicationKit,description,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,medType,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end



  class SupervisoryDueDay < ActiveRecord::Base
  self.table_name = 'supervisory_due_day'

   def self.retrieve_all_supervisory_due_day
    select("id,organizationUrl,agencyUrl,payerUrl,agencyType,serviceCategory,code,supervisoryDueDays,autoGenerate,service,created_at")
  end


    def self.retrieve_supervisory_due_day(id)
select("id,organizationUrl,agencyUrl,payerUrl,agencyType,serviceCategory,code,supervisoryDueDays,autoGenerate,service,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_supervisory_due_day_with_organizationUrl(organizationUrl)
select("id,organizationUrl,agencyUrl,payerUrl,agencyType,serviceCategory,code,supervisoryDueDays,autoGenerate,service,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

  end


    class PatientCertifications < ActiveRecord::Base
  self.table_name = 'patient_certifications'

   def self.retrieve_all_patient_certifications
    select("id,patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,service_status,created_at")
  end


    def self.retrieve_patient_certification(id)
select("id,patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,created_at,service_status").where(
    "id = ?","#{id}"
    )
  end

      def self.retrieve_patient_certification_with_patientUid(patientUid)
select("id,patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,created_at,service_status").where(
    "patientUid = ?","#{patientUid}"
    )
  end



    def self.retrieve_patient_certification_with_id(id)

  patientDisaster_obj = select("id,patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,created_at,service_status").where(
    "id = ?","#{id}"
    )

          
    phys_address_arr = []
     
    patientDisaster_obj.each do |item| 

      patientPayer_obj = PatientPayer.where(id: item.id).select("id,url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber,created_at,relationship")


     phys_address_arr << {"id": item.id,"patientUid": item.patientUid, "certFrom": item.certFrom,
      "spanDays": item.spanDays,"certTo": item.certTo,"certType": item.certType,"status": item.status,"info": item.info,"associate": item.associate,"sent": item.sent,"received": item.received,"ftfSent": item.ftfSent,"ftfVisit": item.ftfVisit,"patientPayer": item.patientPayer, "created_at": item.created_at,"patientPayer_details": patientPayer_obj}
   
    end
    
    return phys_address_arr 

  end



  end



  class ReferralSourceAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'referralSourceAddressPhoneInfo'

   def self.retrieve_referralSourceAddressPhoneInfo

    select("id,referralSourceUid,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")
  end

  def self.retrieve_single_referralSourceAddressPhoneInfo(referralSourceUid)

    select("id,referralSourceUid,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones").where(
    "referralSourceUid = ?","#{referralSourceUid}"
    )

    #  puts  anPhIn_obj = AddressPhoneInfo.where(associateUrl: associateUrl).select("id,associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones")
    #     puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
    #  phys_address_arr = []
    #  anPhIn_obj.each do |item| 

    
    # phys_address_arr << {"id": item.id, "associate_details": associate_obj,"addressType": item.addressType, "address1": item.address1,"address2": item.address2,"city": item.city, "state": item.state, "zip": item.zip, "addressPhoneInfoPhones": item.addressPhoneInfoPhones}
    # end
    # return phys_address_arr 
  end
end




class PatientForm < ActiveRecord::Base
  self.table_name = 'patient_forms'

   def self.retrieve_patient_forms
    select("uid,patientID,formType,agency,status,revisedBy,performedBy,payload,organizationUrl,formName,agencySignature,patientSignature,signedBy,created_at")
  end


    def self.retrieve_single_patient_forms(uid)
 select("uid,patientID,formType,agency,status,revisedBy,performedBy,payload,organizationUrl,formName,agencySignature,patientSignature,signedBy,created_at").where(
    "uid = ?","#{uid}"
    )
  end

     def self.retrieve_single_patient_forms_with_patient(patientID)
 select("uid,patientID,formType,agency,status,revisedBy,performedBy,payload,organizationUrl,formName,agencySignature,patientSignature,signedBy,created_at").where(
    "patientID = ?","#{patientID}"
    )
  end

  end



  class PatientDocument < ActiveRecord::Base
  self.table_name = 'patient_documents'

   def self.retrieve_patient_documents
    select("uid,patientID,file,relatedTo,status,documentType,description,uploadedBy,organizationUrl,created_at")
  end


    def self.retrieve_single_patient_documents(uid)
select("uid,patientID,file,relatedTo,status,documentType,description,uploadedBy,organizationUrl,created_at").where(
    "uid = ?","#{uid}"
    )
  end

      def self.retrieve_patient_documents_with_PatientID(patientID)
select("uid,patientID,file,relatedTo,status,documentType,description,uploadedBy,organizationUrl,created_at").where(
    "patientID = ?","#{patientID}"
    )
  end

  end




    class PatientMedication < ActiveRecord::Base
  self.table_name = 'patient_medications'

   def self.retrieve_patient_medications
    select("uid,entryType,description,dosage,dosageAndFrequency,route,quantity,
    startDate,endDate,medicationType,prescribedBy,administeredBy,reasonForMedication,pharmacy,physicianNotified,approvedBy,
    createInterimCare,effectiveDate,patientID,organizationUrl,created_at,idx")
  end


    def self.retrieve_single_patient_medications(uid)
select("uid,entryType,description,dosage,dosageAndFrequency,route,quantity,
    startDate,endDate,medicationType,prescribedBy,administeredBy,reasonForMedication,pharmacy,physicianNotified,approvedBy,
    createInterimCare,effectiveDate,patientID,organizationUrl,created_at,idx").where(
    "uid = ?","#{uid}"
    )
  end


    def self.retrieve_single_patient_medications_with_patientID(patientID)
select("uid,entryType,description,dosage,dosageAndFrequency,route,quantity,
    startDate,endDate,medicationType,prescribedBy,administeredBy,reasonForMedication,pharmacy,physicianNotified,approvedBy,
    createInterimCare,effectiveDate,patientID,organizationUrl,created_at,idx").where(
    "patientID = ?","#{patientID}"
    )
  end

  end





    class PatientPayer < ActiveRecord::Base
  self.table_name = 'patient_payers'

   def self.retrieve_patient_payers

    select("id,url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber,created_at,relationship")
  end

  def self.retrieve_single_patient_payers(patientUid)

   patientPayer_obj = PatientPayer.where(patientUid: patientUid).select("id,url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber,created_at,relationship")


   phys_address_arr = []
  patientPayer_obj.each do |item| 

    puts  payer = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,status,url,created_at")
    
          
    phys_address_arr << {"id": item.id,"url": item.url, "payerUrl": item.payerUrl, "payer_details": payer, "patientUid": item.patientUid,"sequence": item.sequence,"startDate": item.startDate,
      "endDate": item.endDate,"billToAddress": item.billToAddress,"contact": item.contact,"idNumber": item.idNumber,"accidentRelatedCause": item.accidentRelatedCause,"dischargeReason": item.dischargeReason,"dischargeDate": item.dischargeDate,
      "holdBillingDateAfter": item.holdBillingDateAfter,"groupName": item.groupName,"groupNumber": item.groupNumber,"created_at": item.created_at,"relationship": item.relationship
    }
    end
    return phys_address_arr 

  end

  def self.retrieve_single_patient_payers_payerUrl(url)
    
    patientPayer_obj = select("id,url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber,created_at,relationship").where(
    "url = ?","#{url}"
    )

          
     phys_address_arr = []
     
     patientPayer_obj.each do |item| 

      payer = Payer.where(url: item.payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,status,url,created_at")
    

    patient_details = Patient.where(uid: item.patientUid).select("uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,characteristics,county,
    lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives")

    billToAddress_details = PayerContactInfo.where(id: item.billToAddress).select("payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,billTo,attention,description")

    contact_details = PayerContacts.where(id: item.contact).select("payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones")

     phys_address_arr << {"url": item.url,"payerUrl": item.payerUrl,"payer_details": payer,"patientUid": item.patientUid, "patient_details": patient_details,"sequence": item.sequence,"startDate": item.startDate,"endDate": item.endDate,"billToAddress": item.billToAddress,"billToAddress_details": billToAddress_details,"contact": item.contact, "contact_details": contact_details,
    "idNumber": item.idNumber,"groupName": item.groupName,"groupNumber": item.groupNumber,"accidentRelatedCause": item.accidentRelatedCause,"dischargeReason": item.dischargeReason,"dischargeDate": item.dischargeDate,"holdBillingDateAfter": item.holdBillingDateAfter,"created_at": item.created_at,"relationship": item.relationship}
   
    end
    
    return phys_address_arr 
  end
end






    class GeneralSupportTimeRange < ActiveRecord::Base
  self.table_name = 'general_support_time_range'

   def self.retrieve_general_support_time_range

    select("id,organizationUrl,category,time_from,time_to,startDate,endDate,sort,created_at")
  end

  def self.retrieve_single_general_support_time_range(id)

   select("id,organizationUrl,category,time_from,time_to,startDate,endDate,sort,created_at").where(
    "id = ?","#{id}"
    )

 
  end


   def self.retrieve_single_general_support_time_range_with_organizationUrl(organizationUrl)

   select("id,organizationUrl,category,time_from,time_to,startDate,endDate,sort,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

 
  end
end


    class GeneralSupportTeams < ActiveRecord::Base
  self.table_name = 'general_support_teams'

   def self.retrieve_general_support_teams

    select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at")
  end

  def self.retrieve_single_general_support_teams(id)

   select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

 
  end

   def self.retrieve_single_general_support_teams_with_organizationUrl(organizationUrl)

   select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

 
  end
end



  class PatientDisasterPlan < ActiveRecord::Base
  self.table_name = 'patient_disaster_plans'

   def self.retrieve_patient_disaster_plan

    select("uid,patientID,plan,details,organizationUrl,planID,created_at")
  end

  def self.retrieve_single_patient_disaster_plan(uid)

  patientDisaster_obj = select("uid,patientID,plan,details,organizationUrl,planID,created_at").where(
    "uid = ?","#{uid}"
    )

          
    phys_address_arr = []
     
    patientDisaster_obj.each do |item| 

    patient_details = Patient.where(uid: item.patientUid).select("uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,characteristics,county,
    lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives")


     phys_address_arr << {"patient_data": patient_details,"uid": item.uid,"patientID": item.patientID, "plan": item.plan,
      "details": item.details,"organizationUrl": item.organizationUrl,"planID": item.planID, "created_at": item.created_at}
   
    end
    
    return phys_address_arr 

  end


  def self.retrieve_single_patient_disaster_plan_with_patientID(patientID)


   patientDisaster_obj = select("uid,patientID,plan,details,organizationUrl,planID,created_at").where(
    "patientID = ?","#{patientID}"
    )

          
    phys_address_arr = []
     
    patientDisaster_obj.each do |item| 

    patient_details = Patient.where(uid: item.patientID).select("uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,characteristics,county,
    lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives")


     phys_address_arr << {"patient_data": patient_details,"uid": item.uid,"patientID": item.patientID, "plan": item.plan,
      "details": item.details,"organizationUrl": item.organizationUrl,"planID": item.planID, "created_at": item.created_at}
   
    end
    
    return phys_address_arr 

  end


  def self.retrieve_single_patient_disaster_plan_with_organizationUrl(organizationUrl)


   patientDisaster_obj = select("uid,patientID,plan,details,organizationUrl,planID,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )



  end

end



  class PatientMessage < ActiveRecord::Base
  self.table_name = 'patient_messages'

   def self.retrieve_patient_messages

    select("id,agency,team,discipline,associate,message_to,message_from,message,createdDate,sentDate,patientID,uid,created_at,associates,status")
  end

  def self.retrieve_single_patient_messages(id)


   patientDisaster_obj = select("id,agency,team,discipline,associate,message_to,message_from,message,createdDate,sentDate,patientID,uid,created_at,associates,status").where(
    "id = ?","#{id}"
    )

  end

  def self.retrieve_single_patient_messages_with_patientID(patientID)


   patientDisaster_obj = select("id,agency,team,discipline,associate,message_to,message_from,message,createdDate,sentDate,patientID,uid,created_at,associates,status").where(
    "patientID = ?","#{patientID}"
    )

  end

  

  end



   class PatientService < ActiveRecord::Base
  self.table_name = 'patient_services'

   def self.retrieve_patient_services

    select("uid,patientID,serviceID,serviceNoteType,assessmentType,status,createdBy,revisedBy,serviceProvidedBy,
    timeIn,timeOut,qaStatus,serviceCode,created_at")
  end

  def self.retrieve_single_patient_services(uid)


   patientDisaster_obj = select("uid,patientID,serviceID,serviceNoteType,assessmentType,status,createdBy,revisedBy,serviceProvidedBy,
    timeIn,timeOut,qaStatus,serviceCode,created_at").where(
    "uid = ?","#{uid}"
    )



  end

  end


     class PatientProgram < ActiveRecord::Base
  self.table_name = 'patient_programs'

   def self.retrieve_patient_programs

    select("uid,patientID,programeID,createdAt,created_at,startDate,endDate")
  end

  def self.retrieve_single_patient_programs(uid)


   patientDisaster_obj = select("uid,patientID,programeID,createdAt,created_at,startDate,endDate").where(
    "uid = ?","#{uid}"
    )

  end


   def self.retrieve_single_patient_programs_w_patientID(patientID)


   patientDisaster_obj = select("uid,patientID,programeID,createdAt,created_at,startDate,endDate").where(
    "patientID = ?","#{patientID}"
    )

  end

  end





     class PatientClinicalTeam < ActiveRecord::Base
  self.table_name = 'patient_clinical_team'

   def self.retrieve_patient_clinical_team

    select("uid,patientID,associateUrl,createdAt,clinicalManagerUrl,isPrimaryForDiscipline,created_at,members")
  end

  def self.retrieve_single_patient_clinical_team(uid)


   patientDisaster_obj = select("uid,patientID,associateUrl,createdAt,clinicalManagerUrl,isPrimaryForDiscipline,created_at,members").where(
    "uid = ?","#{uid}"
    )

  end

  def self.retrieve_single_patient_clinical_team_with_patientID(patientID)


   patientDisaster_obj = select("uid,patientID,associateUrl,createdAt,clinicalManagerUrl,isPrimaryForDiscipline,created_at,members").where(
    "patientID = ?","#{patientID}"
    )


    phys_address_arr = []
    team_members_arr = []
     patientDisaster_obj.each do |item| 

      team_members = JSON.parse(item.members)
     
      puts "team_members <><><><<><> #{team_members} <><><><"

      team_members.each do |mem| 

         puts "EACH MEMBER <><><><<><> #{mem} <><><><"

   

     physic_obj = Associate.where(url: mem).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")

     team_members_arr << physic_obj

       end

         puts "all team_members_arr <><><><<><> #{team_members_arr} <><><><"
  
     
    phys_address_arr << {"id": item.id,"uid": item.uid, "team_members": team_members_arr,"patientID": item.patientID,"associateUrl": item.associateUrl,"clinicalManagerUrl": item.clinicalManagerUrl,"isPrimaryForDiscipline": item.isPrimaryForDiscipline,"createdAt": item.createdAt,
      "members": item.members,"associateUrl": item.associateUrl,
      "createdAt": item.createdAt,"created_at": item.created_at}
    end

    return phys_address_arr 

  end

  end



    class PatientClinicalManager < ActiveRecord::Base
  self.table_name = 'patient_clinical_manager'

   def self.retrieve_patient_clinical_manager

    select("uid,patientID,caseManagerUrl,createdAt,clinicalManagerUrl,created_at")
  end

  def self.retrieve_single_patient_clinical_manager(uid)


   patientDisaster_obj = select("uid,patientID,caseManagerUrl,createdAt,clinicalManagerUrl,created_at").where(
    "uid = ?","#{uid}"
    )

  end



    def self.retrieve_single_patient_clinical_manager_by_patientID(patientID)


   patientDisaster_obj = select("uid,patientID,caseManagerUrl,createdAt,clinicalManagerUrl,created_at").where(
    "patientID = ?","#{patientID}"
    )
    end




  #  phys_address_arr = []
  #   patientDisaster_obj.each do |item| 

  #      puts  casManager = Associate.where(url: item.caseManagerUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
      
  #      casManager.each do |cas| 

  #          phys_address_arr << {"id": item.id, "caseManagerName": cas.firstName +  cas.lastName, "facility_data": fac_obj,"patientID": item.patientID,"newStatus": item.newStatus,"priorStatus": item.priorStatus,"holdStart": item.holdStart,"holdEnd": item.holdEnd,"facilityID": item.facilityID,"associateUrl": item.associateUrl,"holdReason": item.holdReason,
  #     "createdAt": item.createdAt,"created_at": item.created_at}
  #      end


  #      puts fac_obj = Facility.where(url: item.facilityID).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
  
  #   # phys_address_arr << {"id": item.id, "caseManagerName": casManager, "facility_data": fac_obj,"patientID": item.patientID,"newStatus": item.newStatus,"priorStatus": item.priorStatus,"holdStart": item.holdStart,"holdEnd": item.holdEnd,"facilityID": item.facilityID,"associateUrl": item.associateUrl,"holdReason": item.holdReason,
  #   #   "createdAt": item.createdAt,"created_at": item.created_at}
  #   end
  #   return phys_address_arr 



  # end

  end



    class PatientStatusHistory < ActiveRecord::Base
  self.table_name = 'patient_status_history'

   def self.retrieve_patient_status_history

    # select("id,patientID,priorStatus,newStatus,holdStart,holdEnd,
    # facilityID,associateUrl,holdReason,createdAt,created_at")


      patientDisaster_obj = select("id,patientID,priorStatus,newStatus,holdStart,holdEnd,
    facilityID,associateUrl,holdReason,createdAt,created_at")

    
   
   phys_address_arr = []
     patientDisaster_obj.each do |item| 

       puts  physic_obj = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
       puts fac_obj = Facility.where(url: item.facilityID).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
  
    phys_address_arr << {"id": item.id, "associate_data": physic_obj, "facility_data": fac_obj,"patientID": item.patientID,"newStatus": item.newStatus,"priorStatus": item.priorStatus,"holdStart": item.holdStart,"holdEnd": item.holdEnd,"facilityID": item.facilityID,"associateUrl": item.associateUrl,"holdReason": item.holdReason,
      "createdAt": item.createdAt,"created_at": item.created_at}
    end
    return phys_address_arr 
  end

  def self.retrieve_single_patient_status_history(id)


   patientDisaster_obj = select("id,patientID,priorStatus,newStatus,holdStart,holdEnd,
    facilityID,associateUrl,holdReason,createdAt,created_at").where(
    "id = ?","#{id}"
    )

    
   
   phys_address_arr = []
     patientDisaster_obj.each do |item| 

       puts  physic_obj = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
       puts fac_obj = Facility.where(url: item.facilityID).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
  
    phys_address_arr << {"id": item.id, "associate_data": physic_obj, "facility_data": fac_obj,"patientID": item.patientID,"newStatus": item.newStatus,"priorStatus": item.priorStatus,"holdStart": item.holdStart,"holdEnd": item.holdEnd,"facilityID": item.facilityID,"associateUrl": item.associateUrl,"holdReason": item.holdReason,
      "createdAt": item.createdAt,"created_at": item.created_at}
    end
    return phys_address_arr 





  end

  def self.retrieve_single_patient_status_history_with_patient_id(patientID)
     patientDisaster_obj = select("id,patientID,priorStatus,newStatus,holdStart,holdEnd,
    facilityID,associateUrl,holdReason,createdAt,created_at").where(
    "patientID = ?","#{patientID}"
    )

    
   
   phys_address_arr = []
     patientDisaster_obj.each do |item| 

       puts  physic_obj = Associate.where(url: item.associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,image,url,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
       puts fac_obj = Facility.where(url: item.facilityID).select("id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone")
   
    phys_address_arr << {"id": item.id, "associate_data": physic_obj, "facility_data": fac_obj,"patientID": item.patientID,"newStatus": item.newStatus,"priorStatus": item.priorStatus,"holdStart": item.holdStart,"holdEnd": item.holdEnd,"facilityID": item.facilityID,"associateUrl": item.associateUrl,"holdReason": item.holdReason,
      "createdAt": item.createdAt,"created_at": item.created_at}
    end
    return phys_address_arr 





  end


  end




    class SupportTableSkills < ActiveRecord::Base
  self.table_name = 'general_support_table_skills'

   def self.retrieve_support_table_skills

    select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at")
  end

  def self.retrieve_single_support_table_skills(id)

   patientDisaster_obj = select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end

   def self.retrieve_single_support_table_skills_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,organizationUrl,description,groupCode,sortOrder,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end





    class SupportServiceCodes < ActiveRecord::Base
  self.table_name = 'general_support_service_codes'

   def self.retrieve_support_service_codes

    select("id,organizationUrl,longDescription,serviceCode,shortDescription,serviceType,serviceCategory,
    unitOfMeasure,billable,assessment,payable,timeRequired,supervisoryAssessment,startDate,endDate,telehealth,
    revenueCode,hcpcCode,modifier,earningsCode,useForTimeClock,useForPayrollTimeOnly,useAssociateDiscipline,additionalCode,formType,created_at")
  end

  def self.retrieve_single_support_service_codes(id)

   patientDisaster_obj = select("id,organizationUrl,longDescription,serviceCode,shortDescription,serviceType,serviceCategory,
    unitOfMeasure,billable,assessment,payable,timeRequired,supervisoryAssessment,startDate,endDate,telehealth,
    revenueCode,hcpcCode,modifier,earningsCode,useForTimeClock,useForPayrollTimeOnly,useAssociateDiscipline,additionalCode,formType,created_at").where(
    "id = ?","#{id}"
    )

  end


  def self.retrieve_single_support_service_codes_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,organizationUrl,longDescription,serviceCode,shortDescription,serviceType,serviceCategory,
    unitOfMeasure,billable,assessment,payable,timeRequired,supervisoryAssessment,startDate,endDate,telehealth,
    revenueCode,hcpcCode,modifier,earningsCode,useForTimeClock,useForPayrollTimeOnly,useAssociateDiscipline,additionalCode,formType,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end






    class SupportRelationshipType < ActiveRecord::Base
  self.table_name = 'general_support_relationship_type'

   def self.retrieve_support_relationship_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_support_relationship_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end


  def self.retrieve_single_support_relationship_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



      class SupportLetters < ActiveRecord::Base
  self.table_name = 'general_support_letters_labels'

   def self.retrieve_support_letters_labels

    select("id,organizationUrl,description,generateLabels,groupCode,sortOrder,startDate,endDate,created_at")
  end

  def self.retrieve_single_support_letters_labels(id)

   patientDisaster_obj = select("id,organizationUrl,description,generateLabels,groupCode,sortOrder,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end


  def self.retrieve_single_support_letters_labels_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,organizationUrl,description,generateLabels,groupCode,sortOrder,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




      class SupportSalesTax < ActiveRecord::Base
  self.table_name = 'general_support_sales_tax'

   def self.retrieve_support_sales_tax

    select("id,organizationUrl,salesTax,state,rate,department,startDate,endDate,created_at")
  end

  def self.retrieve_single_support_sales_tax(id)

   patientDisaster_obj = select("id,organizationUrl,salesTax,state,rate,department,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end


   def self.retrieve_single_support_sales_tax_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,organizationUrl,salesTax,state,rate,department,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



  class SupportCodeMapping < ActiveRecord::Base
  self.table_name = 'general_support_service_code_mapping'

   def self.retrieve_support_service_code_mapping

    select("id,organizationUrl,ordersDiscipline,agencyType,payer,initialService,routineService,
    rocAddAssessmentService,therapyUtilizationInitialVisit,therapyUtilization30thVisit,startDate,endDate,created_at")
  end

  def self.retrieve_single_support_service_code_mapping(id)

   patientDisaster_obj = select("id,organizationUrl,ordersDiscipline,agencyType,payer,initialService,routineService,
    rocAddAssessmentService,therapyUtilizationInitialVisit,therapyUtilization30thVisit,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end


    def self.retrieve_single_support_service_code_mapping_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,organizationUrl,ordersDiscipline,agencyType,payer,initialService,routineService,
    rocAddAssessmentService,therapyUtilizationInitialVisit,therapyUtilization30thVisit,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



   class SupportOrganizationNoteType < ActiveRecord::Base
  self.table_name = 'general_support_organization_note_type'

   def self.retrieve_support_organization_note_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_support_organization_note_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_support_organization_note_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




   class SupportAnnouncements < ActiveRecord::Base
  self.table_name = 'general_support_announcements'

   def self.retrieve_support_announcements

    select("id,title,announcement,organizationUrl,status,startDate,endDate,created_at")
  end

  def self.retrieve_single_support_announcements(id)

   patientDisaster_obj = select("id,title,announcement,organizationUrl,status,startDate,endDate,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_support_announcements_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,title,announcement,organizationUrl,status,startDate,endDate,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




  class SupportCharacteristicType < ActiveRecord::Base
  self.table_name = 'general_support_characteristic_type'

   def self.retrieve_support_characteristic_type

    select("id,groupCode,description,organizationUrl,sortOrder,associateAlso,associateOnly,schedulingMatch,created_at")
  end

  def self.retrieve_single_support_characteristic_type(id)

   patientDisaster_obj = select("id,groupCode,description,organizationUrl,sortOrder,associateAlso,associateOnly,schedulingMatch,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_support_characteristic_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,groupCode,description,organizationUrl,sortOrder,associateAlso,associateOnly,schedulingMatch,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



    class FaceToFace < ActiveRecord::Base
  self.table_name = 'face_to_face_referral'

   def self.retrieve_face_to_face

    select("id,visitDate,visitComment,physicianType,attestation,clinicalFindings,services,
    homeBoundReason,otherHomeBound,patientID,organizationUrl,physicianID,created_at")
  end

  def self.retrieve_single_face_to_face(id)

   patientDisaster_obj = select("id,visitDate,visitComment,physicianType,attestation,clinicalFindings,services,
    homeBoundReason,otherHomeBound,patientID,physicianID,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_face_to_face_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,visitDate,visitComment,physicianType,attestation,clinicalFindings,services,
    homeBoundReason,otherHomeBound,patientID,physicianID,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end


    def self.retrieve_single_face_to_face_with_patientID(patientID)

   patientDisaster_obj = select("id,visitDate,visitComment,physicianType,attestation,clinicalFindings,services,
    homeBoundReason,otherHomeBound,patientID,physicianID,organizationUrl,created_at").where(
    "patientID = ?","#{patientID}"
    )

  end

  end





class AdvanceDirectivesTypes < ActiveRecord::Base
  self.table_name = 'advance_directives_types'

   def self.retrieve_advance_directives_types

    select("id,code,description,groupCode,sortOrder,startDate,endDate,
    useForDnrDisplay,organizationUrl,created_at")
  end

  def self.retrieve_single_advance_directives_types(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,
    useForDnrDisplay,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_advance_directives_types_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,
    useForDnrDisplay,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end





class IncomingFaxQueues < ActiveRecord::Base
  self.table_name = 'incoming_fax_queues'

   def self.retrieve_incoming_fax_queues

    select("id,faxQueueDescription,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_incoming_fax_queues(id)

   patientDisaster_obj = select("id,faxQueueDescription,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_single_incoming_fax_queues_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,faxQueueDescription,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



class AgencyNoteType < ActiveRecord::Base
  self.table_name = 'agency_note_type'

   def self.retrieve_agency_note_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_agency_note_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_agency_note_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end
  


class ErrorDescription < ActiveRecord::Base
  self.table_name = 'error_description'

   def self.retrieve_error_description

    select("id,minMinutes,description,category,sortOrder,startDate,endDate,organizationUrl,maxRate,maxMiles,lastModifiedBy,created_at")
  end

  def self.retrieve_single_error_description(id)

   patientDisaster_obj = select("id,minMinutes,description,category,sortOrder,startDate,endDate,organizationUrl,maxRate,maxMiles,lastModifiedBy,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_error_description_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,minMinutes,description,category,sortOrder,startDate,endDate,organizationUrl,maxRate,maxMiles,lastModifiedBy,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



class DocumentType < ActiveRecord::Base
  self.table_name = 'document_type'

   def self.retrieve_document_type

    select("id,advanceDirective,description,patientNotice,sortOrder,organizationUrl,consent,groupCode,startDate,endDate,taskCode,created_at,module")
  end

  def self.retrieve_single_document_type(id)

   patientDisaster_obj = select("id,advanceDirective,description,patientNotice,sortOrder,organizationUrl,consent,groupCode,startDate,endDate,taskCode,created_at,module").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_document_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,advanceDirective,description,patientNotice,sortOrder,organizationUrl,consent,groupCode,startDate,endDate,taskCode,created_at,module").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




class AgencyBillingSettings < ActiveRecord::Base
  self.table_name = 'agency_billing_settings'

   def self.retrieve_agency_billing_settings

    select("id,agencyUrl,supplyMarkUpPercent,providerSignatureOnFile,acceptMedicareAssignment,assignmentOfBenefits,releaseOfInformation,patientSignatureSource,eobRequested,created_at")
  end

  def self.retrieve_single_agency_billing_settings(id)

   patientDisaster_obj = select("id,agencyUrl,supplyMarkUpPercent,providerSignatureOnFile,acceptMedicareAssignment,assignmentOfBenefits,releaseOfInformation,patientSignatureSource,eobRequested,created_at").where(
    "id = ?","#{id}"
    )

  end


  end


class AgencyProcessingSettings < ActiveRecord::Base
  self.table_name = 'agency_processing_settings'

   def self.retrieve_agency_processing_settings

    select("id,agencyUrl,payrollInterval,payrollType,payrollCutoff,payrollProcessingDate,payrollProcessingTime,dataCutoff,dataProcessingDate,dataProcessingTime,created_at")
  end

  def self.retrieve_single_agency_processing_settings(id)

   patientDisaster_obj = select("id,agencyUrl,payrollInterval,payrollType,payrollCutoff,payrollProcessingDate,payrollProcessingTime,dataCutoff,dataProcessingDate,dataProcessingTime,created_at").where(
    "id = ?","#{id}"
    )

  end


  end


  class AgencyNotes < ActiveRecord::Base
  self.table_name = 'agency_notes'

   def self.retrieve_agency_notes

    select("id,agencyUrl,date,noteBy,noteType,document,note,active,created_at")
  end

  def self.retrieve_single_agency_notes(id)

   patientDisaster_obj = select("id,agencyUrl,date,noteBy,noteType,document,note,active,created_at").where(
    "id = ?","#{id}"
    )

  end


  end



    class AgencyAncillaryPhone < ActiveRecord::Base
  self.table_name = 'agency_ancillary_phone'

   def self.retrieve_agency_ancillary_phone

    select("id,agencyUrl,phoneType,phone,description,created_at")
  end

  def self.retrieve_single_ancillary_phone(id)

   patientDisaster_obj = select("id,agencyUrl,phoneType,phone,description,created_at").where(
    "id = ?","#{id}"
    )

  end


  end



     class AgencyAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'agency_address_phone_info'

   def self.retrieve_agency_address_phone_info

    select("id,agencyUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at")
  end

  def self.retrieve_single_address_phone_info(id)

   patientDisaster_obj = select("id,agencyUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at").where(
    "id = ?","#{id}"
    )

  end


  end




     class RegionAncillaryPhone < ActiveRecord::Base
  self.table_name = 'region_ancillary_phone'

   def self.retrieve_region_ancillary_phone

    select("id,regionUrl,phoneType,phone,description,created_at")
  end

  def self.retrieve_single_region_ancillary_phone(id)

   patientDisaster_obj = select("id,regionUrl,phoneType,phone,description,created_at").where(
    "id = ?","#{id}"
    )

  end


  end


    class RegionAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'region_address_phone_info'

   def self.retrieve_region_address_phone_info

    select("id,regionUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at")
  end

  def self.retrieve_single_region_address_phone_info(id)

   patientDisaster_obj = select("id,regionUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at").where(
    "id = ?","#{id}"
    )

  end


  end


    class OrganizationSettings < ActiveRecord::Base
  self.table_name = 'organization_settings'

   def self.retrieve_organization_settings

    select("id,organizationUrl,settings,created_at")
  end

  def self.retrieve_single_organization_settings(id)

   patientDisaster_obj = select("id,organizationUrl,settings,created_at").where(
    "id = ?","#{id}"
    )

  end


  end




  class OrganizationNote < ActiveRecord::Base
  self.table_name = 'organization_notes'

   def self.retrieve_organization_notes

    select("id,organizationUrl,noteBy,document,note,active,date,noteType")
  end

   def self.retrieve_single_organization_notes(id)

    select("id,organizationUrl,noteBy,document,note,active,date,noteType").where(
    "id = ?","#{id}"
    )
  end

  # def self.retrieve_single_organization_notes(associateUrl)


  #    puts  anPhIn_obj = AssociateNote.where(associateUrl: associateUrl).select("id,associateUrl,noteBy,document,note,active,date,noteType")
  #   # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
  #   puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
  #    phys_address_arr = []
  #    anPhIn_obj.each do |item| 

    
  #   phys_address_arr << {"id": item.id, "associate_details": associate_obj,"noteBy": item.noteBy, "document": item.document,"note": item.note,"active": item.active, "date": item.date, "noteType": item.noteType}
  #   end
  #   return phys_address_arr 
  # end
end


    class OrganizationDocuments < ActiveRecord::Base
  self.table_name = 'organization_documents'

   def self.retrieve_organization_documents

    select("id,organizationUrl,file,attachTo,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at")
  end

  def self.retrieve_single_organization_documents(id)

   patientDisaster_obj = select("id,organizationUrl,file,attachTo,documentType,documentStatus,description,note,uploadedBy,uploadedDate,created_at").where(
    "id = ?","#{id}"
    )

  end


  end



class OrganizationPayrate < ActiveRecord::Base
  self.table_name = 'organization_payrates'

   def self.retrieve_organization_payrates

    select("id,organizationUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate")

  end

  def self.retrieve_single_organization_payrates(id)

    select("id,organizationUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate").where(
    "id = ?","#{id}"
    )
  end


  # def self.retrieve_single_payrate_with_ass_url(associateUrl)

  #   # select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate").where(
  #   # "associateUrl = ?","#{associateUrl}"
  #   # )

  #   puts  anPhIn_obj = Payrate.where(associateUrl: associateUrl).select("id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate")
  #   # puts  org_obj = Organization.where(url: item.orgUrl).select("id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate")
  #   puts associate_obj  = Associate.where(url: associateUrl).select("id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl")
  
     
  #    phys_address_arr = []
  #    anPhIn_obj.each do |item| 

    
  #   phys_address_arr << {"id": item.id, "associate_details": associate_obj,"payType": item.payType, "serviceDescription": item.serviceDescription,"weekdayRate": item.weekdayRate,"weekendRate": item.weekendRate, "allowOverride": item.allowOverride, "startDate": item.startDate}
  #   end
  #   return phys_address_arr 
  # end
end



class OrganizationAncillaryPhone < ActiveRecord::Base
  self.table_name = 'organization_ancillary_phone'

   def self.retrieve_organization_ancillary_phone

    select("id,organizationUrl,phoneType,phone,description")


  end



  def self.retrieve_single_organization_ancillary_phone(id)

 select("id,organizationUrl,phoneType,phone,description").where(
    "id = ?","#{id}")

   # puts  anPhIn_obj = OrganizationAncillaryPhone.where(id: id).select("id,organizationUrl,phoneType,phone,description")
    
   # puts  payer = Payer.where(url: payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
   #  claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

     
   #   phys_address_arr = []
   #   anPhIn_obj.each do |item| 

    
   #  phys_address_arr << {"id": item.id, "payer_details": payer,"phoneType": item.phoneType, "phone": item.phone,"description": item.description}
   #  end
   #  return phys_address_arr 
  end

 #  def self.retrieve_single_payer_ancillary_phone_payerUrl(payerUrl)

 #    # select("id,associateUrl,phoneType,phone,description").where(
 #    # "associateUrl = ?","#{associateUrl}"
 #    # )


 #    puts  anPhIn_obj = PayerAncillaryPhone.where(payerUrl: payerUrl).select("id,payerUrl,phoneType,phone,description")
    
 # puts  payer = Payer.where(url: payerUrl).select("id,organizationUrl,payerName,payerCategory,oasisCategory,
 #    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url,created_at")
    

     
 #     phys_address_arr = []
 #     anPhIn_obj.each do |item| 

    
 #    phys_address_arr << {"id": item.id, "payer_details": payer,"phoneType": item.phoneType, "phone": item.phone,"description": item.description}
 #    end
 #    return phys_address_arr 
 #  end
end





class OrganizationAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'organization_addressPhoneInfo'

   def self.retrieve_organization_addressPhoneInfo

    select("id,organizationUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,created_at,updated_at")
  end

  def self.retrieve_single_organization_addressPhoneInfo(id)

    select("id,organizationUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,created_at,updated_at").where(
    "id = ?","#{id}"
    )

  end
end





class AssociateForms < ActiveRecord::Base
  self.table_name = 'associate_forms'

   def self.retrieve_associate_forms

    select("id,associateUrl,performedBy,relatedBy,completed,formType,formData,created_at,updated_at")
  end

  def self.retrieve_single_associate_forms(id)

    select("id,associateUrl,performedBy,relatedBy,completed,formType,formData,created_at,updated_at").where(
    "id = ?","#{id}"
    )

  end
end


class PatientPayerAddressPhoneInfo < ActiveRecord::Base
  self.table_name = 'patient_payer_address_phone_info'

   def self.retrieve_patient_payer_address_phone_info

    select("id,patientPayerUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,billTo,description,attention,created_at,updated_at")
  end

  def self.retrieve_single_patient_payer_address_phone_info(id)

    select("id,patientPayerUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at,updated_at,billTo,description,attention").where(
    "id = ?","#{id}"
    )

 
  end



    def self.retrieve_single_patient_payer_address_phone_info_with_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,created_at,updated_at,billTo,description,attention").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )

 
  end
end






class PatientPayerPayrate < ActiveRecord::Base
  self.table_name = 'patient_payer_payrates'

   def self.retrieve_patient_payer_payrates

    select("id,patientPayerUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate,endDate")

  end

  def self.retrieve_single_patient_payer_payrates(id)

    select("id,patientPayerUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate,endDate").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_patient_payer_payrates_w_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate,endDate").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )
  end

end






####### PayerDocuments
class PatientPayerBillRates < ActiveRecord::Base
  self.table_name = 'patient_payer_bill_rates'

   def self.retrieve_patient_payer_bill_rate

    select("id,patientPayerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at")

  end

  def self.retrieve_single_patient_payer_bill_rate(id)

     select("id,patientPayerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at").where( "id = ?","#{id}")

end


 def self.retrieve_single_patient_payer_bill_rate_w_patientPayerUrl(patientPayerUrl)

     select("id,patientPayerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser,created_at").where( "patientPayerUrl = ?","#{patientPayerUrl}")

end
end




class PatientPayerNote < ActiveRecord::Base
  self.table_name = 'patientPayer_notes'

   def self.retrieve_patientPayer_notes

    select("id,patientPayerUrl,noteBy,noteType,document,note,active,date")
  end

  def self.retrieve_single_patientPayer_notes(id)

    select("id,patientPayerUrl,noteBy,noteType,document,note,active,date").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_single_patientPayer_notes_w_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,noteBy,noteType,document,note,active,date").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )
  end
end




class PatientPayeremployer < ActiveRecord::Base
  self.table_name = 'patientPayer_employer'

   def self.retrieve_patientPayer_employer

    select("id,patientPayerUrl,employerName,employerStatusType,retirementDate,patientID")
  end

  def self.retrieve_single_patientPayer_employer(id)

    select("id,patientPayerUrl,employerName,employerStatusType,retirementDate,patientID").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_single_patientPayer_employer_with_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,employerName,employerStatusType,retirementDate,patientID").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )
  end

end




class PatientPayerAuthorizations < ActiveRecord::Base
  self.table_name = 'patientPayer_authorizations'

   def self.retrieve_patientPayer_authorizations

    select("id,patientPayerUrl,serviceCategory,authorizationHash,startDate,endDate,
  authorizedBy,maxVisitsPerWeek,maxVisitsPerDay,maxHoursUnitsPerWeek,maxHoursUnitsPerDay,terminationDate,authHours")
  end

  def self.retrieve_single_patientPayer_authorizations(id)

    select("id,patientPayerUrl,serviceCategory,authorizationHash,startDate,endDate,
  authorizedBy,maxVisitsPerWeek,maxVisitsPerDay,maxHoursUnitsPerWeek,maxHoursUnitsPerDay,terminationDate,authHours").where(
    "id = ?","#{id}"
    )
  end

    def self.retrieve_single_patientPayer_authorizations_w_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,serviceCategory,authorizationHash,startDate,endDate,
  authorizedBy,maxVisitsPerWeek,maxVisitsPerDay,maxHoursUnitsPerWeek,maxHoursUnitsPerDay,terminationDate,authHours").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )
  end

end



class PatientPayerDocuments < ActiveRecord::Base
  self.table_name = 'patientPayer_documents'

   def self.retrieve_patientPayer_documents

    select("id,patientPayerUrl,file,attachTo,documentType,documentStatus,
  description,note,uploadedBy,uploadedDate")
  end

  def self.retrieve_single_patientPayer_documents(id)

    select("id,patientPayerUrl,file,attachTo,documentType,documentStatus,
  description,note,uploadedBy,uploadedDate").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_single_patientPayer_documents_w_patientPayerUrl(patientPayerUrl)

    select("id,patientPayerUrl,file,attachTo,documentType,documentStatus,
  description,note,uploadedBy,uploadedDate").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )
  end

end




class AdmissionSource < ActiveRecord::Base
  self.table_name = 'admission_source'

   def self.retrieve_admission_source

    select("id,organizationUrl,code,description,ediValue,groupCode,
  sortOrder,startDate,endDate")
  end

  def self.retrieve_single_admission_source(id)

    select("id,organizationUrl,code,description,ediValue,groupCode,
  sortOrder,startDate,endDate").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_admission_source_with_organizationUrl(organizationUrl)

    select("id,organizationUrl,code,description,ediValue,groupCode,
  sortOrder,startDate,endDate").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

end





class DisasterPlanTypes < ActiveRecord::Base
  self.table_name = 'disaster_plan_types'

   def self.retrieve_disaster_plan_types

    select("id,organizationUrl,restrictToAgencyType,description,groupCode,
  sortOrder,startDate,endDate")
  end

  def self.retrieve_single_disaster_plan_types(id)

    select("id,organizationUrl,restrictToAgencyType,description,groupCode,
  sortOrder,startDate,endDate").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_disaster_plan_types_with_organizationUrl(organizationUrl)

    select("id,organizationUrl,restrictToAgencyType,description,groupCode,
  sortOrder,startDate,endDate").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

end







class DischargeReasonTypes < ActiveRecord::Base
  self.table_name = 'discharge_reason_types'

   def self.retrieve_discharge_reason_types

    select("id,organizationUrl,code,description,discharge_status,
  sortOrder,startDate,endDate,revocation,applyCode52")
  end

  def self.retrieve_single_discharge_reason_types(id)

    select("id,organizationUrl,code,description,discharge_status,
  sortOrder,startDate,endDate,revocation,applyCode52").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_discharge_reason_types_with_organizationUrl(organizationUrl)

    select("id,organizationUrl,code,description,discharge_status,
  sortOrder,startDate,endDate,revocation,applyCode52").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

end





class DeclineReasonTypes < ActiveRecord::Base
  self.table_name = 'decline_reason_types'

   def self.retrieve_decline_reason_types

    select("id,organizationUrl,description,groupCode,
  sortOrder,startDate,endDate")
  end

  def self.retrieve_single_decline_reason_types(id)

    select("id,organizationUrl,description,groupCode,
  sortOrder,startDate,endDate").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_decline_reason_types_with_organizationUrl(organizationUrl)

    select("id,organizationUrl,description,groupCode,
  sortOrder,startDate,endDate").where(
    "organizationUrl = ?","#{organizationUrl}"
    )
  end

end



class TransactionNoteType < ActiveRecord::Base
  self.table_name = 'transaction_note_types'

   def self.retrieve_transaction_note_types

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_transaction_note_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_transaction_note_types_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



  
class ProgramTypes < ActiveRecord::Base
  self.table_name = 'program_types'

   def self.retrieve_program_types

    select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_program_types(id)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_program_types_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



  class PatientNoticeTypes < ActiveRecord::Base
  self.table_name = 'patient_notice_types'

   def self.retrieve_patient_notice_types

    select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_patient_notice_types(id)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_patient_notice_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




    class PatientContactTypes < ActiveRecord::Base
  self.table_name = 'patient_contact_types'

   def self.retrieve_patient_contact_types

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_patient_contact_types(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_patient_contact_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




class PayerNoteType < ActiveRecord::Base
  self.table_name = 'payer_note_types'

   def self.retrieve_payer_note_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_payer_note_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_payer_note_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



class DocumentStatusType < ActiveRecord::Base
  self.table_name = 'document_status_type'

   def self.retrieve_document_status_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_document_status_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_document_status_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end





  class EmploymentStatusType < ActiveRecord::Base
  self.table_name = 'employment_status_type'

   def self.retrieve_employment_status_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_employment_status_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_employment_status_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end


  class PatientTreatment < ActiveRecord::Base
  self.table_name = 'patient_treatments'

   def self.retrieve_patient_treatments

    select("uid,patientID,entryType,treatmentType,description,prescribedBy,administeredBy,approvedBy,createInterimOrder,effectiveDate,startDate,endDate")
  end

  def self.retrieve_single_patient_treatments(uid)

   patientDisaster_obj = select("uid,patientID,entryType,treatmentType,description,prescribedBy,administeredBy,approvedBy,createInterimOrder,effectiveDate,startDate,endDate").where(
    "uid = ?","#{uid}"
    )

  end


   def self.retrieve_patient_treatments_patientID(patientID)

   patientDisaster_obj = select("uid,patientID,entryType,treatmentType,description,prescribedBy,administeredBy,approvedBy,createInterimOrder,effectiveDate,startDate,endDate").where(
    "patientID = ?","#{patientID}"
    )

  end

  end




   class PatientSupply < ActiveRecord::Base
  self.table_name = 'patient_supply'

   def self.retrieve_patient_supply

    select("uid,patientID,category,description,units,dispenseQuantity,unitOfMeasurement,addedBy,created_at")
  end

  def self.retrieve_single_patient_supply(uid)

   patientDisaster_obj = select("uid,patientID,category,description,units,dispenseQuantity,unitOfMeasurement,addedBy,created_at").where(
    "uid = ?","#{uid}"
    )

  end
  
  end




   class ServiceNote < ActiveRecord::Base
  self.table_name = 'service_notes'

   def self.retrieve_service_notes

    select("uid,patientID,serviceFormID,serviceType,enteredBy,revisedBy,serviceProvidedBy,serviceDate,timeIn,timeOut,status,created_at")
  end

  def self.retrieve_single_service_notes(uid)

   patientDisaster_obj = select("uid,patientID,serviceFormID,serviceType,enteredBy,revisedBy,serviceProvidedBy,serviceDate,timeIn,timeOut,status,created_at").where(
    "uid = ?","#{uid}"
    )

  end
  
  end



  
   class ServiceNoteForm < ActiveRecord::Base
  self.table_name = 'service_note_forms'

   def self.retrieve_service_note_forms

    select("uid,patientID,serviceNoteID,cardiacAssessement,careCoordination,endocrineAssessment,gastrointestinalAssessment,headerAndSupplies,homeBoundStatus,integumentaryAssessment,intravenouseTherapy,medicationAssessment,musculoskeletalAssessment,narrativeTeaching,neuroProgress,nutritionalAssessment,painAssessment,patientIdentifier,respiratoryAssessment,supervisoryVisitHHA,supervisoryVisitLPN,taskAction,taskGoals,vitalSigns,woundArea,created_at")
  end

  def self.retrieve_single_service_note_forms(uid)

   patientDisaster_obj = select("uid,patientID,serviceNoteID,cardiacAssessement,careCoordination,endocrineAssessment,gastrointestinalAssessment,headerAndSupplies,homeBoundStatus,integumentaryAssessment,intravenouseTherapy,medicationAssessment,musculoskeletalAssessment,narrativeTeaching,neuroProgress,nutritionalAssessment,painAssessment,patientIdentifier,respiratoryAssessment,supervisoryVisitHHA,supervisoryVisitLPN,taskAction,taskGoals,vitalSigns,woundArea,created_at").where(
    "uid = ?","#{uid}"
    )

  end
  
  end





   class VarianceResolutionType < ActiveRecord::Base
  self.table_name = 'variance_resolution_type'

   def self.retrieve_variance_resolution_type

    select("id,removeFromSchedule,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_variance_resolution_type(id)

   patientDisaster_obj = select("id,removeFromSchedule,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_variance_resolution_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,removeFromSchedule,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end



  
   class InvoiceReviewType < ActiveRecord::Base
  self.table_name = 'invoice_review_types'

   def self.retrieve_invoice_review_types

    select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_invoice_review_types(id)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_invoice_review_types_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




    
   class ReportingGroup < ActiveRecord::Base
  self.table_name = 'reporting_groups'

   def self.retrieve_reporting_groups

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_reporting_groups(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_reporting_groups_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




     class EarningCode < ActiveRecord::Base
  self.table_name = 'earnings_code'

   def self.retrieve_earnings_code

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromOT,itemDescription,created_at")
  end

  def self.retrieve_single_earnings_code(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromOT,itemDescription,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_earnings_code_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromOT,itemDescription,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end





     class PayrollTaxCode < ActiveRecord::Base
  self.table_name = 'payroll_tax_code'

   def self.retrieve_payroll_tax_code

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_payroll_tax_code(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_payroll_tax_code_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




       class PatientNoteTypes < ActiveRecord::Base
  self.table_name = 'patient_note_types'

   def self.retrieve_patient_note_types

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromFactReport,noTask,created_at")
  end

  def self.retrieve_single_patient_note_types(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromFactReport,noTask,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_patient_note_types_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromFactReport,noTask,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end




         class PlaceOfAdmissionType < ActiveRecord::Base
  self.table_name = 'place_of_admission_type'

   def self.retrieve_place_of_admission_type

    select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at")
  end

  def self.retrieve_single_place_of_admission_type(id)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_place_of_admission_type_with_organizationUrl(organizationUrl)

   patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "organizationUrl = ?","#{organizationUrl}"
    )

  end

  end





  class PatientDisciplineService < ActiveRecord::Base
  
    self.table_name = 'patient_discipline_services'

   def self.retrieve_patient_discipline_services

    select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked")
  end

  def self.retrieve_single_patient_discipline_services(id)

   patientDisaster_obj = select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked").where(
    "id = ?","#{id}"
    )

  end

    def self.retrieve_patient_discipline_services_with_patientUid(patientUid)

   patientDisaster_obj = select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked").where(
    "patientUid = ?","#{patientUid}"
    )

  end


  def self.retrieve_single_patient_discipline_services(id)

   patientDisaster_obj = select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked").where(
    "id = ?","#{id}"
    )

  end

      def self.retrieve_with_certId(certId)

   patientDisaster_obj = select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked").where(
    "certId = ?","#{certId}"
    )

   end



       def self.retrieve_with_associateUrl(associateUrl)

   patientDisaster_obj = select("id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,end,created_at,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked").where(
    "associateUrl = ?","#{associateUrl}"
    )

   end

  end



     class ApproveMedicationProfile < ActiveRecord::Base
  self.table_name = 'approve_medication_profile'

   def self.retrieve_approve_medication_profile

    select("id,patientID,approvedBy,signature,comments,createIntrimOrder,effectiveDate")
  end

  def self.retrieve_single_approve_medication_profile(id)


   patientDisaster_obj = select("id,patientID,approvedBy,signature,comments,createIntrimOrder,effectiveDate").where(
    "id = ?","#{id}"
    )

  end

   def self.retrieve_approve_medication_profile_w_patientID(patientID)


   patientDisaster_obj = select("id,patientID,approvedBy,signature,comments,createIntrimOrder,effectiveDate").where(
    "patientID = ?","#{patientID}"
    )

  end

  end





    class InsuredAddress < ActiveRecord::Base
  self.table_name = 'insured_address'

   def self.retrieve_insured_address

    select("id,address_type,address1,address2,city,state,zip,phone_type,phones,employerID,organizationUrl,patientPayerUrl")
  end

  def self.retrieve_single_insured_address(id)


   patientDisaster_obj = select("id,address_type,address1,address2,city,state,zip,phone_type,phones,employerID,organizationUrl,patientPayerUrl").where(
    "id = ?","#{id}"
    )

  end


   def self.retrieve_insured_address_patientPayerUrl(patientPayerUrl)


   patientDisaster_obj = select("id,address_type,address1,address2,city,state,zip,phone_type,phones,employerID,organizationUrl,patientPayerUrl").where(
    "patientPayerUrl = ?","#{patientPayerUrl}"
    )

  end



  end



    class CertDetails < ActiveRecord::Base
  self.table_name = 'cert_details'

   def self.retrieve_cert_details

    select("id,principalDiagnosis,principalDiagnosisDate,surgicalProcedure,surgicalProcedureDate,pertinentDiagnosis,otherSurgicalProcedures,dmeSupplies,dmeSuppliesOther,safetyMeasures,nutritionalReq,nutritionalReqOther,allergies,allergiesOther,functionalLimitations,functionalLimitationsOther,activitiesPermitted,activitiesPermittedOther,mentalStatus,prognosis,orders,goalsPotentialPlans,disasterInformation,pocCollaboration,strengthsGoalCarePref,patientRep,patientRiskForH,willingnessAndAbility,advanceDirectives,advanceDirrNarrative,vitalSignParams,nurseDate,nurseSignature,nurseTime,physicianf2fEncounter,automaticPrintingOfFDP,approvalSignature,certId,reasonForHomebound")
  end

  def self.retrieve_single_cert_details(id)


   patientDisaster_obj = select("id,principalDiagnosis,principalDiagnosisDate,surgicalProcedure,surgicalProcedureDate,pertinentDiagnosis,otherSurgicalProcedures,dmeSupplies,dmeSuppliesOther,safetyMeasures,nutritionalReq,nutritionalReqOther,allergies,allergiesOther,functionalLimitations,functionalLimitationsOther,activitiesPermitted,activitiesPermittedOther,mentalStatus,prognosis,orders,goalsPotentialPlans,disasterInformation,pocCollaboration,strengthsGoalCarePref,patientRep,patientRiskForH,willingnessAndAbility,advanceDirectives,advanceDirrNarrative,vitalSignParams,nurseDate,nurseSignature,nurseTime,physicianf2fEncounter,automaticPrintingOfFDP,approvalSignature,certId,reasonForHomebound").where(
    "id = ?","#{id}"
    )

  end

   def self.retrieve_cert_details_with_certId(certId)


   patientDisaster_obj = select("id,principalDiagnosis,principalDiagnosisDate,surgicalProcedure,surgicalProcedureDate,pertinentDiagnosis,otherSurgicalProcedures,dmeSupplies,dmeSuppliesOther,safetyMeasures,nutritionalReq,nutritionalReqOther,allergies,allergiesOther,functionalLimitations,functionalLimitationsOther,activitiesPermitted,activitiesPermittedOther,mentalStatus,prognosis,orders,goalsPotentialPlans,disasterInformation,pocCollaboration,strengthsGoalCarePref,patientRep,patientRiskForH,willingnessAndAbility,advanceDirectives,advanceDirrNarrative,vitalSignParams,nurseDate,nurseSignature,nurseTime,physicianf2fEncounter,automaticPrintingOfFDP,approvalSignature,certId,reasonForHomebound").where(
    "certId = ?","#{certId}"
    )

  end


  end





  class ScheduledServiceNotes < ActiveRecord::Base
  self.table_name = 'scheduled_service_notes'

   def self.retrieve_scheduled_service_notes

    select("id,noteType,note,isActive,associateUrl,serviceId,created_at,patientID")
  end

  def self.retrieve_single_scheduled_service_notes(id)


   patientDisaster_obj = select("id,noteType,note,isActive,associateUrl,serviceId,created_at,patientID").where(
    "id = ?","#{id}"
    )

  end

  def self.retrieve_scheduled_service_notes_with_patientID(patientID)


   patientDisaster_obj = select("id,noteType,note,isActive,associateUrl,serviceId,created_at,patientID").where(
    "patientID = ?","#{patientID}"
    )

  end

   def self.retrieve_scheduled_service_notes_with_serviceId(serviceId)


   patientDisaster_obj = select("id,noteType,note,isActive,associateUrl,serviceId,created_at,patientID").where(
    "serviceId = ?","#{serviceId}"
    )

  end
  end




    class SchedulingConflicts < ActiveRecord::Base
  self.table_name = 'scheduling_conflicts'

   def self.retrieve_scheduling_conflicts

    select("id,patientID,note,associateUrl,organizationUrl")
  end

  

    def self.retrieve_single_scheduling_conflicts(id)


   patientDisaster_obj = select("id,patientID,note,associateUrl,organizationUrl").where(
    "id = ?","#{id}"
    )

  end

  def self.retrieve_scheduling_conflicts_with_patientID(patientID)


   patientDisaster_obj = select("id,patientID,note,associateUrl,organizationUrl").where(
    "patientID = ?","#{patientID}"
    )

  end


  def self.retrieve_scheduling_conflicts_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,patientID,note,associateUrl,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end


  end




###BULK IMPORT
class BulkImport < ActiveRecord::Base
  self.table_name = 'bulk_import'

   def self.import_data(file)
    

      puts "Reading Temp------------------------------ #{file}"  

      
   
            # Thread.new do
              CSV.foreach(file,headers: true, encoding: 'iso-8859-1:utf-8') do |row|
              
                #if row["organizationUrl"].present? && row["resourceType"].present?
                        @store_items = BulkImport.new(name: row["name"], associate_number: row["associate_number"],status: row["status"],
                          discipline: row["discipline"],hire_date: row["hire_date"],start_date: row["start_date"],termination_date: row["termination_date"],
                          territory_name: row["territory_name"],preferred_phone: row["preferred_phone"])
                        @store_items.save!
  
                       puts "RUNNIN HEADER------------------------------"    
  
               
          
          end

   end

end





class ReferralSourceFacilityType < ActiveRecord::Base
  self.table_name = 'referral_source_facility_types'

   def self.retrieve_all_referral_source_facility_types
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end


    def self.retrieve_referral_source_facility_types(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_referral_source_facility_types_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end

  end



  class ReferralSourceFacilityNoteType < ActiveRecord::Base
  self.table_name = 'referral_source_facility_note_types'

   def self.retrieve_all_referral_source_facility_note_types
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_facility_note_types(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end


   def self.retrieve_referral_source_facility_note_types_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end


  end



    class ReferralSourcePhysicianTitle < ActiveRecord::Base
  self.table_name = 'referral_source_physician_title'

   def self.retrieve_all_referral_source_physician_title
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_physician_title(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end

     def self.retrieve_referral_source_physician_title_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end

  end


    class ReferralSourceReferralMethodType < ActiveRecord::Base
  self.table_name = 'referral_source_referral_method_type'

   def self.retrieve_all_referral_source_referral_method_type
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_referral_method_type(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end



   def self.retrieve_referral_source_referral_method_type_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end


  end



      class ReferralSourceNoteType < ActiveRecord::Base
  self.table_name = 'referral_source_source_note_type'

   def self.retrieve_all_referral_source_note_type
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_note_type(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end

  


   def self.retrieve_referral_source_note_type_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end
  end


      class ReferralSourcePhysicianSpecialty < ActiveRecord::Base
  self.table_name = 'referral_source_physician_specialty'

   def self.retrieve_all_referral_source_physician_specialty
    select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_physician_specialty(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,created_at").where(
    "id = ?","#{id}"
    )
  end


    def self.retrieve_referral_source_physician_specialty_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,created_at").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end


  end





       class ReferralSourcePhysicianNoteType < ActiveRecord::Base
  self.table_name = 'referral_source_physician_note_type'

   def self.retrieve_all_referral_source_physician_note_type
    select("id,code,description,groupCode,sortOrder,startDate,endDate,doNotGenerateWBtask,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_physician_note_type(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,doNotGenerateWBtask,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_referral_source_physician_note_type_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,doNotGenerateWBtask,created_at").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end


  end





      class ReferralSourcePhysicianSourceType < ActiveRecord::Base
  self.table_name = 'referral_source_physician_source_type'

   def self.retrieve_all_referral_source_physician_source_type
    select("id,code,description,groupCode,sortOrder,startDate,endDate,isIndividual,created_at,organizationUrl")
  end

    def self.retrieve_referral_source_physician_source_type(id)
select("id,code,description,groupCode,sortOrder,startDate,endDate,isIndividual,created_at,organizationUrl").where(
    "id = ?","#{id}"
    )
  end

   def self.retrieve_referral_source_physician_source_type_with_organizationUrl(organizationUrl)


    patientDisaster_obj = select("id,code,description,groupCode,sortOrder,startDate,endDate,isIndividual,created_at").where(
     "organizationUrl = ?","#{organizationUrl}"
     )
 
   end
  end




  class ServiceRequested < ActiveRecord::Base
    self.table_name = 'services_requested'
  
     def self.retrieve_all_services_requested
      select("id,service,service_description,payer,timeIn,timeOut,startDate,endDate,service_days,byWeekly,created_at")
    end
  
      def self.retrieve_services_requested(id)
  select("id,service,service_description,payer,timeIn,timeOut,startDate,endDate,service_days,byWeekly,created_at").where(
      "id = ?","#{id}"
      )
    end
    end


    
  class DiagnosisCode < ActiveRecord::Base
    self.table_name = 'diagnosis_code'
  
     def self.retrieve_all_diagnosis_code
      select("id,diagnosis_code,diagnosis_description,startDate,created_at")
    end
  
      def self.retrieve_diagnosis_code(id)
  select("id,diagnosis_code,diagnosis_description,startDate,created_at").where(
      "id = ?","#{id}"
      )
    end
    end
