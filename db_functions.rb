PHONE_TYPE_ERR = {resp_code: '101', resp_desc: "Phone Type should exists."}
PHONE_ERR = {resp_code: '101', resp_desc: "Phone should exists."}
ADD_TYPE_ERR = {resp_code: '101', resp_desc: "Address Type should exists."}
ADDRESS_ERR = {resp_code: '101', resp_desc: "Address should exists."}
CITY_ERR = {resp_code: '101', resp_desc: "City should exists."}
STATE_ERR = {resp_code: '101', resp_desc: "State should exists."}
ZIP_ERR = {resp_code: '101', resp_desc: "Zip should exists."}
RELA_ERR = {resp_code: '101', resp_desc: "relationship should exists."}
ASS_URL_ERR = {resp_code: '101', resp_desc: "associateUrl should exists."}
P_TYPE_ERR = {resp_code: '101', resp_desc: "payrollType should exists."}
FED_FIL_ERR = {resp_code: '101', resp_desc: "federalFillingStatus should exists."}
STATE_FIL_ERR = {resp_code: '101', resp_desc: "stateFillingStatus should exists."}
STATE_D_ERR = {resp_code: '101', resp_desc: "stateDeductions should exists."}
DDT_ERR = {resp_code: '101', resp_desc: "startDate should exists."}
SAL_ERR = {resp_code: '101', resp_desc: "salary should exists."}
REG_ERR = {resp_code: '101', resp_desc: "region Url should exists."}
AGENCY_ERR = {resp_code: '101', resp_desc: "agencyName should exists."}
EMAIL_ERR = {resp_code: '101', resp_desc: "Email should exists."}
ORG_ERR = {resp_code: '101', resp_desc: "Organiztion  Url should exists."}
REG_NMA_ERR = {resp_code: '101', resp_desc: "region Name should exists."}
DDC_ERR = {resp_code: '101', resp_desc: "Deduction should exists."}
AMT_ERR = {resp_code: '101', resp_desc: "Amount should exists."}
PAY_TYPE_ERR = {resp_code: '101', resp_desc: "payType should exists."}
SERV_ERR = {resp_code: '101', resp_desc: "serviceDescription should exists."}
WR_ERR = {resp_code: '101', resp_desc: "weekdayRate should exists."}
WNR_ERR = {resp_code: '101', resp_desc: "weekendRate should exists."}
LIC_TYPE_ERR = {resp_code: '101', resp_desc: "License should exists."}
LIC_NUM_ERR = {resp_code: '101', resp_desc: "License number should exists."}
LIC_STAT_ERR = {resp_code: '101', resp_desc: "License state should exists."}
ISSUE_ERR = {resp_code: '101', resp_desc: "Issue Date should exists."}
LIC_SS_ERR = {resp_code: '101', resp_desc: "licenseStatus should exists."}
EX_DATE_ERR = {resp_code: '101', resp_desc: "expirationDate should exists."}
PHY_URL_ERR = {resp_code: '101', resp_desc: "Physicial Url should exists."}


# //SYNERDOC API
def creating_associate(firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl)
  
  
  Associate.create(
    
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    ssn: ssn,
    birthDate: birthDate,
    race: race,
    email: email,
    mobileEmail: mobileEmail,
    schedulingRank: schedulingRank,
    classification: classification,
    discipline: discipline,
    hireDate: hireDate,
    startDate: startDate,
    supervisor: supervisor,
    homeAgency: homeAgency,
    associateNumber: associateNumber,
    associateNPI: associateNPI,
    evvVendorID: evvVendorID,
    evvAdminEmail: evvAdminEmail,
    status: status,
    url: url,
    image: image,
    statusReason: statusReason,
    statusDate: statusDate,
    eligibleForRehire: eligibleForRehire,
    gender: gender,
    organizationUrl: organizationUrl,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_associate(id,firstName,middleName,lastName,ssn,birthDate,race,email,mobileEmail,schedulingRank,classification,discipline,hireDate,startDate,supervisor,homeAgency,associateNumber,associateNPI,evvVendorID,evvAdminEmail,status,url,image,statusReason,statusDate,eligibleForRehire,gender,organizationUrl)
    puts "------------------UPDATING PROFILE ------------------"
    puts "url is #{url}}"
   
    check = Associate.where(id: id).update(
        url: url, firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    ssn: ssn,
    birthDate: birthDate,
    race: race,
    email: email,
    mobileEmail: mobileEmail,
    schedulingRank: schedulingRank,
    classification: classification,
    discipline: discipline,
    hireDate: hireDate,
    startDate: startDate,
    supervisor: supervisor,
    homeAgency: homeAgency,
    associateNumber: associateNumber,
    associateNPI: associateNPI,
    evvVendorID: evvVendorID,
    evvAdminEmail: evvAdminEmail,
    status: status,
     url: url,
    image: image,
    statusReason: statusReason,
    statusDate: statusDate,
    eligibleForRehire: eligibleForRehire,
    gender: gender,
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end


def upload_img(url,image)
    puts "------------------UPDATING PROFILE ------------------"
    puts "url is #{url}}"
   
    check = Associate.where(url: url).update(image: image,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end






########### PYSHICIAN FUNTIONS
def creating_physician(firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated)
  
  
  Physician.create(
    
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    title: title,
    email: email,
    physicianGroup: physicianGroup,
    endDate: endDate,
    startDate: startDate,
    status: status,
    url: url,
    speciality: speciality,
    salesRep: salesRep,
    organizationUrl: organizationUrl,
    updated: updated,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_physician(id,firstName,middleName,lastName,title,speciality,email,physicianGroup,endDate,startDate,status,url,salesRep,organizationUrl,updated)
    puts "------------------UPDATING PROFILE ------------------"
    puts "url is #{url}}"
   
    check = Physician.where(id: id).update(
    url: url,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    title: title,
    email: email,
    physicianGroup: physicianGroup,
    endDate: endDate,
    startDate: startDate,
    status: status,
    url: url,
    salesRep: salesRep,
    speciality: speciality,
    organizationUrl: organizationUrl,
    updated: updated,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### END PYSHICIAN FUNTIONS



########### FACILITIES FUNTIONS
def creating_facility(facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,
    patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone)   
  Facility.create(
    
    facilityName: facilityName,
    facilityType: facilityType,
    email: email,
    salesRep: salesRep,
    endDate: endDate,
    startDate: startDate,
    status: status,
    url: url,
    organizationUrl: organizationUrl,
    updated: updated,
    patientID: patientID,
    addressType: addressType,
    addressOne: addressOne,
    addressTwo: addressTwo,
    city: city,
    state: state,
    zipcode: zipcode,
    placeOfService: placeOfService,
    phoneType: phoneType,
    phone: phone,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_facility(id,facilityName,facilityType,email,salesRep,endDate,startDate,status,url,organizationUrl,updated,
    patientID,addressType,addressOne,addressTwo,city,state,zipcode,placeOfService,phoneType,phone)
    puts "------------------UPDATING FACILITY ------------------"
    puts "url is #{url}}"
   
    check = Facility.where(id: id).update(
      facilityName: facilityName,
    facilityType: facilityType,
    email: email,
    salesRep: salesRep,
    endDate: endDate,
    startDate: startDate,
    status: status,
    url: url,
    organizationUrl: organizationUrl,
    updated: updated,
    patientID: patientID,
    addressType: addressType,
    addressOne: addressOne,
    addressTwo: addressTwo,
    city: city,
    state: state,
    zipcode: zipcode,
    placeOfService: placeOfService,
    phoneType: phoneType,
    phone: phone,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### END Facility FUNTIONS


########### STatus FUNTIONS
def creating_status_history(associateUrl,changedBy,newStatus,date,effective,priorStatus,priorStatusReason,newStatusReason)
   
  StatusHistory.create(
    
    associateUrl: associateUrl,
    changedBy: changedBy,
    newStatus: newStatus,
    date: date,
    effective: effective,
    priorStatus: priorStatus,
    priorStatusReason: priorStatusReason,
    newStatusReason: newStatusReason,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_status(id,associateUrl,changedBy,newStatus,date,effective,priorStatus,priorStatusReason,newStatusReason)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = StatusHistory.where(id: id).update(
        associateUrl: associateUrl,
    changedBy: changedBy,
    newStatus: newStatus,
    date: date,
    effective: effective,
    priorStatus: priorStatus,
    priorStatusReason: priorStatusReason,
    newStatusReason: newStatusReason,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### END Facility FUNTIONS

########### WEB ACCESS FUNTIONS
def creating_website_access(associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated)
   
  WebAccess.create(
    
    associateUrl: associateUrl,
    userName: userName,
    password: password,
    startDate: startDate,
    email: email,
    isActive: isActive,
    isLockedOut: isLockedOut,
    endDate: endDate,
    lastLogin: lastLogin,
    previousLogin: previousLogin,
    passwordExpires: passwordExpires,
    created: created,
    updated: updated,
    roles: roles,
    orgUrl: orgUrl,
    regionUrls: regionUrls,
    agencyUrls: agencyUrls,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_web_access(id,associateUrl,userName,password,startDate,email,isActive,isLockedOut,endDate,lastLogin,previousLogin,passwordExpires,created,roles,orgUrl,regionUrls,agencyUrls,updated)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = WebAccess.where(id: id).update(
        associateUrl: associateUrl,
    userName: userName,
    password: password,
    startDate: startDate,
    email: email,
    isActive: isActive,
    isLockedOut: isLockedOut,
    endDate: endDate,
    lastLogin: lastLogin,
    previousLogin: previousLogin,
    passwordExpires: passwordExpires,
    created: created,
     updated: updated,
    roles: roles,
    orgUrl: orgUrl,
    regionUrls: regionUrls,
    agencyUrls: agencyUrls,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### END Facility FUNTIONS


########### ORG FUNTIONS
def creating_organization(url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate)
   
  Organization.create(
    
    url: url,
    organizationName: organizationName,
    organizationCode: organizationCode,
    email: email,
    primaryContact: primaryContact,
    phoneType: phoneType,
    phone: phone,
    companyStartDate: companyStartDate,
    companyEndDate: companyEndDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_organization(id,url,organizationName,organizationCode,email,primaryContact,phoneType,phone,companyStartDate,companyEndDate)
    puts "------------------UPDATING STATUS ------------------"
    puts "url is #{url}}"
   
    check = Organization.where(id: id).update(
        url: url,
    organizationName: organizationName,
    organizationCode: organizationCode,
    email: email,
    primaryContact: primaryContact,
    phoneType: phoneType,
    phone: phone,
    companyStartDate: companyStartDate,
    companyEndDate: companyEndDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### ORG FUNTIONS END

########### ASSOCIATE NOTES
def creating_associate_notes(associateUrl,noteBy,noteType,document,note,active,date)
   
  AssociateNote.create(
    
    associateUrl: associateUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_associate_notes(id,associateUrl,noteBy,noteType,document,note,active,date)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = AssociateNote.where(id: id).update(
        associateUrl: associateUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end

########### ASSOCIATE FUNTIONS END


########### ancillaryPhoneInfo NOTES
def creating_ancillaryPhoneInfo(associateUrl,phoneType,phone,description)
   
  AncillaryPhoneInfo.create(
    
    associateUrl: associateUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_ancillaryPhoneInfo(id,associateUrl,phoneType,phone,description)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = AncillaryPhoneInfo.where(id: id).update(
        associateUrl: associateUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### ancillaryPhoneInfo FUNTIONS END



########### addressPhoneInfo NOTES
def creating_addressPhoneInfo(associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
   
  AddressPhoneInfo.create(
    
    associateUrl: associateUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_addressPhoneInfo(id,associateUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = AddressPhoneInfo.where(id: id).update(
    associateUrl: associateUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### addressPhoneInfo FUNTIONS END


########### emergencyContacts NOTES
def creating_emergencyContacts(associateUrl,relationship,firstName,lastName,priority,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)

   
  EmergencyContact.create(
    
    associateUrl: associateUrl,
    relationship: relationship,
    firstName: firstName,
    lastName: lastName,
    priority: priority,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_emergencyContacts(id,associateUrl,relationship,firstName,lastName,priority,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = EmergencyContact.where(id: id).update(
        associateUrl: associateUrl,
   relationship: relationship,
    firstName: firstName,
    lastName: lastName,
    priority: priority,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### addressPhoneInfo FUNTIONS END

########### DOCUMENTS NOTES
def creating_documents(associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)

   
  Document.create(
    
    associateUrl: associateUrl,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_documents(id,associateUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
    puts "------------------UPDATING STATUS ------------------"
    puts "ID is #{id}}"
   
    check = Document.where(id: id).update(
    associateUrl: associateUrl,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### DOCUMENTS END

########### DOCUMENTS NOTES
def creating_associate_availability(associateUrl,date,day,start,end_time,availability_type,reason)
   
  AssociateAvailability.create(
    
    associateUrl: associateUrl,
    date: date,
    day: day,
    start: start,
    end: end_time,
    availability_type: availability_type,
    reason: reason,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_associate_availability(id,associateUrl,date,day,start,end_time,availability_type,reason)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = AssociateAvailability.where(id: id).update(
        associateUrl: associateUrl,
     date: date,
    day: day,
    start: start,
    end: end_time,
    availability_type: availability_type,
    reason: reason,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### DOCUMENTS END

########### PAYROLL NOTES
def creating_payroll(associateUrl,salary,payrollType,federalDeductions,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck)
   
  Payroll.create(
    
    associateUrl: associateUrl,
    salary: salary,
    payrollType: payrollType,
    federalDeductions: federalDeductions,
    federalFillingStatus: federalFillingStatus,
    stateFillingStatus: stateFillingStatus,
    stateDeductions: stateDeductions,
    startDate: startDate,
    wbCheck: wbCheck,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_payroll(id,associateUrl,salary,payrollType,federalDeductions,federalFillingStatus,stateFillingStatus,stateDeductions,startDate,wbCheck)
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = AssociateAvailability.where(id: id).update(
        associateUrl: associateUrl,
    salary: salary,
    payrollType: payrollType,
    federalDeductions: federalDeductions,
    federalFillingStatus: federalFillingStatus,
    stateFillingStatus: stateFillingStatus,
    stateDeductions: stateDeductions,
    startDate: startDate,
    wbCheck: wbCheck,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end



########### AGENCY NOTES
def creating_agency(url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated)
 
  Agency.create(
    
    url: url,
    organizationUrl: organizationUrl,
    regionUrl: regionUrl,
    agencyName: agencyName,
    agencyType: agencyType,
    payrollCutoff: payrollCutoff,
    procActionDate: procActionDate,
    nameOnInvoice: nameOnInvoice,
    agencyCode: agencyCode,
    email: email,
    primaryContact: primaryContact,
    startDate: startDate,
    endDate: endDate,
    externalFacilityID: externalFacilityID,
    agencyReportID: agencyReportID,
    updated: updated,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_agency(id,url,organizationUrl,regionUrl,agencyName,agencyType,payrollCutoff,procActionDate,nameOnInvoice,agencyCode,email,primaryContact,startDate,endDate,externalFacilityID,agencyReportID,updated)
   puts "------------------UPDATING STATUS ------------------"
    puts "url is #{url}}"
   
    check = Agency.where(id: id).update(
        url: url,
    organizationUrl: organizationUrl,
    regionUrl: regionUrl,
    agencyName: agencyName,
    agencyType: agencyType,
    payrollCutoff: payrollCutoff,
    procActionDate: procActionDate,
    nameOnInvoice: nameOnInvoice,
    agencyCode: agencyCode,
    email: email,
    primaryContact: primaryContact,
    startDate: startDate,
    endDate: endDate,
    externalFacilityID: externalFacilityID,
    agencyReportID: agencyReportID,
    updated: updated,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end




########### Regions
def creating_region(url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated)
 
  Region.create(
    
    url: url,
    organizationUrl: organizationUrl,
    regionName: regionName,
    regionCode: regionCode,
    email: email,
    primaryContact: primaryContact,
    startDate: startDate,
    endDate: endDate,
    updated: updated,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_region(id,url,organizationUrl,regionName,regionCode,email,primaryContact,startDate,endDate,updated)
   puts "------------------UPDATING STATUS ------------------"
    puts "url is #{url}}"
   
    check = Region.where(id: id).update(
        url: url,
     organizationUrl: organizationUrl,
    regionName: regionName,
    regionCode: regionCode,
    email: email,
    primaryContact: primaryContact,
    startDate: startDate,
    endDate: endDate,
    updated: updated,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end


########### Deductions
def creating_deductions(associateUrl,deduction,amount,startDate,endDate)
 
  Deduction.create(
    
    associateUrl: associateUrl,
    deduction: deduction,
    amount: amount,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_deduction(id,associateUrl,deduction,amount,startDate,endDate)
   puts "------------------UPDATING Deduction ------------------"
    puts "id is #{id}}"
   
    check = Deduction.where(id: id).update(
    associateUrl: associateUrl,
    deduction: deduction,
    amount: amount,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts "Is is updating ---------- #{check.inspect} "
    
    
  #end     
end



########### Payrates
def creating_payrates(associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate)
 
  Payrate.create(
    
    associateUrl: associateUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_payrates(id,associateUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate)
   puts "------------------UPDATING Deduction ------------------"
    puts "id is #{id}}"
   
    check = Payrate.where(id: id).update(
    associateUrl: associateUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### Licenses
def creating_license(associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate)
  
  License.create(
    
    associateUrl: associateUrl,
    licenseType: licenseType,
    licenseNumber: licenseNumber,
    licenseState: licenseState,
    issueDate: issueDate,
    licenseStatus: licenseStatus,
    expirationDate: expirationDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_license(id,associateUrl,licenseType,licenseNumber,licenseState,issueDate,licenseStatus,expirationDate)
   puts "------------------UPDATING Deduction ------------------"
    puts "id is #{id}}"
   
    check = License.where(id: id).update(
     associateUrl: associateUrl,
    licenseType: licenseType,
    licenseNumber: licenseNumber,
    licenseState: licenseState,
    issueDate: issueDate,
    licenseStatus: licenseStatus,
    expirationDate: expirationDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### skills
def creating_skills(associateUrl,skills)
  Skill.create(
    
    associateUrl: associateUrl,
    skills: skills,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_skills(id,associateUrl,skills)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = Skill.where(id: id).update(
    associateUrl: associateUrl,
    skills: skills,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end


########### Compliance
def creating_compliance(associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative)
  Compliance.create(
    
    associateUrl: associateUrl,
    item: item,
    complianceType: complianceType,
    lastModifiedBy: lastModifiedBy,
    lastModifiedByDate: lastModifiedByDate,
    result: result,
    completed: completed,
    renewal: renewal,
    compliant: compliant,
    notNeeded: notNeeded,
    comment:  comment,
   narrative: narrative,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_compliance(id,associateUrl,item,complianceType,lastModifiedBy,lastModifiedByDate,result,completed,renewal,compliant,notNeeded,comment,narrative)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = Compliance.where(id: id).update(
     associateUrl: associateUrl,
    item: item,
    complianceType: complianceType,
    lastModifiedBy: lastModifiedBy,
    lastModifiedByDate: lastModifiedByDate,
    result: result,
    completed: completed,
    renewal: renewal,
    compliant: compliant,
    notNeeded: notNeeded,
    comment:  comment,
   narrative: narrative,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### PHYSICIAN ADDRESS
def creating_physician_address(physicianUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
  PhysicianAddress.create(
    
    physicianUrl: physicianUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_address(id,physicianUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianAddress.where(id: id).update(
   physicianUrl: physicianUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### physician_referral_source_contacts 
def creating_physician_referral_source_contacts(physicianUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy)
  PhysicianReferralSourceContacts.create(
    
    physicianUrl: physicianUrl,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    phone1: phone1,
    phone2: phone2,
    information: information,
    email: email,
    startDate: startDate,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_referral_source_contacts(id,physicianUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianReferralSourceContacts.where(id: id).update(
  physicianUrl: physicianUrl,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    phone1: phone1,
    phone2: phone2,
    information: information,
    email: email,
    startDate: startDate,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end


########### physician_ancillary_phone_info 
def creating_physician_ancillary_phone_info(physicianUrl,phoneType,phone,description,updatedBy)
  PhysicianAncillaryPhoneInfo.create(
    
    physicianUrl: physicianUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_ancillary_phone_info(id,physicianUrl,phoneType,phone,description,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianAncillaryPhoneInfo.where(id: id).update(
   physicianUrl: physicianUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




########### creating_physician_notes 
def creating_physician_notes(physicianUrl,date,noteBy,noteType,document,note,active,updatedBy)
  PhysicianNote.create(
    
    physicianUrl: physicianUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_notes(id,physicianUrl,date,noteBy,noteType,document,note,active,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianNote.where(id: id).update(
   physicianUrl: physicianUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### Physician_licenses
def creating_physician_licenses(physicianUrl,licenseNumber,state,expirationDate,verificationDate,status)
  PhysicianLicenses.create(
    
    physicianUrl: physicianUrl,
    licenseNumber: licenseNumber,
    expirationDate: expirationDate,
    state: state,
    verificationDate: verificationDate,
    status: status,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_licenses(id,physicianUrl,licenseNumber,state,expirationDate,verificationDate,status)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianLicenses.where(id: id).update(
     physicianUrl: physicianUrl,
    licenseNumber: licenseNumber,
    expirationDate: expirationDate,
    state: state,
    verificationDate: verificationDate,
    status: status,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end





########### PhysicianIdentifier
def creating_physician_identifier(physicianUrl,identifierType,identifierValue,startDate,endDate,updatedBy)
  PhysicianIdentifier.create(
    
    physicianUrl: physicianUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_identifier(id,physicianUrl,identifierType,identifierValue,startDate,endDate,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianIdentifier.where(id: id).update(
    physicianUrl: physicianUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




########### PhysicianDocuments
def creating_physician_documents(physicianUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
  PhysicianDocuments.create(
    
    physicianUrl: physicianUrl,
    attachTo: attachTo,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_physician_documents(id,physicianUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PhysicianDocuments.where(id: id).update(
     physicianUrl: physicianUrl,
    attachTo: attachTo,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### facility_ancillary_phones
def creating_facility_ancillary_phones(facilityUrl,phoneType,phone,description,updatedBy)
  FacilityAncillaryPhone.create(
    
    facilityUrl: facilityUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updatedBy: updatedBy,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_ancillary_phones(id,facilityUrl,phoneType,phone,description,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityAncillaryPhone.where(id: id).update(
   facilityUrl: facilityUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updatedBy: updatedBy,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### facility_referral_source_contacts
def creating_facility_referral_source_contacts(facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy)
  FacilityReferralSourceContact.create(
    
    facilityUrl: facilityUrl,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    phone1: phone1,
    phone2: phone2,
    information: information,
    email: email,
    startDate: startDate,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_referral_source_contacts(id,facilityUrl,firstName,middleName,lastName,phone1,phone2,information,email,startDate,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityReferralSourceContact.where(id: id).update(
    facilityUrl: facilityUrl,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    phone1: phone1,
    phone2: phone2,
    information: information,
    email: email,
    startDate: startDate,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end





########### create_facility_address_phone_infos
 def creating_facility_address_phone_infos(facilityUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,updatedBy,placeOfService,startDate,endDate)

  FacilityAddressPhoneInfo.create(
    
    facilityUrl: facilityUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updatedBy: updatedBy,
    placeOfService: placeOfService,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_address_phone_infos(id,facilityUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones,updatedBy,placeOfService,startDate,endDate)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityAddressPhoneInfo.where(id: id).update(
   facilityUrl: facilityUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updatedBy: updatedBy,
    placeOfService: placeOfService,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### create_collector_assignments
 def creating_collector_assignments(agency,level,assignTo,payer,payerCategory,team,patientEncounter,organizationUrl)
  CollectorAssignment.create(
    
    agency: agency,
    level: level,
    assignTo: assignTo,
    payer: payer,
    payerCategory: payerCategory,
    team: team,
    patientEncounter: patientEncounter,
    organizationUrl: organizationUrl,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_collector_assignments(id,agency,level,assignTo,payer,payerCategory,team,patientEncounter,organizationUrl)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = CollectorAssignment.where(id: id).update(
    agency: agency,
    level: level,
    assignTo: assignTo,
    payer: payer,
    payerCategory: payerCategory,
    team: team,
    patientEncounter: patientEncounter,
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end

########### create_referralData
 def creating_referralData(
    uid,
  isCompleted,status,agency,
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
primaryPhysicianPreferredAddress
)
  ReferralData.create(
    uid: uid,
isCompleted: isCompleted,
status: status,
agency: agency,
 agencyType: agencyType,
referralSourceID: referralSourceID,
modeOfDelivery: modeOfDelivery,
referralSourceContact: referralSourceContact,
payerCategory: payerCategory,
referralDate: referralDate,
referralSOC: referralSOC,
admissionSource: admissionSource,
admissionType: admissionType,
disciplines: disciplines,
primaryPhysician: primaryPhysician,
physicians: physicians,
physicianType: physicianType,
requestedSOC: requestedSOC,
physicianOrders: physicianOrders,
orderDate: orderDate,
surgicalProcedures: surgicalProcedures,
nutritionalRequirements: nutritionalRequirements,
supplyInformation: supplyInformation,
diagnosisCode: diagnosisCode,
diagnosis: diagnosis,
medications: medications,
zipCode: zipCode,
skills: skills,
organization_url: organization_url,
createdBy: createdBy,
modifiedBy: modifiedBy,
patientID: patientID,
signature: signature,
primaryPhysicianPreferredAddress: primaryPhysicianPreferredAddress,
created_at: Time.new.strftime('%F %R'),
  )
end

def  get_update_referralData(uid, isCompleted,status,agency,
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
skills,organization_url,
createdBy,modifiedBy,patientID,
signature,primaryPhysicianPreferredAddress)

puts "------------------UPDATING skills ------------------"
  
   
check = ReferralData.where(uid: uid).update(
isCompleted: isCompleted,
status: status,
agency: agency,
 agencyType: agencyType,
referralSourceID: referralSourceID,
modeOfDelivery: modeOfDelivery,
referralSourceContact: referralSourceContact,
payerCategory: payerCategory,
referralDate: referralDate,
referralSOC: referralSOC,
admissionSource: admissionSource,
admissionType: admissionType,
disciplines: disciplines,
primaryPhysician: primaryPhysician,
physicians: physicians,
physicianType: physicianType,
requestedSOC: requestedSOC,
physicianOrders: physicianOrders,
orderDate: orderDate,
surgicalProcedures: surgicalProcedures,
nutritionalRequirements: nutritionalRequirements,
supplyInformation: supplyInformation,
diagnosisCode: diagnosisCode,
diagnosis: diagnosis,
medications: medications,
zipCode: zipCode,
skills: skills,
organization_url: organization_url,
createdBy: createdBy,
modifiedBy: modifiedBy,
patientID: patientID,
signature: signature,
primaryPhysicianPreferredAddress: primaryPhysicianPreferredAddress,
updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end





########### create_collector_assignments
 def creating_patients(uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,characteristics,county,
    lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate)

  Patient.create(
    
    uid: uid,
    patientType: patientType,
    status: status,
    encounterNumber: encounterNumber,
    referralID: referralID,
    presentation: presentation,
    patientInformation: patientInformation,
    placeOfAdmission: placeOfAdmission,
    admissionDate: admissionDate,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    dateOfBirth: dateOfBirth,
    gender: gender,
    race: race,
    maritalStatus: maritalStatus,
    email: email,
    readmitID: readmitID,
    facilities: facilities,
    organization_url: organization_url,
    medicalRecord: medicalRecord,
    socialSecurity: socialSecurity,
    characteristics: characteristics,
    county: county,
    lastFacilityStayed: lastFacilityStayed,
    transferedFromAnotherAgency: transferedFromAnotherAgency,
    residence: residence,
    excludeFromPatientSurvey: excludeFromPatientSurvey,
    herpesZoosterVacSOC: herpesZoosterVacSOC,
    advancePlanCareAtSOC: advancePlanCareAtSOC,
    influenzaVaccineAtSOC: influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC: pneumoniaVaccineAtSOC,
    dnrStatus: dnrStatus,
    advanceDirectivesNaratives: advanceDirectivesNaratives,
    dischargeReason: dischargeReason,
   dischargeDate: dischargeDate,
   dischargeTime: dischargeTime,
   team: team,
   facilityName: facilityName,
   onHold: onHold,
   offHold: offHold,
   declineReason: declineReason,
   declineDate: declineDate,
    created_at: Time.new.strftime('%F %R'),
  )
end

def  get_update_patient(uid,patientType,status,encounterNumber,referralID,presentation,patientInformation,placeOfAdmission,
    admissionDate,firstName,middleName,lastName,dateOfBirth,gender,race,maritalStatus,email,readmitID,facilities,organization_url,medicalRecord,socialSecurity,
    characteristics,county,lastFacilityStayed,transferedFromAnotherAgency,residence,excludeFromPatientSurvey,herpesZoosterVacSOC,advancePlanCareAtSOC,influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC,dnrStatus,advanceDirectivesNaratives,dischargeReason,dischargeDate,dischargeTime,team,facilityName,onHold,offHold,declineReason,declineDate)

   puts "------------------UPDATING skills ------------------"
   
   
    check = Patient.where(uid: uid).update(
     patientType: patientType,
    status: status,
    encounterNumber: encounterNumber,
    referralID: referralID,
    presentation: presentation,
    patientInformation: patientInformation,
    placeOfAdmission: placeOfAdmission,
    admissionDate: admissionDate,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
    dateOfBirth: dateOfBirth,
    gender: gender,
    race: race,
    maritalStatus: maritalStatus,
    email: email,
    readmitID: readmitID,
    facilities: facilities,
    organization_url: organization_url,
    medicalRecord: medicalRecord,
    socialSecurity: socialSecurity,
    characteristics: characteristics,
    county: county,
      lastFacilityStayed: lastFacilityStayed,
    transferedFromAnotherAgency: transferedFromAnotherAgency,
    residence: residence,
    excludeFromPatientSurvey: excludeFromPatientSurvey,
    herpesZoosterVacSOC: herpesZoosterVacSOC,
    advancePlanCareAtSOC: advancePlanCareAtSOC,
    influenzaVaccineAtSOC: influenzaVaccineAtSOC,
    pneumoniaVaccineAtSOC: pneumoniaVaccineAtSOC,
    dnrStatus: dnrStatus,
    advanceDirectivesNaratives: advanceDirectivesNaratives,
     dischargeReason: dischargeReason,
   dischargeDate: dischargeDate,
   dischargeTime: dischargeTime,
   team: team,
   facilityName: facilityName,
   onHold: onHold,
   offHold: offHold,
   declineReason: declineReason,
   declineDate: declineDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



def upload_patient_img(uid,image)
    puts "------------------UPDATING PROFILE ------------------"
    puts "url is #{url}}"
   
    check = Patient.where(uid: uid).update(image: image,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### FaciilityDocuments
def creating_facility_documents(facilityUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
  FacilityDocuments.create(
    
    facilityUrl: facilityUrl,
    attachTo: attachTo,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_documents(id,facilityUrl,attachTo,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityDocuments.where(id: id).update(
     facilityUrl: facilityUrl,
    attachTo: attachTo,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### FacilityIdentifier
def creating_facility_identifier(facilityUrl,identifierType,identifierValue,startDate,endDate,updatedBy)
  FacilityIdentifier.create(
    
    facilityUrl: facilityUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_identifier(id,facilityUrl,identifierType,identifierValue,startDate,endDate,updatedBy)
      puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityIdentifier.where(id: id).update(
    facilityUrl: facilityUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




########### creating_physician_notes 
def creating_facility_notes(facilityUrl,date,noteBy,noteType,document,note,active,updatedBy)
  FacilityNote.create(
    
    facilityUrl: facilityUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_facility_notes(id,facilityUrl,date,noteBy,noteType,document,note,active,updatedBy)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = FacilityNote.where(id: id).update(
   facilityUrl: facilityUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### creating_payments 
def creating_payments(paymentSource,paymentMethod,paymentAmount,remitDate,depositDate,referenceNumber,applyPaymentsTo,
   	noteType,note,agency,paymentType,accountBalance,amountToApply,paymentBalance,appliedToRemit,organizationUrl,paymentStatus)
 
 ppay =  Payment.create(
    
    paymentSource: paymentSource,
    paymentMethod: paymentMethod,
    paymentAmount: paymentAmount,
    remitDate: remitDate,
    depositDate: depositDate,
    referenceNumber: referenceNumber,
    applyPaymentsTo: applyPaymentsTo,
    noteType: noteType,
    note: note,
    agency: agency,
    paymentType: paymentType,
    accountBalance: accountBalance,
    amountToApply: amountToApply,
    paymentBalance: paymentBalance,
    appliedToRemit: appliedToRemit,
    organizationUrl: organizationUrl,
    paymentStatus: paymentStatus,
    created_at: Time.new.strftime('%F %R'),
  )

 return ppay
end

def get_update_payments(id,paymentSource,paymentMethod,paymentAmount,remitDate,depositDate,referenceNumber,applyPaymentsTo,
   	noteType,note,agency,paymentType,accountBalance,amountToApply,paymentBalance,appliedToRemit,organizationUrl,paymentStatus)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = Payment.where(id: id).update(
    paymentSource: paymentSource,
    paymentMethod: paymentMethod,
    paymentAmount: paymentAmount,
    remitDate: remitDate,
    depositDate: depositDate,
    referenceNumber: referenceNumber,
    applyPaymentsTo: applyPaymentsTo,
    noteType: noteType,
    note: note,
    agency: agency,
    paymentType: paymentType,
    accountBalance: accountBalance,
    amountToApply: amountToApply,
    paymentBalance: paymentBalance,
    appliedToRemit: appliedToRemit,
    organizationUrl: organizationUrl,
    paymentStatus: paymentStatus,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



def creating_payer_notes(payerUrl,date,noteBy,noteType,document,note,active)
  PayerNotes.create(
    
    payerUrl: payerUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_payerNotes(id,payerUrl,date,noteBy,noteType,document,note,active)
   puts "------------------UPDATING skills ------------------"
    puts "id is #{id}}"
   
    check = PayerNotes.where(id: id).update(
    payerUrl: payerUrl,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end


########### creating_patient_ancillary_phones 
def creating_patient_ancillary_phones(uid,patientID,phone,phoneType,extension,description)
  PatientAncillaryPhones.create(
    
    uid: uid,
    patientID: patientID,
    phone: phone,
    phoneType: phoneType,
    extension: extension,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_patient_ancillary_phones(uid,patientID,phone,phoneType,extension,description)
   puts "------------------UPDATING skills ------------------"
    puts "uid is #{uid}}"
   
    check = PatientAncillaryPhones.where(uid: uid).update(
      patientID: patientID,
    phone: phone,
    phoneType: phoneType,
    extension: extension,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end

########### PatientAddressPhoneInfo 
def creating_patient_address_phone_info(uid,patientID,addressType,addressOne,addressTwo,city,state,zipcode,phoneType,phone,startDate,endDate)
  
  PatientAddressPhoneInfo.create(
    uid: uid,
    patientID: patientID,
    addressType: addressType,
    addressOne: addressOne,
    addressTwo: addressTwo,
    city: city,
    state: state,
    zipcode: zipcode,
    phoneType: phoneType,
    phone: phone,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end

def get_update_patient_address_phone_info(uid,patientID,addressType,addressOne,addressTwo,city,state,zipcode,phoneType,phone,startDate,endDate)
    
    check = PatientAddressPhoneInfo.where(uid: uid).update(
    patientID: patientID,
    addressType: addressType,
    addressOne: addressOne,
    addressTwo: addressTwo,
    city: city,
    state: state,
    zipcode: zipcode,
    phoneType: phoneType,
    phone: phone,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end


########### PatientAddressPhoneInfo 
def creating_payer_settings(payerUrl,startDate,endDate,lastBilledDay,nextBillingDay,holdBillingDate,processThroughDate,
    reportingGroup,dayOfTheMonth,overrideWeekendingDate,restrictPayer)

    PayerSettings.create(
    
    payerUrl: payerUrl,
    startDate: startDate,
    endDate: endDate,
    lastBilledDay: lastBilledDay,
    nextBillingDay: nextBillingDay,
    holdBillingDate: holdBillingDate,
    processThroughDate: processThroughDate,
    reportingGroup: reportingGroup,
    dayOfTheMonth: dayOfTheMonth,
    overrideWeekendingDate: overrideWeekendingDate,
    restrictPayer: restrictPayer,
    created_at: Time.new.strftime('%F %R'),
  )
end

def  get_update_payer_settings(id,payerUrl,startDate,endDate,lastBilledDay,nextBillingDay,holdBillingDate,processThroughDate,
    reportingGroup,dayOfTheMonth,overrideWeekendingDate,restrictPayer)
       
    check = PayerSettings.where(id: id).update(
    payerUrl: payerUrl,
    startDate: startDate,
    endDate: endDate,
    lastBilledDay: lastBilledDay,
    nextBillingDay: nextBillingDay,
    holdBillingDate: holdBillingDate,
    processThroughDate: processThroughDate,
    reportingGroup: reportingGroup,
    dayOfTheMonth: dayOfTheMonth,
    overrideWeekendingDate: overrideWeekendingDate,
    restrictPayer: restrictPayer,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




########### ContactInfo
def creating_payer_ContactInfo(payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,billTo,attention,description)

    PayerContactInfo.create(
    
    payerUrl: payerUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    billTo: billTo,
    attention: attention,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end

def  get_update_payer_ContactInfo(id,payerUrl,addressType,address1,address2,city,state,zip,
    addressPhoneInfoPhones,billTo,attention,description)
       
    check = PayerContactInfo.where(id: id).update(
    payerUrl: payerUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    billTo: billTo,
    attention: attention,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




########### ContactInfo
def creating_payer_Contacts(payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones)

    PayerContacts.create(
    
    payerUrl: payerUrl,
    contactName: contactName,
    contactEmail: contactEmail,
    department: department,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end

def  get_update_payer_Contacts(id,payerUrl,contactName,contactEmail,department,
    addressPhoneInfoPhones)
       
    check = PayerContacts.where(id: id).update(
   payerUrl: payerUrl,
    contactName: contactName,
    contactEmail: contactEmail,
    department: department,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end



########### Payer
def creating_payer(organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url)

    Payer.create(
    
    organizationUrl: organizationUrl,
    payerName: payerName,
    payerCategory: payerCategory,
    oasisCategory: oasisCategory,
    claimFilingType: claimFilingType,
    invoiceType: invoiceType,
    invoiceCycle: invoiceCycle,
    startDate: startDate,
    endDate: endDate,
    payerEmail: payerEmail,
    applySalesTax: applySalesTax,
    updated: updated,
    url: url,
    created_at: Time.new.strftime('%F %R'),
  )
end

def   get_update_payer(id,organizationUrl,payerName,payerCategory,oasisCategory,
    claimFilingType,invoiceType,invoiceCycle,startDate,endDate,payerEmail,applySalesTax,updated,url)
       
    check = Payer.where(id: id).update(
   organizationUrl: organizationUrl,
    payerName: payerName,
    payerCategory: payerCategory,
    oasisCategory: oasisCategory,
    claimFilingType: claimFilingType,
    invoiceType: invoiceType,
    invoiceCycle: invoiceCycle,
    startDate: startDate,
    endDate: endDate,
    payerEmail: payerEmail,
    applySalesTax: applySalesTax,
    updated: updated,
    url: url,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end





########### creating_payer_ancillary_phone 
def creating_payer_ancillary_phone(payerUrl,phoneType,phone,description)
   
  PayerAncillaryPhone.create(
    
    payerUrl: payerUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end 


def   get_update_PayerAncillaryPhone(id,payerUrl,phoneType,phone,description)
    puts "------------------UPDATING STATUS ------------------"
  
   
    check = PayerAncillaryPhone.where(id: id).update(
        payerUrl: payerUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end




########### creating_patient_notes 
def creating_patient_notes(uid,note,noteType,noteBy,patientID,document,active,date)
   
  PatientNotes.create(
    uid: uid,
    note: note,
    noteType: noteType,
    noteBy: noteBy,
    patientID: patientID,
    document: document,
    active: active,
    date: date,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_notes(uid,note,noteType,noteBy,patientID,document,active,date)
    puts "------------------UPDATING STATUS ------------------"
  
   
    check = PatientNotes.where(uid: uid).update(
    note: note,
    noteType: noteType,
    noteBy: noteBy,
    patientID: patientID,
     document: document,
    active: active,
    date: date,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end





########### creating_patient_contacts 
def creating_patient_contacts(uid,patientID,relationship,contactType,firstName,lastName,dateOfBirth,sequence,email,misc)
  
  PatientContacts.create(
    
    uid: uid,
    patientID: patientID,
    relationship: relationship,
    contactType: contactType,
     firstName: firstName,
      lastName: lastName,
       dateOfBirth: dateOfBirth,
        sequence: sequence,
         email: email,
         misc: misc,

    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patient_contacts(uid,patientID,relationship,contactType,firstName,lastName,dateOfBirth,sequence,email,misc)
    puts "------------------UPDATING STATUS ------------------"
  
   
    check = PatientContacts.where(uid: uid).update(
    patientID: patientID,
    relationship: relationship,
    contactType: contactType,
     firstName: firstName,
      lastName: lastName,
       dateOfBirth: dateOfBirth,
        sequence: sequence,
         email: email,
         misc: misc,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end




########### ReferralSourceContact 
def creating_referral_source_contacts(uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,referralSourceID,organizationUrl,information)
  
  ReferralSourceContact.create(
    uid: uid,
    firstName: firstName,
    lastName: lastName,
    middleName: middleName,
    email: email,
      startDate: startDate,
       phoneOne: phoneOne,
        phoneTwo: phoneTwo,
         phoneOneType: phoneOneType,
         phoneTwoType: phoneTwoType,
         referralSourceID: referralSourceID,
         organizationUrl: organizationUrl,
         information: information,

    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_contacts(uid,firstName,lastName,middleName,email,startDate,phoneOne,phoneTwo,phoneOneType,phoneTwoType,referralSourceID,organizationUrl,information)
    puts "------------------UPDATING STATUS ------------------"
  
   
    check = ReferralSourceContact.where(uid: uid).update(
     firstName: firstName,
    lastName: lastName,
    middleName: middleName,
    email: email,
      startDate: startDate,
       phoneOne: phoneOne,
        phoneTwo: phoneTwo,
         phoneOneType: phoneOneType,
         phoneTwoType: phoneTwoType,
       referralSourceID: referralSourceID,
         organizationUrl: organizationUrl,
         information: information,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end
########### ancillaryPhoneInfo FUNTIONS END


########### ReferralSource 
def creating_referral_source(uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated)  
  ReferralSource.create(
     uid: uid,
    referralType: referralType,
    facilityName: facilityName,
    facilityType: facilityType,
    referralCompany: referralCompany,
      firstName: firstName,
       lastName: lastName,
        middleName: middleName,
         email: email,
         salesRep: salesRep,
         startDate: startDate,
         endDate: endDate,
         physicianGroup: physicianGroup,
         specialty: specialty,
         title: title,
         organizationUrl: organizationUrl,
         status: status,
         updated: updated,

    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_referral_source(uid,referralType,facilityName,facilityType,referralCompany,firstName,lastName,middleName,email,salesRep,startDate,
    endDate,physicianGroup,specialty,title,organizationUrl,status,updated)
       puts "------------------UPDATING STATUS ------------------"
  
   
    check = ReferralSource.where(uid: uid).update(
       referralType: referralType,
    facilityName: facilityName,
    facilityType: facilityType,
    referralCompany: referralCompany,
      firstName: firstName,
       lastName: lastName,
        middleName: middleName,
         email: email,
         salesRep: salesRep,
         startDate: startDate,
         endDate: endDate,
         physicianGroup: physicianGroup,
         specialty: specialty,
         title: title,
         organizationUrl: organizationUrl,
          status: status,
         updated: updated,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end



########### ReferralSourceContact 
def creating_associate_medical_compliance(associateUrl,comment,completed,complianceType,compliant,item,lastModifiedBy,lastModifiedByDate,narrative,notNeeded,renewal,result)
  
  AssociateMedicalCompliance.create(
    
    associateUrl: associateUrl,
    comment: comment,
    completed: completed,
    complianceType: complianceType,
    compliant: compliant,
    item: item,
    lastModifiedBy: lastModifiedBy,
    lastModifiedByDate: lastModifiedByDate,
    narrative: narrative,
    notNeeded: notNeeded,
    renewal: renewal,
    result: result,

    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_associate_medical_compliance(id,associateUrl,comment,completed,complianceType,compliant,item,lastModifiedBy,lastModifiedByDate,narrative,notNeeded,renewal,result)
 
   
    check = AssociateMedicalCompliance.where(id: id).update(
     associateUrl: associateUrl,
    comment: comment,
    completed: completed,
    complianceType: complianceType,
    compliant: compliant,
    item: item,
    lastModifiedBy: lastModifiedBy,
    lastModifiedByDate: lastModifiedByDate,
    narrative: narrative,
    notNeeded: notNeeded,
    renewal: renewal,
    result: result,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end



########### AssociateReport 
def creating_associate_reports(associateUrl,reportName,startDate,endDate) 
  AssociateReport.create(
    
    associateUrl: associateUrl,
    reportName: reportName,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_associate_reports(id,associateUrl,reportName,startDate,endDate) 
    check = AssociateReport.where(id: id).update(
     associateUrl: associateUrl,
    reportName: reportName,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end



########### PayerForm 
def creating_payer_form(payerUrl,automatedFormType,uploadDocumentType,orderToRecheck,startDate,endDate)

  PayerForm.create(
    
    payerUrl: payerUrl,
    automatedFormType: automatedFormType,
    uploadDocumentType: uploadDocumentType,
    orderToRecheck: orderToRecheck,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_form(id,payerUrl,automatedFormType,uploadDocumentType,orderToRecheck,startDate,endDate)
 
    check = PayerForm.where(id: id).update(
    payerUrl: payerUrl,
    automatedFormType: automatedFormType,
    uploadDocumentType: uploadDocumentType,
    orderToRecheck: orderToRecheck,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






########### PayerRule 
def creating_payer_rules(payerUrl,rule,description,groupCode,modifiedBy,modifiedDate,createdDate,startDate,endDate,status)

  
  PayerRule.create(
    
    payerUrl: payerUrl,
    rule: rule,
    description: description,
    groupCode: groupCode,
    modifiedBy: modifiedBy,
    modifiedDate: modifiedDate,
    createdDate: createdDate,
    startDate: startDate,
    endDate: endDate,
    status: status,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_rules(id,payerUrl,rule,description,groupCode,modifiedBy,modifiedDate,createdDate,startDate,endDate,status)
 
    check = PayerRule.where(id: id).update(
    payerUrl: payerUrl,
    rule: rule,
    description: description,
    groupCode: groupCode,
    modifiedBy: modifiedBy,
    modifiedDate: modifiedDate,
    createdDate: createdDate,
    startDate: startDate,
    endDate: endDate,
    status: status,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### PayerDocuments 
def creating_payer_documents(payerUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,attachTo)


  
  PayerDocuments.create(
    
    payerUrl: payerUrl,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    attachTo: attachTo,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_payer_documents(id,payerUrl,file,documentType,documentStatus,description,note,uploadedBy,uploadedDate,attachTo)
    check = PayerDocuments.where(id: id).update(
    payerUrl: payerUrl,
    file: file,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    attachTo: attachTo,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PayerBillRates 
def creating_payer_bill_rates(payerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser)

  
  PayerBillRates.create(
    
    payerUrl: payerUrl,
    serviceCategory: serviceCategory,
    service: service,
    description: description,
    unitOfMeasure: unitOfMeasure,
    payerRate: payerRate,
    allowOverride: allowOverride,
    startDate: startDate,
    revenueCode: revenueCode,
    hcpcCode: hcpcCode,
    agency: agency,
    assessment: assessment,
    endDate: endDate,
    useAgencyChargeAmount: useAgencyChargeAmount,
    chargeAmount: chargeAmount,
    serviceType: serviceType,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    treatmentCodeNeeded: treatmentCodeNeeded,
    unitMultiplier: unitMultiplier,
    incrementalBillingCode: incrementalBillingCode,
    sendBillingDescriptionForEdit: sendBillingDescriptionForEdit,
    evvProgram: evvProgram,
    evvGroupedProcedureCode: evvGroupedProcedureCode,
    lastUpdated: lastUpdated,
    modifyUser: modifyUser,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_payer_bill_rates(id,payerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser)
   
    check = PayerBillRates.where(id: id).update(
     payerUrl: payerUrl,
    serviceCategory: serviceCategory,
    service: service,
    description: description,
    unitOfMeasure: unitOfMeasure,
    payerRate: payerRate,
    allowOverride: allowOverride,
    startDate: startDate,
    revenueCode: revenueCode,
    hcpcCode: hcpcCode,
    agency: agency,
    assessment: assessment,
    endDate: endDate,
    useAgencyChargeAmount: useAgencyChargeAmount,
    chargeAmount: chargeAmount,
    serviceType: serviceType,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    treatmentCodeNeeded: treatmentCodeNeeded,
    unitMultiplier: unitMultiplier,
    incrementalBillingCode: incrementalBillingCode,
    sendBillingDescriptionForEdit: sendBillingDescriptionForEdit,
    evvProgram: evvProgram,
    evvGroupedProcedureCode: evvGroupedProcedureCode,
    lastUpdated: lastUpdated,
    modifyUser: modifyUser,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### PayerBillRates 
def creating_payer_requirements(payerUrl,generalReq_patientLevelOverride,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,clinicalReq_patientLevelOverride,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission, assessmentVisits,physiciansOrders,clinicalNotes,copayRep_patientLevelOverride,
   copayType,copaySplit,billOvertime,miscBilling,eligible,insuredInformation,invoice_patientLevelOverride,invoiceFrequencyOverride,patientLevelOverride,serviceDescription)
  
  PayerRequirements.create(
    
    payerUrl: payerUrl,
    generalReq_patientLevelOverride: generalReq_patientLevelOverride,
    authorizationHash: authorizationHash,
    byDiscipline: byDiscipline,
    byServiceCode: byServiceCode,
    byVisits: byVisits,
    byHours: byHours,
    byAmount: byAmount,
    clinicalReq_patientLevelOverride: clinicalReq_patientLevelOverride,
    oasis: oasis,
    certificationPeriodDays: certificationPeriodDays,
    noticeOfElection: noticeOfElection,
    noticeOfAdmission: noticeOfAdmission,
    assessmentVisits: assessmentVisits,
    physiciansOrders: physiciansOrders,
    clinicalNotes: clinicalNotes,
    copayRep_patientLevelOverride: copayRep_patientLevelOverride,
    copayType: copayType,
    copaySplit: copaySplit,
    billOvertime: billOvertime,
    miscBilling: miscBilling,
    eligible: eligible,
    insuredInformation: insuredInformation,
    invoice_patientLevelOverride: invoice_patientLevelOverride,
    invoiceFrequencyOverride: invoiceFrequencyOverride,
    patientLevelOverride: patientLevelOverride,
    serviceDescription: serviceDescription,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_payer_requirements(id,payerUrl,generalReq_patientLevelOverride,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,clinicalReq_patientLevelOverride,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission, assessmentVisits,physiciansOrders,clinicalNotes,copayRep_patientLevelOverride,
   copayType,copaySplit,billOvertime,miscBilling,eligible,insuredInformation,invoice_patientLevelOverride,invoiceFrequencyOverride,patientLevelOverride,serviceDescription)
  
    check = PayerRequirements.where(id: id).update(
    payerUrl: payerUrl,
    generalReq_patientLevelOverride: generalReq_patientLevelOverride,
    authorizationHash: authorizationHash,
    byDiscipline: byDiscipline,
    byServiceCode: byServiceCode,
    byVisits: byVisits,
    byHours: byHours,
    byAmount: byAmount,
    clinicalReq_patientLevelOverride: clinicalReq_patientLevelOverride,
    oasis: oasis,
    certificationPeriodDays: certificationPeriodDays,
    noticeOfElection: noticeOfElection,
    noticeOfAdmission: noticeOfAdmission,
    assessmentVisits: assessmentVisits,
    physiciansOrders: physiciansOrders,
    clinicalNotes: clinicalNotes,
    copayRep_patientLevelOverride: copayRep_patientLevelOverride,
    copayType: copayType,
    copaySplit: copaySplit,
    billOvertime: billOvertime,
    miscBilling: miscBilling,
    eligible: eligible,
    insuredInformation: insuredInformation,
    invoice_patientLevelOverride: invoice_patientLevelOverride,
    invoiceFrequencyOverride: invoiceFrequencyOverride,
    patientLevelOverride: patientLevelOverride,
    serviceDescription: serviceDescription,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






def creating_patient_payer_requirements(patientPayerUrl,assessmentVisits,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission,physiciansOrders,clinicalNotes,
   copayType,billOvertime,miscBilling,eligible,insuredInformation,invoiceCycle,invoiceType,oasisWbStartDate,supervisoryWbStartDate,serviceDescription,formWbStartDate)
  
  PatientPayerRequirements.create(
    
    patientPayerUrl: patientPayerUrl,
    assessmentVisits: assessmentVisits,
    authorizationHash: authorizationHash,
    byDiscipline: byDiscipline,
    byServiceCode: byServiceCode,
    byVisits: byVisits,
    byHours: byHours,
    byAmount: byAmount,
    oasis: oasis,
    certificationPeriodDays: certificationPeriodDays,
    noticeOfElection: noticeOfElection,
    noticeOfAdmission: noticeOfAdmission,
    physiciansOrders: physiciansOrders,
    clinicalNotes: clinicalNotes,
    copayType: copayType,
    billOvertime: billOvertime,
    miscBilling: miscBilling,
    eligible: eligible,
    insuredInformation: insuredInformation,
    invoiceCycle: invoiceCycle,
    invoiceType: invoiceType,
    oasisWbStartDate: oasisWbStartDate,
    supervisoryWbStartDate: supervisoryWbStartDate,
    serviceDescription: serviceDescription,
    formWbStartDate: formWbStartDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_payer_requirements(id,patientPayerUrl,assessmentVisits,authorizationHash,byDiscipline,
    byServiceCode,byVisits,byHours,byAmount,oasis,certificationPeriodDays,
   noticeOfElection,noticeOfAdmission,physiciansOrders,clinicalNotes,
   copayType,billOvertime,miscBilling,eligible,insuredInformation,invoiceCycle,invoiceType,oasisWbStartDate,supervisoryWbStartDate,serviceDescription,formWbStartDate)
  
    check = PatientPayerRequirements.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    assessmentVisits: assessmentVisits,
    authorizationHash: authorizationHash,
    byDiscipline: byDiscipline,
    byServiceCode: byServiceCode,
    byVisits: byVisits,
    byHours: byHours,
    byAmount: byAmount,
    oasis: oasis,
    certificationPeriodDays: certificationPeriodDays,
    noticeOfElection: noticeOfElection,
    noticeOfAdmission: noticeOfAdmission,
    physiciansOrders: physiciansOrders,
    clinicalNotes: clinicalNotes,
    copayType: copayType,
    billOvertime: billOvertime,
    miscBilling: miscBilling,
    eligible: eligible,
    insuredInformation: insuredInformation,
    invoiceCycle: invoiceCycle,
    invoiceType: invoiceType,
    oasisWbStartDate: oasisWbStartDate,
    supervisoryWbStartDate: supervisoryWbStartDate,
    serviceDescription: serviceDescription,
     formWbStartDate: formWbStartDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PatientVendors 
def creating_patient_vendors(uid,startDate,endDate,sequence,prefered,patientID,vendor,vendorID,vendorType)
  
  PatientVendors.create(
    
    uid: uid,
    startDate: startDate,
    endDate: endDate,
    sequence: sequence,
    prefered: prefered,
    patientID: patientID,
    vendor: vendor,
    vendorID: vendorID,
    vendorType:vendorType,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patient_vendors(id,uid,startDate,endDate,sequence,prefered,patientID,vendor,vendorID,vendorType)  
    check = PatientVendors.where(id: id).update(
      startDate: startDate,
    endDate: endDate,
    sequence: sequence,
    prefered: prefered,
    patientID: patientID,
      vendor: vendor,
    vendorID: vendorID,
    vendorType:vendorType,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end


########### PatientVaccine 
def creating_patient_vaccine(uid,description,datePerformed,patientID,vaccineID)
  
  PatientVaccine.create(
    uid: uid,
    description: description,
    datePerformed: datePerformed,
    patientID: patientID,
    vaccineID: vaccineID,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patient_vaccine(uid,description,datePerformed,patientID,vaccineID)  
    check = PatientVaccine.where(uid: uid).update(
     description: description,
    datePerformed: datePerformed,
    patientID: patientID,
    vaccineID: vaccineID,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PatientVitalSigns 
def creating_patient_vital_signs(uid,description,high,low,patientID,vitalID)
  
  PatientVitalSigns.create(
    
    uid: uid,
    description: description,
    high: high,
    low: low,
    patientID: patientID,
    vitalID: vitalID,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_vital_signs(uid,description,high,low,patientID,vitalID) 
    check = PatientVitalSigns.where(uid: uid).update(
      description: description,
    high: high,
    low: low,
    patientID: patientID,
    vitalID: vitalID,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### PatientAllergies 
def creating_patient_allergies(uid,description,status,startDate,endDate,createdBy,modifiedBy,patientID)


  
  PatientAllergies.create(
        uid: uid,
    description: description,
    status: status,
    startDate: startDate,
    endDate: endDate,
    createdBy: createdBy,
    modifiedBy: modifiedBy,
    patientID: patientID,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_patient_allergies(uid,description,status,startDate,endDate,createdBy,modifiedBy,patientID)

    check = PatientAllergies.where(uid: uid).update(
    description: description,
    status: status,
    startDate: startDate,
    endDate: endDate,
    createdBy: createdBy,
    modifiedBy: modifiedBy,
    patientID: patientID,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






########### PatientAdvanceDirectives 
def creating_patient_advance_directives(uid,file,attachTo,documentType,documentStatus,note,description,patientID,advanceDirective,signedDate)


  
  PatientAdvanceDirectives.create(
    uid: uid,
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    note: note,
    description: description,
    patientID: patientID,
    advanceDirective: advanceDirective,
    signedDate: signedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_patient_advance_directives(uid,file,attachTo,documentType,documentStatus,note,description,patientID,advanceDirective,signedDate)
   check = PatientAdvanceDirectives.where(uid: uid).update(
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    note: note,
    description: description,
    patientID: patientID,
    advanceDirective: advanceDirective,
    signedDate: signedDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### PatientConsent 
def creating_patient_consent(file,attachTo,documentType,documentStatus,note,description,patientID,uploadedBy,notice,signatureDate,infoSource,infoSourceDate,signatureSource,signatureSourceDate)


  
  PatientConsent.create(
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    note: note,
    description: description,
    patientID: patientID,
    uploadedBy: uploadedBy,
    notice: notice,
    signatureDate: signatureDate,
    infoSource: infoSource,
    infoSourceDate: infoSourceDate,
    signatureSource: signatureSource,
    signatureSourceDate: signatureSourceDate,
    created_at: Time.new.strftime('%F %R'),
  )
end



def get_update_patient_consent(id,file,attachTo,documentType,documentStatus,note,description,patientID,uploadedBy,notice,signatureDate,infoSource,infoSourceDate,signatureSource,signatureSourceDate)

   check = PatientConsent.where(id: id).update(
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    note: note,
    description: description,
    patientID: patientID,
    uploadedBy: uploadedBy,
    notice: notice,
    signatureDate: signatureDate,
    infoSource: infoSource,
    infoSourceDate: infoSourceDate,
    signatureSource: signatureSource,
    signatureSourceDate: signatureSourceDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PatientDme 
def creating_patient_dme(uid,vendor,deliveryDate,returnDate,comment,patientID,description)

  
  PatientDme.create(
    
    uid: uid,
    vendor: vendor,
    deliveryDate: deliveryDate,
    returnDate: returnDate,
    comment: comment,
    patientID: patientID,
    description: description,
   
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_dme(uid,vendor,deliveryDate,returnDate,comment,patientID,description)
   check = PatientDme.where(uid: uid).update(
    vendor: vendor,
    deliveryDate: deliveryDate,
    returnDate: returnDate,
    comment: comment,
    patientID: patientID,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### PayerIdentifiers 
def creating_payer_identifiers(payerUrl,agencyUrl,identifierType,identifierValue,startDate,endDate)


  
  PayerIdentifiers.create(
    
    payerUrl: payerUrl,
    agencyUrl: agencyUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
   
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_identifiers(id,payerUrl,agencyUrl,identifierType,identifierValue,startDate,endDate)

   check = PayerIdentifiers.where(id: id).update(
     payerUrl: payerUrl,
    agencyUrl: agencyUrl,
    identifierType: identifierType,
    identifierValue: identifierValue,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### PayerInvoiceReviews 
def creating_payer_invoice_reviews(payerUrl,title,startDate,endDate)

  
  PayerInvoiceReviews.create(
    
    payerUrl: payerUrl,
    title: title,
    startDate: startDate,
    endDate: endDate,
   
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_invoice_reviews(id,payerUrl,title,startDate,endDate)

   check = PayerInvoiceReviews.where(id: id).update(
      payerUrl: payerUrl,
    title: title,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






########### PayerHcpc 
def creating_payer_hcpc(payerUrl,placeOfService,serviceCode,hcpcCode,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,startDate,endDate)
 
  PayerHcpc.create(
    
    payerUrl: payerUrl,
    placeOfService: placeOfService,
    serviceCode: serviceCode,
    hcpcCode: hcpcCode,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    startDate: startDate,
    endDate: endDate,
   
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_hcpc(id,payerUrl,placeOfService,serviceCode,hcpcCode,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,startDate,endDate)

   check = PayerHcpc.where(id: id).update(
     payerUrl: payerUrl,
    placeOfService: placeOfService,
    serviceCode: serviceCode,
    hcpcCode: hcpcCode,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PayerCarrierCode 
def creating_payer_carrier_code(payerUrl,relationalPayer,carrierCode,startDate,endDate)
  PayerCarrierCode.create(
    
    payerUrl: payerUrl,
    relationalPayer: relationalPayer,
    carrierCode: carrierCode,
    startDate: startDate,
    endDate: endDate,
   
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_payer_carrier_code(id,payerUrl,relationalPayer,carrierCode,startDate,endDate)
   check = PayerCarrierCode.where(id: id).update(
   payerUrl: payerUrl,
    relationalPayer: relationalPayer,
    carrierCode: carrierCode,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### creating_inactive_reason_types 
def creating_inactive_reason_types(organizationUrl,code,description,groupCode,sortOrder,startDate,endDate)

 
  AssLookupInactiveReasonTypes.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_inactive_reason_types(id,organizationUrl,code,description,groupCode,sortOrder,startDate,endDate)
   check = AssLookupInactiveReasonTypes.where(id: id).update(
 organizationUrl: organizationUrl,
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_inactive_reason_types 
def creating_discipline_types(organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
    allowConnectionToPhysician,assessmentGroup,payCode)
 
  AssLookupDisciplineTypes.create(
    
    organizationUrl: organizationUrl,
    disciplineCode: disciplineCode,
    description: description,
    serviceCategoryCode: serviceCategoryCode,
    orderDisciplineCode: orderDisciplineCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    allowConnectionToPhysician: allowConnectionToPhysician,
    assessmentGroup: assessmentGroup, 
    payCode: payCode,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_discipline_types(id,organizationUrl,disciplineCode,description,serviceCategoryCode,orderDisciplineCode,sortOrder,startDate,endDate,
    allowConnectionToPhysician,assessmentGroup,payCode)
  
   check = AssLookupDisciplineTypes.where(id: id).update(
 organizationUrl: organizationUrl,
    disciplineCode: disciplineCode,
    description: description,
    serviceCategoryCode: serviceCategoryCode,
    orderDisciplineCode: orderDisciplineCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    allowConnectionToPhysician: allowConnectionToPhysician,
    assessmentGroup: assessmentGroup, 
    payCode: payCode,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### creating_inactive_reason_types 
def creating_notes(noteType,payer,followUpDate,note)
 
  Notes.create(
    
    noteType: noteType,
    payer: payer,
    followUpDate: followUpDate,
    note: note,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_notes(id,noteType,payer,followUpDate,note)
  
   check = Notes.where(id: id).update(
  noteType: noteType,
    payer: payer,
    followUpDate: followUpDate,
    note: note,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end







########### creating_lookup_deductions 
def creating_lookup_deductions(organizationUrl,isRecurring,description,isPretax,calculation,coverage,groupCode,sortOrder,
    startDate,endDate)
 
  AssLookupDeductions.create(
    
    organizationUrl: organizationUrl,
    isRecurring: isRecurring,
    description: description,
    isPretax: isPretax,
    calculation: calculation,
    coverage: coverage,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_lookup_deductions(id,organizationUrl,isRecurring,description,isPretax,calculation,coverage,groupCode,sortOrder,
    startDate,endDate)
  
   check = AssLookupDeductions.where(id: id).update(
    organizationUrl: organizationUrl,
    isRecurring: isRecurring,
    description: description,
    isPretax: isPretax,
    calculation: calculation,
    coverage: coverage,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_lookup_deductions 
def creating_lookup_noteType(organizationUrl,code,description,doNotGenerateWbTask,groupCode,sortOrder,
    startDate,endDate)
 
  AssLookupNoteType.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    doNotGenerateWbTask: doNotGenerateWbTask,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_lookup_noteType(id,organizationUrl,code,description,doNotGenerateWbTask,groupCode,sortOrder,
    startDate,endDate)
  
   check = AssLookupNoteType.where(id: id).update(
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    doNotGenerateWbTask: doNotGenerateWbTask,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate,  
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_lookup_deductions 
def creating_lookup_contractorCompanies(organizationUrl,name,phone)
 
  AssLookupcontractorCompanies.create(
    
    organizationUrl: organizationUrl,
    name: name,
    phone: phone,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_lookup_contractorCompanies(id,organizationUrl,name,phone)
  
   check = AssLookupcontractorCompanies.where(id: id).update(
     organizationUrl: organizationUrl,
    name: name,
    phone: phone, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_lookup_deductions 
def creating_lookup_compliance(organizationUrl,name,description,category,appliesTo,requiredForScheduling,dateType,
    startDate,endDate,complianceDisciplines)
 
  AssLookupCompliance.create(
    
    organizationUrl: organizationUrl,
    name: name,
    description: description,
    category: category,
    appliesTo: appliesTo,
    requiredForScheduling: requiredForScheduling,
    dateType: dateType,
    startDate: startDate,
    endDate: endDate,
    complianceDisciplines: complianceDisciplines,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_lookup_compliance(id,organizationUrl,name,description,category,appliesTo,requiredForScheduling,dateType,
    startDate,endDate,complianceDisciplines)
  
   check = AssLookupCompliance.where(id: id).update(
      organizationUrl: organizationUrl,
      name: name,
    description: description,
    category: category,
    appliesTo: appliesTo,
    requiredForScheduling: requiredForScheduling,
    dateType: dateType,
    startDate: startDate,
    endDate: endDate,
    complianceDisciplines: complianceDisciplines,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### creating_lookup_licenseType 
def creating_lookup_licenseType(organizationUrl,description,code,groupCode,requiredForScheduling,sortOrder,
    startDate,endDate)
 
  AssLookupLicenseType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    requiredForScheduling: requiredForScheduling,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_lookup_licenseType(id,organizationUrl,description,code,groupCode,requiredForScheduling,sortOrder,
    startDate,endDate)
  
   check = AssLookupLicenseType.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    requiredForScheduling: requiredForScheduling,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_lookup_schedulingRankType 
def creating_lookup_schedulingRankType(organizationUrl,description,
    startDate,endDate)
 
  AssLookupSchedulingRankType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def    get_update_lookup_schedulingRankType(id,organizationUrl,description,
    startDate,endDate)
  
   check = AssLookupSchedulingRankType.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_arlookup_hcpcModifierTypes 
def creating_arlookup_hcpcModifierTypes(organizationUrl,description,hcpcModifierCodes,groupCode,sortOrder,
    startDate,endDate)
 
  ArLookupHcpcModifierType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    hcpcModifierCodes: hcpcModifierCodes,
    startDate: startDate,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_arlookup_hcpcModifierTypes(id,organizationUrl,description,hcpcModifierCodes,groupCode,sortOrder,
    startDate,endDate)
  
   check = ArLookupHcpcModifierType.where(id: id).update(
     organizationUrl: organizationUrl,
    description: description,
    hcpcModifierCodes: hcpcModifierCodes,
    startDate: startDate,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_arlookup_paymentSources 
def creating_arlookup_paymentSources(organizationUrl,paymentSource,paymentMethod)
 
  ArLookupPaymentSources.create(
    
    organizationUrl: organizationUrl,
    paymentSource: paymentSource,
    paymentMethod: paymentMethod,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_arlookup_payment_sources(id,organizationUrl,paymentSource,paymentMethod)
  
   check = ArLookupPaymentSources.where(id: id).update(
      organizationUrl: organizationUrl,
    paymentSource: paymentSource,
    paymentMethod: paymentMethod,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end


########### creating_arlookup_eraReasonType 
def creating_arlookup_eraReasonType(organizationUrl,eraReasonCode,arAdjustmentReason,adjustmentLevel,
    startDate,endDate)
 
  ArLookupEraReasonType.create(
    
    organizationUrl: organizationUrl,
    eraReasonCode: eraReasonCode,
    arAdjustmentReason: arAdjustmentReason,
    adjustmentLevel: adjustmentLevel,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_arlookup_eraReasonType(id,organizationUrl,eraReasonCode,arAdjustmentReason,adjustmentLevel,
    startDate,endDate)
  
   check = ArLookupEraReasonType.where(id: id).update(
     eraReasonCode: eraReasonCode,
    arAdjustmentReason: arAdjustmentReason,
    adjustmentLevel: adjustmentLevel,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




####Service Facility

def creating_patient_service_facilities(uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt)

  PatientServiceFacility.create(
    uid: uid,
    patientID: patientID,
    facilityUrl: facilityUrl,
    placeOfService: placeOfService,
    startDate: startDate,
    endDate: endDate,
    organizationUrl: organizationUrl,
    admitDate: admitDate,
    dischargeDate: dischargeDate,
    comment: comment,
    isLastFacilityStayedAt: isLastFacilityStayedAt,
    created_at: Time.new.strftime('%F %R'),
  )
end

def   get_update_patient_service_facilities(uid,patientID,facilityUrl,placeOfService,startDate,endDate,organizationUrl,admitDate,dischargeDate,comment,isLastFacilityStayedAt)

   check = PatientServiceFacility.where(uid: uid).update(
   patientID: patientID,
    facilityUrl: facilityUrl,
    placeOfService: placeOfService,
    startDate: startDate,
    endDate: endDate,
    organizationUrl: organizationUrl,
    admitDate: admitDate,
    dischargeDate: dischargeDate,
    comment: comment,
    isLastFacilityStayedAt: isLastFacilityStayedAt,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end








########### creating_lookup_licenseType 
def creating_lookup_invoice_note_type(organizationUrl,description,code,groupCode,generateWorkflow,followupDays,sortOrder,
    startDate,endDate)
 
  ArLookupInvoiceNoteType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    generateWorkflow: generateWorkflow,
    followupDays: followupDays,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_lookup_invoice_note_type(id,organizationUrl,description,code,groupCode,generateWorkflow,followupDays,sortOrder,
    startDate,endDate)
  
   check = ArLookupInvoiceNoteType.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    generateWorkflow: generateWorkflow,
    followupDays: followupDays,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### creating_physician_orders_suggested_text 
def creating_physician_orders_suggested_text(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  PhysicianOrdersSuggestedText.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_physician_orders_suggested_text(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = PhysicianOrdersSuggestedText.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PhysicianOrdersQuickPickTypes 
def creating_physician_orders_quick_pick_types(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  PhysicianOrdersQuickPickTypes.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_physician_orders_quick_pick_types(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = PhysicianOrdersQuickPickTypes.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### PhysicianOrdersQuickPickTypes 
def creating_oasis_void_reason_type(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  OasisVoidReasonType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_oasis_void_reason_type(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = OasisVoidReasonType.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### CareNeedTaskActionResponse 
def creating_care_need_task_action_response(organizationUrl,description,groupCode,sortOrder,
    startDate,endDate)
 
  CareNeedTaskActionResponse.create(
    
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_care_need_task_action_response(id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate)
  
   check = CareNeedTaskActionResponse.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### Vaccines 
def creating_vaccines(organizationUrl,description,groupCode,sortOrder,
    startDate,endDate)
 
  Vaccines.create(
    
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_vaccines(id,organizationUrl,description,groupCode,sortOrder,
    startDate,endDate)
  
   check = Vaccines.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### GoalStatusTypes 
def creating_goal_status_types(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  GoalStatusTypes.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_goal_status_types(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = GoalStatusTypes.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






########### CareNeedLevels 
def creating_care_need_levels(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  CareNeedLevels.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_care_need_levels(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = CareNeedLevels.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### CareNeedLevels 
def creating_medication_administered_by_type(organizationUrl,description,code,
    startDate,endDate)
 
  MedicationAdministeredByType.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_medication_administered_by_type(id,organizationUrl,description,code,
    startDate,endDate)
  
   check = MedicationAdministeredByType.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_vital_type 
def creating_vital_type(organizationUrl,vitalDescription,lowValue,highValue,matchingCode,
    startDate,endDate)
 
  VitalType.create(
    
    organizationUrl: organizationUrl,
    vitalDescription: vitalDescription,
    lowValue: lowValue,
    highValue: highValue,
    matchingCode: matchingCode,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_vital_type(id,organizationUrl,vitalDescription,lowValue,highValue,matchingCode,
    startDate,endDate)
  
   check = VitalType.where(id: id).update(
    organizationUrl: organizationUrl,
    vitalDescription: vitalDescription,
    lowValue: lowValue,
    highValue: highValue,
    matchingCode: matchingCode,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### creating_wound_area 
def creating_wound_area(organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate)
 
  WoundArea.create(
    
    organizationUrl: organizationUrl,
    woundAreaCode: woundAreaCode,
    woundAreaName: woundAreaName,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_wound_area(id,organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate)
  
   check = WoundArea.where(id: id).update(
   organizationUrl: organizationUrl,
    woundAreaCode: woundAreaCode,
    woundAreaName: woundAreaName,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### creating_wound_area 
def creating_wound_area(organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate)
 
  WoundArea.create(
    
    organizationUrl: organizationUrl,
    woundAreaCode: woundAreaCode,
    woundAreaName: woundAreaName,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_wound_area(id,organizationUrl,woundAreaCode,woundAreaName,groupCode,sortOrder,
    startDate,endDate)
  
   check = WoundArea.where(id: id).update(
   organizationUrl: organizationUrl,
    woundAreaCode: woundAreaCode,
    woundAreaName: woundAreaName,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



########### ReferralSourceNotes 
def creating_referral_source_notes(referralSourceUid,date,noteBy,noteType,document,note,active,updatedBy)
 
  ReferralSourceNotes.create(   
    referralSourceUid: referralSourceUid,
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_referral_source_notes(id,referralSourceUid,date,noteBy,noteType,document,note,active,updatedBy)

  
   check = ReferralSourceNotes.where(id: id).update(
    date: date,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    updatedBy: updatedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




########### ReferralSourceAncillaryPhone 
def creating_referral_source_ancillary_phone(referralSourceUid,phoneType,phone,description)
  ReferralSourceAncillaryPhone.create(   
    referralSourceUid: referralSourceUid,
    phoneType: phoneType,
    phone: phone,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_ancillary_phone(id,referralSourceUid,phoneType,phone,description)
  
   check = ReferralSourceAncillaryPhone.where(id: id).update(
    phoneType: phoneType,
    phone: phone,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





########### creating_ar_lookup_agency_payment_types 
def creating_ar_lookup_agency_payment_types(organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
 
  ArLookupAgencyPaymentTypes.create(
    
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_arlookup_agency_payment_type(id,organizationUrl,description,code,groupCode,sortOrder,
    startDate,endDate)
  
   check = ArLookupAgencyPaymentTypes.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    code: code,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_ar_adjustment_reason_type(organizationUrl,code,description,arSubcategory,allowForGross,groupCode,sortOrder,
    startDate,endDate)
 
  ArAdjustmentReasonType.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    arSubcategory: arSubcategory,
    allowForGross: allowForGross,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_ar_adjustment_reason_type(id,organizationUrl,code,description,arSubcategory,allowForGross,groupCode,sortOrder,
    startDate,endDate)
  
   check = ArAdjustmentReasonType.where(id: id).update(
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    arSubcategory: arSubcategory,
    allowForGross: allowForGross,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






def creating_assessment_void_reason_type(organizationUrl,code,description,followupDays,generateWorkflow,groupCode,sortOrder,
    startDate,endDate) 
 
  AssessmentVoidReasonType.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    followupDays: followupDays,
    generateWorkflow: generateWorkflow,
    groupCode: groupCode, 
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_assessment_void_reason_type(id,organizationUrl,code,description,followupDays,generateWorkflow,groupCode,sortOrder,
    startDate,endDate)
  
   check = AssessmentVoidReasonType.where(id: id).update(
     organizationUrl: organizationUrl,
    code: code,
    description: description,
    followupDays: followupDays,
    generateWorkflow: generateWorkflow,
    groupCode: groupCode,
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_care_needs(organizationUrl,restrictToAgencyType,description,groupCode,sortOrder,
    startDate,endDate)
 
  CareNeeds.create(
    
    organizationUrl: organizationUrl,
    restrictToAgencyType: restrictToAgencyType,
    description: description,
    groupCode: groupCode, 
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_care_needs(id,organizationUrl,restrictToAgencyType,description,groupCode,sortOrder,
    startDate,endDate)
  
   check = CareNeeds.where(id: id).update(
    organizationUrl: organizationUrl,
    restrictToAgencyType: restrictToAgencyType,
    description: description,
    groupCode: groupCode, 
    sortOrder: sortOrder, 
    endDate: endDate,
    startDate: startDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_care_plan_prognosis(organizationUrl,code,description,useOnCarePlan,sortOrder)
 
  CarePlanPrognosis.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    useOnCarePlan: useOnCarePlan, 
    sortOrder: sortOrder,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_care_plan_prognosis(id,organizationUrl,code,description,useOnCarePlan,sortOrder)
  
   check = CarePlanPrognosis.where(id: id).update(
     organizationUrl: organizationUrl,
    code: code,
    description: description,
    useOnCarePlan: useOnCarePlan, 
    sortOrder: sortOrder, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_case_communication_descriptions(organizationUrl,prefix,description,suffix,startDate,endDate)

  CaseCommunicationDescriptions.create(
    
    organizationUrl: organizationUrl,
    prefix: prefix,
    description: description,
    suffix: suffix, 
    startDate: startDate, 
     endDate: endDate,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_case_communication_descriptions(id,organizationUrl,prefix,description,suffix,startDate,endDate)
  
   check = CaseCommunicationDescriptions.where(id: id).update(
      organizationUrl: organizationUrl,
    prefix: prefix,
    description: description,
    suffix: suffix, 
    startDate: startDate, 
     endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_goals(organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType)

 
  Goals.create(
    
    organizationUrl: organizationUrl,
    relatedToCn: relatedToCn,
    description: description,
    disciplineCode: disciplineCode, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     responseRequired: responseRequired,
     restrictToAgencyType: restrictToAgencyType,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_goals(id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType)
   check = Goals.where(id: id).update(

      organizationUrl: organizationUrl,
    relatedToCn: relatedToCn,
    description: description,
    disciplineCode: disciplineCode, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     responseRequired: responseRequired,
     restrictToAgencyType: restrictToAgencyType,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_interventions(organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType)

 
  Interventions.create(
    
    organizationUrl: organizationUrl,
    relatedToCn: relatedToCn,
    description: description,
    disciplineCode: disciplineCode, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     responseRequired: responseRequired,
     restrictToAgencyType: restrictToAgencyType,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_interventions(id,organizationUrl,relatedToCn,description,disciplineCode,groupCode,sortOrder,startDate,endDate,responseRequired,restrictToAgencyType)
  

   check = Interventions.where(id: id).update(
    
      organizationUrl: organizationUrl,
    relatedToCn: relatedToCn,
    description: description,
    disciplineCode: disciplineCode, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     responseRequired: responseRequired,
     restrictToAgencyType: restrictToAgencyType,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_quick_pick_medications(organizationUrl,medicationName,dosage,frequency,route,groupCode,sortOrder,startDate,endDate)

 
  QuickPickMedications.create(
    
    organizationUrl: organizationUrl,
    medicationName: medicationName,
    dosage: dosage,
    frequency: frequency,
    route: route, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_quick_pick_medications(id,organizationUrl,medicationName,dosage,frequency,route,groupCode,sortOrder,startDate,endDate)

   check = QuickPickMedications.where(id: id).update(
    
    organizationUrl: organizationUrl,
    medicationName: medicationName,
    dosage: dosage,
    frequency: frequency,
    route: route, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end


def creating_medication_kits(organizationUrl,medicationKit,description,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,medType)

  MedicationKits.create(
    
    organizationUrl: organizationUrl,
    medicationKit: medicationKit,
    description: description,
    dosage: dosage,
    frequency: frequency,
    route: route, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     medType: medType,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_medication_kits(id,organizationUrl,medicationKit,description,dosage,frequency,route,groupCode,sortOrder,startDate,endDate,medType)

   check = MedicationKits.where(id: id).update(
    
   organizationUrl: organizationUrl,
    medicationKit: medicationKit,
    description: description,
    dosage: dosage,
    frequency: frequency,
    route: route, 
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate, 
     endDate: endDate,  
     medType: medType,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_supervisory_due_day(organizationUrl,agencyUrl,payerUrl,agencyType,serviceCategory,code,supervisoryDueDays,autoGenerate,service)


  SupervisoryDueDay.create(
    
    organizationUrl: organizationUrl,
    agencyUrl: agencyUrl,
    payerUrl: payerUrl,
    agencyType: agencyType,
    serviceCategory: serviceCategory,
    code: code, 
    supervisoryDueDays: supervisoryDueDays,
    autoGenerate: autoGenerate,
    service: service, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_supervisory_due_day(id,organizationUrl,agencyUrl,payerUrl,agencyType,serviceCategory,code,supervisoryDueDays,autoGenerate,service)

   check = SupervisoryDueDay.where(id: id).update(
   organizationUrl: organizationUrl,
    agencyUrl: agencyUrl,
    payerUrl: payerUrl,
    agencyType: agencyType,
    serviceCategory: serviceCategory,
    code: code, 
    supervisoryDueDays: supervisoryDueDays,
    autoGenerate: autoGenerate,
    service: service, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end






def creating_patient_certifications(patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,service_status)

  PatientCertifications.create(
    
    patientUid: patientUid,
    certFrom: certFrom,
    spanDays: spanDays,
    certTo: certTo,
    certType: certType,
    status: status, 
    info: info,
    associate: associate,
    physician: physician,
    sent: sent, 
    received: received,
    ftfSent: ftfSent,
    ftfVisit: ftfVisit,
    patientPayer: patientPayer,
    service_status: service_status,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patient_certifications(id,patientUid,certFrom,spanDays,certTo,certType,status,info,associate,physician,
    sent,received,ftfSent,ftfVisit,patientPayer,service_status)

   check = PatientCertifications.where(id: id).update(
    patientUid: patientUid,
    certFrom: certFrom,
    spanDays: spanDays,
    certTo: certTo,
    certType: certType,
    status: status, 
    info: info,
    associate: associate,
    physician: physician,
    sent: sent, 
    received: received,
    ftfSent: ftfSent,
    ftfVisit: ftfVisit,
    patientPayer: patientPayer,
    service_status: service_status,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_referralSourceAddressPhoneInfo(referralSourceUid,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
   
  ReferralSourceAddressPhoneInfo.create(
    
    referralSourceUid: referralSourceUid,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_referralSourceAddressPhoneInfo(id,referralSourceUid,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
    puts "------------------UPDATING STATUS ------------------"
   
    check = ReferralSourceAddressPhoneInfo.where(id: id).update(
    referralSourceUid: referralSourceUid,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end




def creating_patient_forms(uid,patientID,formType,agency,status,revisedBy,performedBy,payload,organizationUrl,formName,agencySignature,patientSignature,signedBy)   
  
  PatientForm.create(
    
    uid: uid,
    patientID: patientID,
    formType: formType,
    agency: agency,
    status: status,
    revisedBy: revisedBy,
    performedBy: performedBy,
    payload: payload,
    organizationUrl: organizationUrl,
    formName: formName,
    agencySignature: agencySignature,
    patientSignature: patientSignature,
    signedBy: signedBy,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patientForms(uid,patientID,formType,agency,status,revisedBy,performedBy,payload,organizationUrl,formName,agencySignature,patientSignature,signedBy) 

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientForm.where(uid: uid).update(
    patientID: patientID,
    formType: formType,
    agency: agency,
    status: status,
    revisedBy: revisedBy,
    performedBy: performedBy,
    payload: payload,
    organizationUrl: organizationUrl,
    formName: formName,
    agencySignature: agencySignature,
    patientSignature: patientSignature,
    signedBy: signedBy,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_patient_documents(uid,patientID,file,relatedTo,status,documentType,description,uploadedBy,organizationUrl)
 
  PatientDocument.create(
    
    uid: uid,
    patientID: patientID,
    file: file,
    relatedTo: relatedTo,
    status: status,
    documentType: documentType,
    description: description,
    uploadedBy: uploadedBy,
    organizationUrl: organizationUrl,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_documents(uid,patientID,file,relatedTo,status,documentType,description,uploadedBy,organizationUrl) 

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientDocument.where(uid: uid).update(
    patientID: patientID,
    file: file,
    relatedTo: relatedTo,
    status: status,
    documentType: documentType,
    description: description,
    uploadedBy: uploadedBy,
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_patient_medications(uid,entryType,description,dosage,dosageAndFrequency,route,quantity,
    startDate,endDate,medicationType,prescribedBy,administeredBy,reasonForMedication,pharmacy,physicianNotified,approvedBy,
    createInterimCare,effectiveDate,patientID,organizationUrl,idx) 

  PatientMedication.create(
    
  uid: uid,
  entryType: entryType,
  description:  description,
  dosage: dosage,
  dosageAndFrequency: dosageAndFrequency,
  route: route,
  quantity: quantity,
  startDate: startDate,
  endDate: endDate,
  medicationType: medicationType,
  prescribedBy: prescribedBy,
  administeredBy: administeredBy,
  reasonForMedication: reasonForMedication,
  pharmacy: pharmacy,
  physicianNotified: physicianNotified,
  approvedBy: approvedBy,
  createInterimCare: createInterimCare,
  effectiveDate: effectiveDate,
  patientID: patientID,
  organizationUrl: organizationUrl,
  idx: idx,
  created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_medications(uid,entryType,description,dosage,dosageAndFrequency,route,quantity,
    startDate,endDate,medicationType,prescribedBy,administeredBy,reasonForMedication,pharmacy,physicianNotified,approvedBy,
    createInterimCare,effectiveDate,patientID,organizationUrl,idx)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientMedication.where(uid: uid).update(
   entryType: entryType,
  description:  description,
  dosage: dosage,
  dosageAndFrequency: dosageAndFrequency,
  route: route,
  quantity: quantity,
  startDate: startDate,
  endDate: endDate,
  medicationType: medicationType,
  prescribedBy: prescribedBy,
  administeredBy: administeredBy,
  reasonForMedication: reasonForMedication,
  pharmacy: pharmacy,
  physicianNotified: physicianNotified,
  approvedBy: approvedBy,
  createInterimCare: createInterimCare,
  effectiveDate: effectiveDate,
  patientID: patientID,
  organizationUrl: organizationUrl,
  idx: idx,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_patient_payers(url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber,relationship)

  PatientPayer.create(

  url: url,
  payerUrl: payerUrl,
  patientUid: patientUid,
  sequence:  sequence,
  startDate: startDate,
  endDate: endDate,
  billToAddress: billToAddress,
  contact: contact,
  idNumber: idNumber,
  accidentRelatedCause: accidentRelatedCause,
  dischargeReason: dischargeReason,
  dischargeDate: dischargeDate,
  holdBillingDateAfter: holdBillingDateAfter,
  groupName: groupName,
  groupNumber: groupNumber,
  relationship: relationship,
  created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patient_payers(url,payerUrl,patientUid,sequence,startDate,endDate,billToAddress,contact,
    idNumber,accidentRelatedCause,dischargeReason,dischargeDate,holdBillingDateAfter,groupName,groupNumber, relationship)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientPayer.where(url: url).update(
    payerUrl: payerUrl,
  patientUid: patientUid,
  sequence:  sequence,
  startDate: startDate,
  endDate: endDate,
  billToAddress: billToAddress,
  contact: contact,
  idNumber: idNumber,
  accidentRelatedCause: accidentRelatedCause,
  dischargeReason: dischargeReason,
  dischargeDate: dischargeDate,
  holdBillingDateAfter: holdBillingDateAfter,
  groupName: groupName,
  groupNumber: groupNumber,
  relationship: relationship,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end






def creating_general_support_time_range(organizationUrl,category,time_from,time_to,startDate,endDate,sort)

  GeneralSupportTimeRange.create(
    
  organizationUrl: organizationUrl,
  category: category,
  time_from:  time_from,
  time_to: time_to,
  startDate: startDate,
  endDate: endDate,
  sort: sort,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_general_support_time_range(id,organizationUrl,category,time_from,time_to,startDate,endDate,sort)

   puts "------------------UPDATING STATUS ------------------"
   
    check = GeneralSupportTimeRange.where(id: id).update(
     organizationUrl: organizationUrl,
  category: category,
  time_from:  time_from,
  time_to: time_to,
  startDate: startDate,
  endDate: endDate,
  sort: sort,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_general_support_teams(organizationUrl,description,groupCode,sortOrder,startDate,endDate)

  GeneralSupportTeams.create(
    
  organizationUrl: organizationUrl,
  description:  description,
  groupCode: groupCode,
  sortOrder: sortOrder,
  startDate: startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_general_support_teams(id,organizationUrl,description,groupCode,sortOrder,startDate,endDate)

   puts "------------------UPDATING STATUS ------------------"
   
    check = GeneralSupportTeams.where(id: id).update(
   organizationUrl: organizationUrl,
  description:  description,
  groupCode: groupCode,
  sortOrder: sortOrder,
  startDate: startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end


def creating_patient_disaster_plan(uid,patientID,plan,details,organizationUrl,planID)

  PatientDisasterPlan.create(
    
  uid: uid,
  patientID: patientID,
  plan:  plan,
  details: details,
  organizationUrl: organizationUrl,
  planID: planID,
  created_at: Time.new.strftime('%F %R'),
  )
end


def  get_patient_disaster_plan(uid,patientID,plan,details,organizationUrl,planID)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientDisasterPlan.where(uid: uid).update(
  patientID: patientID,
  plan:  plan,
  details: details,
  organizationUrl: organizationUrl,
  planID: planID,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_patient_messages(agency,team,discipline,associate,message_to,message_from,message,createdDate,sentDate,patientID,uid,associates,status)

  PatientMessage.create(
    
  agency: agency,
  team: team,
  discipline:  discipline,
  associate: associate,
  message_to: message_to,
  message_from: message_from,
  message: message,
  createdDate: createdDate,
  sentDate: sentDate,
  patientID:patientID,
  uid: uid,
  associates: associates,
  status: status,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   update_patient_messages(id,agency,team,discipline,associate,message_to,message_from,message,createdDate,sentDate,patientID,uid,associates,status)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientMessage.where(id: id).update(
 agency: agency,
  team: team,
  discipline:  discipline,
  associate: associate,
  message_to: message_to,
  message_from: message_from,
  message: message,
  createdDate: createdDate,
  sentDate: sentDate,
   patientID:patientID,
  uid: uid,
  associates: associates,
  status: status,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_patient_services(uid,patientID,serviceID,serviceNoteType,assessmentType,status,createdBy,revisedBy,serviceProvidedBy,
    timeIn,timeOut,qaStatus,serviceCode)

  PatientService.create(
    
  uid: uid,
  patientID: patientID,
  serviceID:  serviceID,
  serviceNoteType: serviceNoteType,
  assessmentType: assessmentType,
  status: status,
  createdBy: createdBy,
  revisedBy: revisedBy,
  serviceProvidedBy: serviceProvidedBy,
  timeIn: timeIn,
  timeOut: timeOut,
  qaStatus: qaStatus,
  serviceCode: serviceCode,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   update_patient_services(uid,patientID,serviceID,serviceNoteType,assessmentType,status,createdBy,revisedBy,serviceProvidedBy,
    timeIn,timeOut,qaStatus,serviceCode)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientService.where(uid: uid).update(
  patientID: patientID,
  serviceID:  serviceID,
  serviceNoteType: serviceNoteType,
  assessmentType: assessmentType,
  status: status,
  createdBy: createdBy,
  revisedBy: revisedBy,
  serviceProvidedBy: serviceProvidedBy,
  timeIn: timeIn,
  timeOut: timeOut,
  qaStatus: qaStatus,
  serviceCode: serviceCode,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_patient_programs(uid,patientID,programeID,createdAt,startDate,endDate)

  PatientProgram.create(
    
  uid: uid,
  patientID: patientID,
  programeID:  programeID,
  createdAt: createdAt,
  startDate: startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   update_patient_programs(uid,patientID,programeID,createdAt,startDate,endDate)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientProgram.where(uid: uid).update(
  patientID: patientID,
  programeID:  programeID,
  createdAt: createdAt,
  startDate: startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_patient_clinical_team(uid,patientID,associateUrl,createdAt,clinicalManagerUrl,isPrimaryForDiscipline,members)

  PatientClinicalTeam.create(
    
  uid: uid,
  patientID: patientID,
  associateUrl:  associateUrl,
  createdAt: createdAt,
  clinicalManagerUrl: clinicalManagerUrl,
  isPrimaryForDiscipline: isPrimaryForDiscipline,
  members: members,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   update_patient_clinical_team(uid,patientID,associateUrl,createdAt,clinicalManagerUrl,isPrimaryForDiscipline,members)

   puts "------------------UPDATING STATUS ------------------"
   
    check = PatientClinicalTeam.where(uid: uid).update(
  patientID: patientID,
  associateUrl:  associateUrl,
  createdAt: createdAt,
  clinicalManagerUrl: clinicalManagerUrl,
  isPrimaryForDiscipline: isPrimaryForDiscipline,
  members: members,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_patient_clinical_manager(uid,patientID,caseManagerUrl,createdAt,clinicalManagerUrl)
  PatientClinicalManager.create(
    
  uid: uid,
  patientID: patientID,
  caseManagerUrl:  caseManagerUrl,
  createdAt: createdAt,
  clinicalManagerUrl: clinicalManagerUrl,
  created_at: Time.new.strftime('%F %R'),
  )
end


def   update_patient_clinical_manager(uid,patientID,caseManagerUrl,createdAt,clinicalManagerUrl)

   
    check = PatientClinicalManager.where(uid: uid).update(
 
  patientID: patientID,
  caseManagerUrl:  caseManagerUrl,
  createdAt: createdAt,
  clinicalManagerUrl: clinicalManagerUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end


def creating_patient_status_history(patientID,priorStatus,newStatus,holdStart,holdEnd,
    facilityID,associateUrl,holdReason,createdAt)

PatientStatusHistory.create(
    
  patientID: patientID,
  priorStatus:  priorStatus,
  newStatus:  newStatus,
  holdStart:  holdStart,
  holdEnd:  holdEnd,
  facilityID:  facilityID,
  associateUrl:  associateUrl,
  holdReason:  holdReason,
  createdAt: createdAt,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_patient_status_history(id,patientID,priorStatus,newStatus,holdStart,holdEnd,
    facilityID,associateUrl,holdReason,createdAt)
   
    check = PatientStatusHistory.where(id: id).update(
 
  patientID: patientID,
  priorStatus:  priorStatus,
  newStatus:  newStatus,
  holdStart:  holdStart,
  holdEnd:  holdEnd,
  facilityID:  facilityID,
  associateUrl:  associateUrl,
  holdReason:  holdReason,
  createdAt: createdAt,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_support_table_skills(organizationUrl,description,groupCode,sortOrder,startDate,endDate)

  SupportTableSkills.create(
    
 organizationUrl: organizationUrl,
      description:  description,
      groupCode:  groupCode,
      sortOrder:  sortOrder,
      startDate: startDate,
      endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_support_table_skills(id,organizationUrl,description,groupCode,sortOrder,startDate,endDate)
   
    check = SupportTableSkills.where(id: id).update(
 
     organizationUrl: organizationUrl,
      description:  description,
      groupCode:  groupCode,
      sortOrder:  sortOrder,
      startDate: startDate,
      endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_support_service_codes(organizationUrl,longDescription,serviceCode,shortDescription,serviceType,serviceCategory,
    unitOfMeasure,billable,assessment,payable,timeRequired,supervisoryAssessment,startDate,endDate,telehealth,
    revenueCode,hcpcCode,modifier,earningsCode,useForTimeClock,useForPayrollTimeOnly,useAssociateDiscipline,additionalCode,formType)


  SupportServiceCodes.create(
    
  organizationUrl: organizationUrl,
  longDescription:  longDescription,
  shortDescription: shortDescription,
  serviceCode:  serviceCode,
  unitOfMeasure:  unitOfMeasure,
  serviceType: serviceType,
  serviceCategory:  serviceCategory,
  billable:  billable,
  assessment:  assessment,
  payable:  payable,
  timeRequired:  timeRequired,
  supervisoryAssessment:  supervisoryAssessment,
  telehealth:  telehealth,
  startDate:  startDate,
  endDate:  endDate,
  revenueCode:  revenueCode,
  hcpcCode: hcpcCode,
  modifier: modifier,
  earningsCode: earningsCode,
  useForTimeClock: useForTimeClock,
  useForPayrollTimeOnly: useForPayrollTimeOnly,
  useAssociateDiscipline: useAssociateDiscipline,
  additionalCode: additionalCode,
  formType: formType,
  created_at: Time.new.strftime('%F %R'),
  )
end


def     update_support_service_codes(id,organizationUrl,longDescription,serviceCode,shortDescription,serviceType,serviceCategory,
    unitOfMeasure,billable,assessment,payable,timeRequired,supervisoryAssessment,startDate,endDate,telehealth,
    revenueCode,hcpcCode,modifier,earningsCode,useForTimeClock,useForPayrollTimeOnly,useAssociateDiscipline,additionalCode,formType)
   
    check = SupportServiceCodes.where(id: id).update(
 
   organizationUrl: organizationUrl,
  longDescription:  longDescription,
  shortDescription: shortDescription,
  serviceCode:  serviceCode,
  unitOfMeasure:  unitOfMeasure,
  serviceType: serviceType,
  serviceCategory:  serviceCategory,
  billable:  billable,
  assessment:  assessment,
  payable:  payable,
  timeRequired:  timeRequired,
  supervisoryAssessment:  supervisoryAssessment,
  telehealth:  telehealth,
  startDate:  startDate,
  endDate:  endDate,
  revenueCode:  revenueCode,
  hcpcCode: hcpcCode,
  modifier: modifier,
  earningsCode: earningsCode,
  useForTimeClock: useForTimeClock,
  useForPayrollTimeOnly: useForPayrollTimeOnly,
  useAssociateDiscipline: useAssociateDiscipline,
  additionalCode: additionalCode,
  formType: formType,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end


def creating_support_relationship_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

  SupportRelationshipType.create(
    
  code: code,
  description:  description,
  groupCode:  groupCode,
  sortOrder:  sortOrder,
  startDate: startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_support_relationship_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
   
    check = SupportRelationshipType.where(id: id).update(
 
  code: code,
  description:  description,
  groupCode:  groupCode,
  sortOrder:  sortOrder,
  startDate: startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_support_letters_labels(organizationUrl,description,generateLabels,groupCode,sortOrder,startDate,endDate)

  SupportLetters.create(
    
   organizationUrl: organizationUrl,
  description:  description,
  generateLabels: generateLabels,
  groupCode:  groupCode,
  sortOrder:  sortOrder,
  startDate: startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_support_letters_labels(id,organizationUrl,description,generateLabels,groupCode,sortOrder,startDate,endDate)

   
    check = SupportLetters.where(id: id).update(
 
  organizationUrl: organizationUrl,
  description:  description,
  generateLabels: generateLabels,
  groupCode:  groupCode,
  sortOrder:  sortOrder,
  startDate: startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_support_sales_tax(organizationUrl,salesTax,state,rate,department,startDate,endDate)


  SupportSalesTax.create(
    
  organizationUrl: organizationUrl,
  salesTax:  salesTax,
  state: state,
  rate:  rate,
  department:  department,
  startDate: startDate,
  endDate: endDate,
   created_at: Time.new.strftime('%F %R'),
  )
end


def update_support_sales_tax(id,organizationUrl,salesTax,state,rate,department,startDate,endDate)
   
    check = SupportSalesTax.where(id: id).update(
 
  organizationUrl: organizationUrl,
  salesTax:  salesTax,
  state: state,
  rate:  rate,
  department:  department,
  startDate: startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end


def creating_support_service_code_mapping(organizationUrl,ordersDiscipline,agencyType,payer,initialService,routineService,
    rocAddAssessmentService,therapyUtilizationInitialVisit,therapyUtilization30thVisit,startDate,endDate)

  SupportCodeMapping.create(
    
  organizationUrl: organizationUrl,
  ordersDiscipline:  ordersDiscipline,
  agencyType: agencyType,
  payer:  payer,
  initialService:  initialService,
  routineService: routineService,
  rocAddAssessmentService: rocAddAssessmentService,
   therapyUtilizationInitialVisit: therapyUtilizationInitialVisit,
  therapyUtilization30thVisit: therapyUtilization30thVisit,
  startDate: startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def  update_support_service_code_mapping(id,organizationUrl,ordersDiscipline,agencyType,payer,initialService,routineService,
    rocAddAssessmentService,therapyUtilizationInitialVisit,therapyUtilization30thVisit,startDate,endDate)  
   
    check = SupportCodeMapping.where(id: id).update(
 
 organizationUrl: organizationUrl,
  ordersDiscipline:  ordersDiscipline,
  agencyType: agencyType,
  payer:  payer,
  initialService:  initialService,
  routineService: routineService,
  rocAddAssessmentService: rocAddAssessmentService,
  therapyUtilizationInitialVisit: therapyUtilizationInitialVisit,
  therapyUtilization30thVisit: therapyUtilization30thVisit,
  startDate: startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_support_organization_note_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

  SupportOrganizationNoteType.create(
    
  code: code,
  description:  description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_support_organization_note_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

    check = SupportOrganizationNoteType.where(id: id).update(
 
   code: code,
  description:  description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_support_announcements(title,announcement,organizationUrl,status,startDate,endDate)
  
  SupportAnnouncements.create(
    
  title: title,
  announcement:  announcement,
  organizationUrl: organizationUrl,
  status:  status,
  startDate:  startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_support_announcements(id,title,announcement,organizationUrl,status,startDate,endDate)

    check = SupportAnnouncements.where(id: id).update(
 
    title: title,
  announcement:  announcement,
  organizationUrl: organizationUrl,
  status:  status,
  startDate:  startDate,
  endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_support_characteristic_type(groupCode,description,organizationUrl,sortOrder,associateAlso,associateOnly,schedulingMatch
    )

  SupportCharacteristicType.create(
    
  groupCode: groupCode,
  description:  description,
  organizationUrl: organizationUrl,
  sortOrder:  sortOrder,
  associateAlso:  associateAlso,
  associateOnly: associateOnly,
  schedulingMatch: schedulingMatch,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_support_characteristic_type(id,groupCode,description,organizationUrl,sortOrder,associateAlso,associateOnly,schedulingMatch
    )

    check = SupportCharacteristicType.where(id: id).update(
 
  groupCode: groupCode,
  description:  description,
  organizationUrl: organizationUrl,
  sortOrder:  sortOrder,
  associateAlso:  associateAlso,
  associateOnly: associateOnly,
  schedulingMatch: schedulingMatch,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_face_to_face(visitDate,visitComment,physicianType,attestation,clinicalFindings,services,
    homeBoundReason,otherHomeBound,patientID,organizationUrl,physicianID)

  FaceToFace.create(
    
  visitDate: visitDate,
  visitComment:  visitComment,
  physicianType: physicianType,
  attestation:  attestation,
  clinicalFindings:  clinicalFindings,
  services: services,
  homeBoundReason: homeBoundReason,
  otherHomeBound: otherHomeBound,
  patientID: patientID,
  organizationUrl: organizationUrl,
  physicianID: physicianID,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_face_to_face(id,visitDate,visitComment,physicianType,attestation,clinicalFindings,services,homeBoundReason,
    otherHomeBound,patientID,organizationUrl,physicianID)

    check = FaceToFace.where(id: id).update(
 
  visitDate: visitDate,
  visitComment:  visitComment,
  physicianType: physicianType,
  attestation:  attestation,
  clinicalFindings:  clinicalFindings,
  services: services,
  homeBoundReason: homeBoundReason,
  otherHomeBound: otherHomeBound,
  patientID: patientID,
  organizationUrl: organizationUrl,
  physicianID: physicianID,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_advance_directives_types(code,description,groupCode,sortOrder,startDate,endDate,
    useForDnrDisplay,organizationUrl)

  AdvanceDirectivesTypes.create(
    
  code: code,
  description:  description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  useForDnrDisplay: useForDnrDisplay,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_advance_directives_types(id,code,description,groupCode,sortOrder,startDate,endDate,
    useForDnrDisplay,organizationUrl)

    check = AdvanceDirectivesTypes.where(id: id).update(
 
code: code,
  description:  description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  useForDnrDisplay: useForDnrDisplay,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_incoming_fax_queues(faxQueueDescription,groupCode,sortOrder,startDate,endDate,organizationUrl)

  IncomingFaxQueues.create(
    
  faxQueueDescription: faxQueueDescription,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_incoming_fax_queues(id,faxQueueDescription,groupCode,sortOrder,startDate,endDate,organizationUrl)

    check = IncomingFaxQueues.where(id: id).update(
 
 faxQueueDescription: faxQueueDescription,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_agency_note_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

  AgencyNoteType.create(
    
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_agency_note_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = AgencyNoteType.where(id: id).update(
 
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_error_description(minMinutes,description,category,sortOrder,startDate,endDate,organizationUrl,maxRate,maxMiles,lastModifiedBy)


  ErrorDescription.create(
    
  minMinutes: minMinutes,
  description: description,
  category: category,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  maxRate: maxRate,
  maxMiles: maxMiles,
  lastModifiedBy: lastModifiedBy,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_error_description(id,minMinutes,description,category,sortOrder,startDate,endDate,organizationUrl,maxRate,maxMiles,lastModifiedBy)
 
   check = ErrorDescription.where(id: id).update(
 
   minMinutes: minMinutes,
  description: description,
  category: category,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  maxRate: maxRate,
  maxMiles: maxMiles,
  lastModifiedBy: lastModifiedBy,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_document_type(advanceDirective,description,patientNotice,sortOrder,organizationUrl,consent,groupCode,startDate,endDate,taskCode,module1)

  DocumentType.create(
    
  advanceDirective: advanceDirective,
  description: description,
  patientNotice: patientNotice,
  sortOrder:  sortOrder,
  organizationUrl: organizationUrl,
  consent: consent,
  groupCode: groupCode,
  startDate: startDate,
  endDate: endDate,
  taskCode: taskCode,
  module: module1,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_document_type(id,advanceDirective,description,patientNotice,sortOrder,organizationUrl,consent,groupCode,startDate,endDate,taskCode,module1)
 
   check = DocumentType.where(id: id).update(
 
  advanceDirective: advanceDirective,
  description: description,
  patientNotice: patientNotice,
  sortOrder:  sortOrder,
  organizationUrl: organizationUrl,
  consent: consent,
  groupCode: groupCode,
  startDate: startDate,
  endDate: endDate,
  taskCode: taskCode,
  module: module1,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_agency_billing_settings(agencyUrl,supplyMarkUpPercent,providerSignatureOnFile,acceptMedicareAssignment,assignmentOfBenefits,releaseOfInformation,patientSignatureSource,eobRequested)

  AgencyBillingSettings.create(
    
  agencyUrl: agencyUrl,
  supplyMarkUpPercent: supplyMarkUpPercent,
  providerSignatureOnFile: providerSignatureOnFile,
  acceptMedicareAssignment:  acceptMedicareAssignment,
  assignmentOfBenefits: assignmentOfBenefits,
  releaseOfInformation: releaseOfInformation,
  patientSignatureSource: patientSignatureSource,
  eobRequested: eobRequested,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_agency_billing_settings(id,agencyUrl,supplyMarkUpPercent,providerSignatureOnFile,acceptMedicareAssignment,assignmentOfBenefits,releaseOfInformation,patientSignatureSource,eobRequested)
 
   check = AgencyBillingSettings.where(id: id).update(
 
   agencyUrl: agencyUrl,
  supplyMarkUpPercent: supplyMarkUpPercent,
  providerSignatureOnFile: providerSignatureOnFile,
  acceptMedicareAssignment:  acceptMedicareAssignment,
  assignmentOfBenefits: assignmentOfBenefits,
  releaseOfInformation: releaseOfInformation,
  patientSignatureSource: patientSignatureSource,
  eobRequested: eobRequested,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_agency_processing_settings(agencyUrl,payrollInterval,payrollType,payrollCutoff,payrollProcessingDate,payrollProcessingTime,dataCutoff,dataProcessingDate,dataProcessingTime)

  AgencyProcessingSettings.create(
    
  agencyUrl: agencyUrl,
  payrollInterval: payrollInterval,
  payrollType: payrollType,
  payrollCutoff:  payrollCutoff,
  payrollProcessingDate: payrollProcessingDate,
  payrollProcessingTime: payrollProcessingTime,
  dataCutoff: dataCutoff,
  dataProcessingDate: dataProcessingDate,
  dataProcessingTime: dataProcessingTime,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_agency_processing_settings(id,agencyUrl,payrollInterval,payrollType,payrollCutoff,payrollProcessingDate,payrollProcessingTime,dataCutoff,dataProcessingDate,dataProcessingTime)

   check = AgencyProcessingSettings.where(id: id).update(
 
 agencyUrl: agencyUrl,
  payrollInterval: payrollInterval,
  payrollType: payrollType,
  payrollCutoff:  payrollCutoff,
  payrollProcessingDate: payrollProcessingDate,
  payrollProcessingTime: payrollProcessingTime,
  dataCutoff: dataCutoff,
  dataProcessingDate: dataProcessingDate,
  dataProcessingTime: dataProcessingTime,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_agency_notes(agencyUrl,date,noteBy,noteType,document,note,active)

  AgencyNotes.create(
    
  agencyUrl: agencyUrl,
  date: date,
  noteBy: noteBy,
  noteType:  noteType,
  document: document,
  note: note,
  active: active,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_agency_notes(id,agencyUrl,date,noteBy,noteType,document,note,active)

   check = AgencyNotes.where(id: id).update(
 
 agencyUrl: agencyUrl,
  date: date,
  noteBy: noteBy,
  noteType:  noteType,
  document: document,
  note: note,
  active: active,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_agency_ancillary_phone(agencyUrl,phoneType,phone,description)

  AgencyAncillaryPhone.create(
    
  agencyUrl: agencyUrl,
  phoneType: phoneType,
  phone: phone,
  description:  description,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_agency_ancillary_phone(id,agencyUrl,phoneType,phone,description)

   check = AgencyAncillaryPhone.where(id: id).update(
 
 agencyUrl: agencyUrl,
  phoneType: phoneType,
  phone: phone,
  description:  description,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_agency_address_phone_info(agencyUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones)


  AgencyAddressPhoneInfo.create(
    
  agencyUrl: agencyUrl,
  addressType: addressType,
  address1: address1,
  address2:  address2,
  city:  city,
  zip:  zip,
  state:  state,
  addressPhoneInfoPhones:  addressPhoneInfoPhones,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_agency_address_phone_info(id,agencyUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones)


   check = AgencyAddressPhoneInfo.where(id: id).update(
 
 agencyUrl: agencyUrl,
  addressType: addressType,
  address1: address1,
  address2:  address2,
  city:  city,
  zip:  zip,
  state:  state,
  addressPhoneInfoPhones:  addressPhoneInfoPhones,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_region_ancillary_phone(regionUrl,phoneType,phone,description)

  RegionAncillaryPhone.create(
    
  regionUrl: regionUrl,
  phoneType: phoneType,
  phone: phone,
  description:  description,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_agency_address_phone_info(id,regionUrl,phoneType,phone,description)

 check = RegionAncillaryPhone.where(id: id).update(
    regionUrl: regionUrl,
  phoneType: phoneType,
  phone: phone,
  description:  description,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_region_address_phone_info(regionUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones)


  RegionAddressPhoneInfo.create(
    
  regionUrl: regionUrl,
  addressType: addressType,
  address1: address1,
  address2:  address2,
  city:  city,
  zip:  zip,
  state:  state,
  addressPhoneInfoPhones:  addressPhoneInfoPhones,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_region_address_phone_info(id,regionUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones)

   check = RegionAddressPhoneInfo.where(id: id).update(
 
 regionUrl: regionUrl,
  addressType: addressType,
  address1: address1,
  address2:  address2,
  city:  city,
  zip:  zip,
  state:  state,
  addressPhoneInfoPhones:  addressPhoneInfoPhones,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_organization_settings(organizationUrl,settings)

  OrganizationSettings.create(
    
  organizationUrl: organizationUrl,
  settings: settings,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_organization_settings(id,organizationUrl,settings)

   check = OrganizationSettings.where(id: id).update(
 
  organizationUrl: organizationUrl,
  settings: settings,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_organization_notes(organizationUrl,noteBy,noteType,document,note,active,date)

   
  OrganizationNote.create(
    
    organizationUrl: organizationUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_organization_notes(id,organizationUrl,noteBy,noteType,document,note,active,date)
   
    puts "------------------UPDATING STATUS ------------------"
    puts "associateUrl is #{associateUrl}}"
   
    check = OrganizationNote.where(id: id).update(
      organizationUrl: organizationUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end







def creating_organization_documents(organizationUrl,file,attachTo,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
  
  OrganizationDocuments.create(
    
    organizationUrl: organizationUrl,
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_organization_documents(id,organizationUrl,file,attachTo,documentType,documentStatus,description,note,uploadedBy,uploadedDate)
 
    puts "------------------UPDATING STATUS ------------------"
   
    check = OrganizationDocuments.where(id: id).update(

    organizationUrl: organizationUrl,
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    updated_at: Time.new.strftime('%F %R')

    )
    puts check.inspect
    
    
  #end     
end




def creating_organization_payrates(organizationUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate) 
  OrganizationPayrate.create(
    
    organizationUrl: organizationUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_organization_payrates(id,organizationUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate)
   puts "------------------UPDATING Deduction ------------------"
    puts "id is #{id}}"
   
    check = OrganizationPayrate.where(id: id).update(
    organizationUrl: organizationUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end




def creating_organization_ancillary_phone(organizationUrl,phoneType,phone,description)
   
  OrganizationAncillaryPhone.create(
    
    organizationUrl: organizationUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    created_at: Time.new.strftime('%F %R'),
  )
end 


def  get_update_OrganizationAncillaryPhone(id,organizationUrl,phoneType,phone,description)
    puts "------------------UPDATING STATUS ------------------"
  
   
    check = OrganizationAncillaryPhone.where(id: id).update(
        organizationUrl: organizationUrl,
    phoneType: phoneType,
    phone: phone,
    description: description,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end



def creating_organization_addressPhoneInfo(organizationUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
   
  OrganizationAddressPhoneInfo.create(
    
    organizationUrl: organizationUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_organization_addressPhoneInfo(id,organizationUrl,addressType,address1,address2,city,state,zip,addressPhoneInfoPhones)
    puts "------------------UPDATING STATUS ------------------"

    check = OrganizationAddressPhoneInfo.where(id: id).update(

    organizationUrl: organizationUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end





def creating_associate_forms(associateUrl,performedBy,relatedBy,completed,formType,formData)
   
  AssociateForms.create(
    
    associateUrl: associateUrl,
    performedBy: performedBy,
    relatedBy: relatedBy,
    completed: completed,
    formType: formType,
    formData: formData,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_associate_forms(id,associateUrl,performedBy,relatedBy,completed,formType,formData)
    puts "------------------UPDATING STATUS ------------------"
    
    check = AssociateForms.where(id: id).update(

    associateUrl: associateUrl,
    performedBy: performedBy,
    relatedBy: relatedBy,
    completed: completed,
    formType: formType,
    formData: formData,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end





def creating_patient_payer_address_phone_info(patientPayerUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,billTo,description,attention)
   
  PatientPayerAddressPhoneInfo.create(
    
    patientPayerUrl: patientPayerUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    billTo: billTo,
    description: description,
    attention: attention,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  update_patient_payer_address_phone_info(id,patientPayerUrl,addressType,address1,address2,city,zip,state,addressPhoneInfoPhones,billTo,description,attention)
       
    check = PatientPayerAddressPhoneInfo.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    addressType: addressType,
    address1: address1,
    address2: address2,
    city: city,
    state: state,
    zip: zip,
    addressPhoneInfoPhones: addressPhoneInfoPhones,
    billTo: billTo,
    description: description,
    attention: attention,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end





def  creating_patient_payer_payrates(patientPayerUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate,endDate)
   
  PatientPayerPayrate.create(
    
    patientPayerUrl: patientPayerUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_patient_payer_payrates(id,patientPayerUrl,payType,serviceDescription,weekdayRate,weekendRate,allowOverride,startDate,endDate)

  
    check = PatientPayerPayrate.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    payType: payType,
    serviceDescription: serviceDescription,
    weekdayRate: weekdayRate,
    weekendRate: weekendRate,
    allowOverride: allowOverride,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
      
end







def creating_patient_payer_bill_rates(patientPayerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser)
  
  PatientPayerBillRates.create(
    
    patientPayerUrl: patientPayerUrl,
    serviceCategory: serviceCategory,
    service: service,
    description: description,
    unitOfMeasure: unitOfMeasure,
    payerRate: payerRate,
    allowOverride: allowOverride,
    startDate: startDate,
    revenueCode: revenueCode,
    hcpcCode: hcpcCode,
    agency: agency,
    assessment: assessment,
    endDate: endDate,
    useAgencyChargeAmount: useAgencyChargeAmount,
    chargeAmount: chargeAmount,
    serviceType: serviceType,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    treatmentCodeNeeded: treatmentCodeNeeded,
    unitMultiplier: unitMultiplier,
    incrementalBillingCode: incrementalBillingCode,
    sendBillingDescriptionForEdit: sendBillingDescriptionForEdit,
    evvProgram: evvProgram,
    evvGroupedProcedureCode: evvGroupedProcedureCode,
    lastUpdated: lastUpdated,
    modifyUser: modifyUser,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patient_payer_bill_rate(id,patientPayerUrl,serviceCategory,service,description,unitOfMeasure,payerRate,allowOverride,startDate,revenueCode,hcpcCode,
    agency,assessment,endDate,useAgencyChargeAmount,chargeAmount,serviceType,hcpcModifier1,hcpcModifier2,hcpcModifier3,hcpcModifier4,
    treatmentCodeNeeded,unitMultiplier,incrementalBillingCode,sendBillingDescriptionForEdit,evvProgram,evvGroupedProcedureCode,lastUpdated,modifyUser)
  
    check = PatientPayerBillRates.where(id: id).update(
     patientPayerUrl: patientPayerUrl,
    serviceCategory: serviceCategory,
    service: service,
    description: description,
    unitOfMeasure: unitOfMeasure,
    payerRate: payerRate,
    allowOverride: allowOverride,
    startDate: startDate,
    revenueCode: revenueCode,
    hcpcCode: hcpcCode,
    agency: agency,
    assessment: assessment,
    endDate: endDate,
    useAgencyChargeAmount: useAgencyChargeAmount,
    chargeAmount: chargeAmount,
    serviceType: serviceType,
    hcpcModifier1: hcpcModifier1,
    hcpcModifier2: hcpcModifier2,
    hcpcModifier3: hcpcModifier3,
    hcpcModifier4: hcpcModifier4,
    treatmentCodeNeeded: treatmentCodeNeeded,
    unitMultiplier: unitMultiplier,
    incrementalBillingCode: incrementalBillingCode,
    sendBillingDescriptionForEdit: sendBillingDescriptionForEdit,
    evvProgram: evvProgram,
    evvGroupedProcedureCode: evvGroupedProcedureCode,
    lastUpdated: lastUpdated,
    modifyUser: modifyUser,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_patientPayer_notes(patientPayerUrl,noteBy,noteType,document,note,active,date)
   
  PatientPayerNote.create(
    
    patientPayerUrl: patientPayerUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_patientPayer_notes(id,patientPayerUrl,noteBy,noteType,document,note,active,date)
     
    check = PatientPayerNote.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    noteBy: noteBy,
    noteType: noteType,
    document: document,
    note: note,
    active: active,
    date: date,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
    
  #end     
end






def creating_patientPayer_employer(patientPayerUrl,employerName,employerStatusType,retirementDate,patientID)
  
  PatientPayeremployer.create(
    
    patientPayerUrl: patientPayerUrl,
    employerName: employerName,
    employerStatusType: employerStatusType,
    retirementDate: retirementDate,
    patientID: patientID,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patientPayer_employer(id,patientPayerUrl,employerName,employerStatusType,retirementDate,patientID)
     
    check = PatientPayeremployer.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    employerName: employerName,
    employerStatusType: employerStatusType,
    retirementDate: retirementDate,
    patientID: patientID,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end




def creating_patientPayer_authorizations(patientPayerUrl,serviceCategory,authorizationHash,startDate,endDate,
  authorizedBy,maxVisitsPerWeek,maxVisitsPerDay,maxHoursUnitsPerWeek,maxHoursUnitsPerDay,terminationDate,authHours)
  
  PatientPayerAuthorizations.create(
    
    patientPayerUrl: patientPayerUrl,
    serviceCategory: serviceCategory,
    authorizationHash: authorizationHash,
    startDate: startDate,
    endDate: endDate,
    authorizedBy: authorizedBy,
    maxVisitsPerWeek: maxVisitsPerWeek,
    maxVisitsPerDay: maxVisitsPerDay,
    maxHoursUnitsPerWeek: maxHoursUnitsPerWeek,
    maxHoursUnitsPerDay: maxHoursUnitsPerDay,
    terminationDate: terminationDate,
    authHours: authHours,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_patientPayer_authorizations(id,patientPayerUrl,serviceCategory,authorizationHash,startDate,endDate,
  authorizedBy,maxVisitsPerWeek,maxVisitsPerDay,maxHoursUnitsPerWeek,maxHoursUnitsPerDay,terminationDate,authHours)
     
    check = PatientPayerAuthorizations.where(id: id).update(
    patientPayerUrl: patientPayerUrl,
    serviceCategory: serviceCategory,
    authorizationHash: authorizationHash,
    startDate: startDate,
    endDate: endDate,
    authorizedBy: authorizedBy,
    maxVisitsPerWeek: maxVisitsPerWeek,
    maxVisitsPerDay: maxVisitsPerDay,
    maxHoursUnitsPerWeek: maxHoursUnitsPerWeek,
    maxHoursUnitsPerDay: maxHoursUnitsPerDay,
    terminationDate: terminationDate,
    authHours: authHours,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end






def  creating_patientPayer_documents(patientPayerUrl,file,attachTo,documentType,documentStatus,
  description,note,uploadedBy,uploadedDate)
  
  PatientPayerDocuments.create(
    
    patientPayerUrl: patientPayerUrl,
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_patientPayer_documents(id,patientPayerUrl,file,attachTo,documentType,documentStatus,
  description,note,uploadedBy,uploadedDate)

    check = PatientPayerDocuments.where(id: id).update(
     patientPayerUrl: patientPayerUrl,
    file: file,
    attachTo: attachTo,
    documentType: documentType,
    documentStatus: documentStatus,
    description: description,
    note: note,
    uploadedBy: uploadedBy,
    uploadedDate: uploadedDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end





def  creating_admission_source(organizationUrl,code,description,ediValue,groupCode,
  sortOrder,startDate,endDate)
  
  AdmissionSource.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    ediValue: ediValue,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_admission_source(id,organizationUrl,code,description,ediValue,groupCode,
  sortOrder,startDate,endDate)

    check = AdmissionSource.where(id: id).update(
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    ediValue: ediValue,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end




def  creating_disaster_plan_types(organizationUrl,restrictToAgencyType,description,groupCode,
  sortOrder,startDate,endDate)
  
  DisasterPlanTypes.create(
    
    organizationUrl: organizationUrl,
    restrictToAgencyType: restrictToAgencyType,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def   get_update_disaster_plan_types(id,organizationUrl,restrictToAgencyType,description,groupCode,
  sortOrder,startDate,endDate)

    check = DisasterPlanTypes.where(id: id).update(
     organizationUrl: organizationUrl,
    restrictToAgencyType: restrictToAgencyType,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end




def   creating_discharge_reason_types(organizationUrl,code,description,discharge_status,
  sortOrder,startDate,endDate,revocation,applyCode52)
  
  DischargeReasonTypes.create(
    
    organizationUrl: organizationUrl,
    code: code,
    description: description,
    discharge_status: discharge_status,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    revocation: revocation,
    applyCode52: applyCode52,
    created_at: Time.new.strftime('%F %R'),
  )
end   


def  get_update_discharge_reason_types(id,organizationUrl,code,description,discharge_status,
  sortOrder,startDate,endDate,revocation,applyCode52)

    check = DischargeReasonTypes.where(id: id).update(
     organizationUrl: organizationUrl,
    code: code,
    description: description,
    discharge_status: discharge_status,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    revocation: revocation,
    applyCode52: applyCode52,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end





def   creating_decline_reason_types(organizationUrl,description,groupCode,
  sortOrder,startDate,endDate)
  
  DeclineReasonTypes.create(
    
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_decline_reason_types(id,organizationUrl,description,groupCode,
  sortOrder,startDate,endDate)

    check = DeclineReasonTypes.where(id: id).update(
    organizationUrl: organizationUrl,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    startDate: startDate,
    endDate: endDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect

end


def creating_transaction_note_types(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 TransactionNoteType.create(
    
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_transaction_note_types(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = TransactionNoteType.where(id: id).update(
 
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_program_types(description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 ProgramTypes.create(
    

  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_program_types(id,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = ProgramTypes.where(id: id).update(
 
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def  creating_patient_notice_types(description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 PatientNoticeTypes.create(
    

  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def    update_patient_notice(id,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = PatientNoticeTypes.where(id: id).update(
 
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_patient_contact_types(description,code,groupCode,sortOrder,startDate,endDate,organizationUrl)

 PatientContactTypes.create(
    
code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_patient_contact_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = PatientContactTypes.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_payer_note_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 PayerNoteType.create(
    
code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_payer_note_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = PayerNoteType.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end








def creating_document_status_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 DocumentStatusType.create(
    
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_document_status_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = DocumentStatusType.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end


def creating_employment_status_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 EmploymentStatusType.create(
    
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_employment_status_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = EmploymentStatusType.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_patient_treatments(uid,patientID,entryType,treatmentType,description,prescribedBy,administeredBy,approvedBy,createInterimOrder,effectiveDate,startDate,endDate)
  
 PatientTreatment.create(
    
  uid: uid,
  patientID: patientID,
  entryType: entryType,
  treatmentType:  treatmentType,
  description:  description,
  prescribedBy:  prescribedBy,
  administeredBy:  administeredBy,
  approvedBy:  approvedBy,
  createInterimOrder:  createInterimOrder,
  effectiveDate:  effectiveDate,
  startDate:  startDate,
  endDate: endDate,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_patient_treatments(uid,patientID,entryType,treatmentType,description,prescribedBy,administeredBy,approvedBy,createInterimOrder,effectiveDate,startDate,endDate)
 

   check = PatientTreatment.where(uid: uid).update(
  patientID: patientID,
  entryType: entryType,
  treatmentType:  treatmentType,
  description:  description,
  prescribedBy:  prescribedBy,
  administeredBy:  administeredBy,
  approvedBy:  approvedBy,
  createInterimOrder:  createInterimOrder,
  effectiveDate:  effectiveDate,
  startDate:  startDate,
  endDate: endDate,
  updated_at: Time.new.strftime('%F %R')
  )
    puts check.inspect
    
end





def creating_patient_supply(uid,patientID,category,description,units,dispenseQuantity,unitOfMeasurement,addedBy)
  
 PatientSupply.create(
    
  uid: uid,
  patientID: patientID,
  category: category,
  description:  description,
  units:  units,
  dispenseQuantity:  dispenseQuantity,
  unitOfMeasurement:  unitOfMeasurement,
  addedBy:  addedBy,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_patient_supply(uid,patientID,category,description,units,dispenseQuantity,unitOfMeasurement,addedBy)
 

   check = PatientSupply.where(uid: uid).update(
  patientID: patientID,
  category: category,
  description:  description,
  units:  units,
  dispenseQuantity:  dispenseQuantity,
  unitOfMeasurement:  unitOfMeasurement,
  addedBy:  addedBy,
  updated_at: Time.new.strftime('%F %R')
  )
    puts check.inspect
    
end




def creating_service_notes(uid,patientID,serviceFormID,serviceType,enteredBy,revisedBy,serviceProvidedBy,serviceDate,timeIn,timeOut,status)
  
 ServiceNote.create(
    
  uid: uid,
  patientID: patientID,
  serviceFormID: serviceFormID,
  serviceType:  serviceType,
  enteredBy:  enteredBy,
  revisedBy:  revisedBy,
  serviceProvidedBy:  serviceProvidedBy,
  serviceDate:  serviceDate,
  timeIn:  timeIn,
  timeOut:  timeOut,
  status:  status,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_service_notes(uid,patientID,serviceFormID,serviceType,enteredBy,revisedBy,serviceProvidedBy,serviceDate,timeIn,timeOut,status)
 

   check = ServiceNote.where(uid: uid).update(
  patientID: patientID,
  serviceFormID: serviceFormID,
  serviceType:  serviceType,
  enteredBy:  enteredBy,
  revisedBy:  revisedBy,
  serviceProvidedBy:  serviceProvidedBy,
  serviceDate:  serviceDate,
  timeIn:  timeIn,
  timeOut:  timeOut,
  status:  status,
  updated_at: Time.new.strftime('%F %R')
  )
    puts check.inspect
    
end





def creating_service_note_forms(uid,patientID,serviceNoteID,cardiacAssessement,careCoordination,endocrineAssessment,gastrointestinalAssessment,headerAndSupplies,homeBoundStatus,integumentaryAssessment,intravenouseTherapy,medicationAssessment,musculoskeletalAssessment,narrativeTeaching,neuroProgress,nutritionalAssessment,painAssessment,patientIdentifier,respiratoryAssessment,supervisoryVisitHHA,supervisoryVisitLPN,taskAction,taskGoals,vitalSigns,woundArea)
  
 ServiceNoteForm.create(
    
    uid: uid,
    serviceNoteID: serviceNoteID,
    patientID: patientID,
    cardiacAssessement: cardiacAssessement,
    careCoordination: careCoordination,
    endocrineAssessment: endocrineAssessment,
    gastrointestinalAssessment: gastrointestinalAssessment,
    headerAndSupplies: headerAndSupplies,
    homeBoundStatus: homeBoundStatus,
    integumentaryAssessment: integumentaryAssessment,
    intravenouseTherapy: intravenouseTherapy,
    medicationAssessment: medicationAssessment,
    musculoskeletalAssessment: musculoskeletalAssessment,
    narrativeTeaching: narrativeTeaching,
    neuroProgress: neuroProgress,
    nutritionalAssessment: nutritionalAssessment,
    painAssessment: painAssessment,
    patientIdentifier: patientIdentifier,
    respiratoryAssessment: respiratoryAssessment,
    supervisoryVisitHHA: supervisoryVisitHHA,
    supervisoryVisitLPN: supervisoryVisitLPN,
    taskAction: taskAction,
    taskGoals: taskGoals,
    vitalSigns: vitalSigns,
    woundArea: woundArea,
    created_at: Time.new.strftime('%F %R'),
  )

end


def  update_service_note_forms(uid,patientID,serviceNoteID,cardiacAssessement,careCoordination,endocrineAssessment,gastrointestinalAssessment,headerAndSupplies,homeBoundStatus,integumentaryAssessment,intravenouseTherapy,medicationAssessment,musculoskeletalAssessment,narrativeTeaching,neuroProgress,nutritionalAssessment,painAssessment,patientIdentifier,respiratoryAssessment,supervisoryVisitHHA,supervisoryVisitLPN,taskAction,taskGoals,vitalSigns,woundArea)
 

   check = ServiceNoteForm.where(uid: uid).update(
  
    serviceNoteID: serviceNoteID,
    patientID: patientID,
    cardiacAssessement: cardiacAssessement,
    careCoordination: careCoordination,
    endocrineAssessment: endocrineAssessment,
    gastrointestinalAssessment: gastrointestinalAssessment,
    headerAndSupplies: headerAndSupplies,
    homeBoundStatus: homeBoundStatus,
    integumentaryAssessment: integumentaryAssessment,
    intravenouseTherapy: intravenouseTherapy,
    medicationAssessment: medicationAssessment,
    musculoskeletalAssessment: musculoskeletalAssessment,
    narrativeTeaching: narrativeTeaching,
    neuroProgress: neuroProgress,
    nutritionalAssessment: nutritionalAssessment,
    painAssessment: painAssessment,
    patientIdentifier: patientIdentifier,
    respiratoryAssessment: respiratoryAssessment,
    supervisoryVisitHHA: supervisoryVisitHHA,
    supervisoryVisitLPN: supervisoryVisitLPN,
    taskAction: taskAction,
    taskGoals: taskGoals,
    vitalSigns: vitalSigns,
    woundArea: woundArea,
  updated_at: Time.new.strftime('%F %R')
  )
    puts check.inspect
    
end



def creating_variance_resolution_type(removeFromSchedule,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 VarianceResolutionType.create(
    
  removeFromSchedule: removeFromSchedule,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_variance_resolution_type(id,removeFromSchedule,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = VarianceResolutionType.where(id: id).update(
 
  removeFromSchedule: removeFromSchedule,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_invoice_review_types(description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 InvoiceReviewType.create(
    
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_invoice_review_types(id,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = InvoiceReviewType.where(id: id).update(
 
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_reporting_groups(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 ReportingGroup.create(
  
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_reporting_groups(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
 

   check = ReportingGroup.where(id: id).update(
 
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_earnings_code(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromOT,itemDescription)
  
 EarningCode.create(
  
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  excludeFromOT: excludeFromOT,
  itemDescription: itemDescription,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_earnings_code(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromOT,itemDescription)

 

   check = EarningCode.where(id: id).update(
 
   code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  excludeFromOT: excludeFromOT,
  itemDescription: itemDescription,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_payroll_tax_code(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 PayrollTaxCode.create(
  
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_payroll_tax_code(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = PayrollTaxCode.where(id: id).update(
 
   code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_patient_note_types(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromFactReport,noTask)
  
 PatientNoteTypes.create(
  
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  excludeFromFactReport: excludeFromFactReport,
  noTask: noTask,
  created_at: Time.new.strftime('%F %R'),
  )

end


def   update_patient_note_types(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl,excludeFromFactReport,noTask)

   check = PatientNoteTypes.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  excludeFromFactReport: excludeFromFactReport,
  noTask: noTask,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_place_of_admission_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)
  
 PlaceOfAdmissionType.create(
  
  code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_place_of_admission_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = PatientNoteTypes.where(id: id).update(
 code: code,
  description: description,
  groupCode: groupCode,
  sortOrder:  sortOrder,
  startDate:  startDate,
  endDate: endDate,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end






def creating_patient_discipline_services(orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,endd,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked)
  
 PatientDisciplineService.create(
  
  orderId: orderId,
  color: color,
  date: date,
  discipline:  discipline,
  frequency:  frequency,
  service: service,
  rate: rate,
  override: override,
  associateUrl: associateUrl,
  payer: payer,
  patientUid: patientUid,
  status: status,
  certId: certId,
  start: start,
  end: endd,
  comments: comments,
   resolution: resolution,
  resolutionDate: resolutionDate,
  interimOrder:interimOrder,
  payOnlyCodes: payOnlyCodes,
  overrideRate: overrideRate,
  overrideAvailabilityCheck: overrideAvailabilityCheck,
  isLocked: isLocked,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_patient_discipline_services(id,orderId,color,date,discipline,frequency,service,rate,override,associateUrl,payer,patientUid,status,certId,start,endd,comments,resolution,resolutionDate,interimOrder,payOnlyCodes,overrideRate,overrideAvailabilityCheck,isLocked)

   check = PatientDisciplineService.where(id: id).update(
   orderId: orderId,
  color: color,
  date: date,
  discipline:  discipline,
  frequency:  frequency,
  service: service,
  rate: rate,
  override: override,
  associateUrl: associateUrl,
  payer: payer,
  patientUid: patientUid,
  status: status,
  certId: certId,
  start: start,
  end: endd,
  comments: comments,
  resolution: resolution,
  resolutionDate: resolutionDate,
  interimOrder:interimOrder,
  payOnlyCodes: payOnlyCodes,
  overrideRate: overrideRate,
  overrideAvailabilityCheck: overrideAvailabilityCheck,
  isLocked: isLocked,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_approve_medication_profile(patientID,approvedBy,signature,comments,createIntrimOrder,effectiveDate)
  
 ApproveMedicationProfile.create(
  
  patientID: patientID,
  approvedBy: approvedBy,
  signature: signature,
  comments:  comments,
  createIntrimOrder:  createIntrimOrder,
  effectiveDate: effectiveDate,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_approve_medication_profile(id,patientID,approvedBy,signature,comments,createIntrimOrder,effectiveDate)

   check = ApproveMedicationProfile.where(id: id).update(
 patientID: patientID,
  approvedBy: approvedBy,
  signature: signature,
  comments:  comments,
  createIntrimOrder:  createIntrimOrder,
  effectiveDate: effectiveDate,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_insured_address(address_type,address1,address2,city,state,zip,phone_type,phones,employerID,organizationUrl,patientPayerUrl)
  
 InsuredAddress.create(
  
  address_type: address_type,
  address1: address1,
  address2: address2,
  city:  city,
  state:  state,
  zip: zip,
  phone_type: phone_type,
  phones: phones,
  employerID: employerID,
  organizationUrl: organizationUrl,
  patientPayerUrl: patientPayerUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_insured_address(id,address_type,address1,address2,city,state,zip,phone_type,phones,employerID,organizationUrl,patientPayerUrl)

   check = InsuredAddress.where(id: id).update(
  address_type: address_type,
  address1: address1,
  address2: address2,
  city:  city,
  state:  state,
  zip: zip,
  phone_type: phone_type,
  phones: phones,
  employerID: employerID,
  organizationUrl: organizationUrl,
  patientPayerUrl: patientPayerUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end



def creating_cert_details(principalDiagnosis,principalDiagnosisDate,surgicalProcedure,surgicalProcedureDate,pertinentDiagnosis,otherSurgicalProcedures,dmeSupplies,dmeSuppliesOther,safetyMeasures,nutritionalReq,nutritionalReqOther,allergies,allergiesOther,functionalLimitations,functionalLimitationsOther,activitiesPermitted,activitiesPermittedOther,mentalStatus,prognosis,orders,goalsPotentialPlans,disasterInformation,pocCollaboration,strengthsGoalCarePref,patientRep,patientRiskForH,willingnessAndAbility,advanceDirectives,advanceDirrNarrative,vitalSignParams,nurseDate,nurseSignature,nurseTime,physicianf2fEncounter,automaticPrintingOfFDP,approvalSignature,certId,reasonForHomebound)
  
 CertDetails.create(
  
 principalDiagnosis: principalDiagnosis,
  principalDiagnosisDate: principalDiagnosisDate,
  surgicalProcedure: surgicalProcedure,
  surgicalProcedureDate: surgicalProcedureDate,
  pertinentDiagnosis: pertinentDiagnosis,
  otherSurgicalProcedures: otherSurgicalProcedures,
  dmeSupplies: dmeSupplies,
  dmeSuppliesOther: dmeSuppliesOther,
  safetyMeasures: safetyMeasures,
  nutritionalReq: nutritionalReq,
  nutritionalReqOther: nutritionalReqOther,
  allergies: allergies,
  allergiesOther: allergiesOther,
  functionalLimitations: functionalLimitations,
  functionalLimitationsOther: functionalLimitationsOther,
  activitiesPermitted: activitiesPermitted,
  activitiesPermittedOther: activitiesPermittedOther,
  mentalStatus: mentalStatus,
  prognosis: prognosis,
  orders: orders,
  goalsPotentialPlans: goalsPotentialPlans,
  disasterInformation: disasterInformation,
  pocCollaboration: pocCollaboration,
  strengthsGoalCarePref: strengthsGoalCarePref,
  patientRep: patientRep,
  patientRiskForH: patientRiskForH,
  willingnessAndAbility: willingnessAndAbility,
  advanceDirectives: advanceDirectives,
  advanceDirrNarrative: advanceDirrNarrative,
  vitalSignParams: vitalSignParams,
  nurseDate: nurseDate,
  nurseSignature: nurseSignature,
  nurseTime: nurseTime,
  physicianf2fEncounter: physicianf2fEncounter,
  automaticPrintingOfFDP: automaticPrintingOfFDP,
  approvalSignature: approvalSignature,
  certId: certId,
  reasonForHomebound: reasonForHomebound,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_cert_details(id,principalDiagnosis,principalDiagnosisDate,surgicalProcedure,surgicalProcedureDate,pertinentDiagnosis,otherSurgicalProcedures,dmeSupplies,dmeSuppliesOther,safetyMeasures,nutritionalReq,nutritionalReqOther,allergies,allergiesOther,functionalLimitations,functionalLimitationsOther,activitiesPermitted,activitiesPermittedOther,mentalStatus,prognosis,orders,goalsPotentialPlans,disasterInformation,pocCollaboration,strengthsGoalCarePref,patientRep,patientRiskForH,willingnessAndAbility,advanceDirectives,advanceDirrNarrative,vitalSignParams,nurseDate,nurseSignature,nurseTime,physicianf2fEncounter,automaticPrintingOfFDP,approvalSignature,certId,reasonForHomebound)

   check = CertDetails.where(id: id).update(
 principalDiagnosis: principalDiagnosis,
  principalDiagnosisDate: principalDiagnosisDate,
  surgicalProcedure: surgicalProcedure,
  surgicalProcedureDate: surgicalProcedureDate,
  pertinentDiagnosis: pertinentDiagnosis,
  otherSurgicalProcedures: otherSurgicalProcedures,
  dmeSupplies: dmeSupplies,
  dmeSuppliesOther: dmeSuppliesOther,
  safetyMeasures: safetyMeasures,
  nutritionalReq: nutritionalReq,
  nutritionalReqOther: nutritionalReqOther,
  allergies: allergies,
  allergiesOther: allergiesOther,
  functionalLimitations: functionalLimitations,
  functionalLimitationsOther: functionalLimitationsOther,
  activitiesPermitted: activitiesPermitted,
  activitiesPermittedOther: activitiesPermittedOther,
  mentalStatus: mentalStatus,
  prognosis: prognosis,
  orders: orders,
  goalsPotentialPlans: goalsPotentialPlans,
  disasterInformation: disasterInformation,
  pocCollaboration: pocCollaboration,
  strengthsGoalCarePref: strengthsGoalCarePref,
  patientRep: patientRep,
  patientRiskForH: patientRiskForH,
  willingnessAndAbility: willingnessAndAbility,
  advanceDirectives: advanceDirectives,
  advanceDirrNarrative: advanceDirrNarrative,
  vitalSignParams: vitalSignParams,
  nurseDate: nurseDate,
  nurseSignature: nurseSignature,
  nurseTime: nurseTime,
  physicianf2fEncounter: physicianf2fEncounter,
  automaticPrintingOfFDP: automaticPrintingOfFDP,
  approvalSignature: approvalSignature,
  certId: certId,
  reasonForHomebound: reasonForHomebound,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end




def creating_scheduled_service_notes(noteType,note,isActive,associateUrl,serviceId,patientID)
  
 ScheduledServiceNotes.create(
  
  noteType: noteType,
  note: note,
  isActive: isActive,
  associateUrl:  associateUrl,
  serviceId:  serviceId,
  patientID: patientID,
  created_at: Time.new.strftime('%F %R'),
  )

end


def  update_scheduled_service_notes(id,noteType,note,isActive,associateUrl,serviceId,patientID)

   check = ScheduledServiceNotes.where(id: id).update(
   noteType: noteType,
  note: note,
  isActive: isActive,
  associateUrl:  associateUrl,
  serviceId:  serviceId,
  patientID: patientID,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end

def creating_scheduling_conflicts(patientID,note,associateUrl,organizationUrl)
  
 SchedulingConflicts.create(

  note: note,
  associateUrl:  associateUrl,
  patientID: patientID,
  organizationUrl: organizationUrl,
  created_at: Time.new.strftime('%F %R'),
  )

end


def update_scheduling_conflicts(id,patientID,note,associateUrl,organizationUrl)

  check = SchedulingConflicts.where(id: id).update(
  note: note,
  associateUrl:  associateUrl,
  patientID: patientID,
  organizationUrl: organizationUrl,
  updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
    
end





def creating_referral_source_facility_types(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourceFacilityType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,
    organizationUrl: organizationUrl,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_facility_types(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourceFacilityType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_referral_source_facility_note_types(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourceFacilityNoteType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,
    organizationUrl: organizationUrl,  
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_facility_note_types(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourceFacilityNoteType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
      organizationUrl: organizationUrl, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_referral_source_physician_title(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourcePhysicianTitle.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
       organizationUrl: organizationUrl, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_physician_title(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourcePhysicianTitle.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
  organizationUrl: organizationUrl, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end







def creating_referral_source_referral_method_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourceReferralMethodType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
    organizationUrl: organizationUrl, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_referral_method_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourceReferralMethodType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_referral_source_note_type(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourceNoteType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    organizationUrl: organizationUrl, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_referral_source_note_type(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourceNoteType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    organizationUrl: organizationUrl, 
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_referral_source_physician_specialty(code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

 
  ReferralSourcePhysicianSpecialty.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
     organizationUrl: organizationUrl, 
    created_at: Time.new.strftime('%F %R'),
  )
end


def get_update_referral_source_physician_specialty(id,code,description,groupCode,sortOrder,startDate,endDate,organizationUrl)

   check = ReferralSourcePhysicianSpecialty.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end




def creating_referral_source_physician_note_type(code,description,groupCode,sortOrder,startDate,endDate,doNotGenerateWBtask,organizationUrl)

 
  ReferralSourcePhysicianNoteType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
    doNotGenerateWBtask: doNotGenerateWBtask,
    organizationUrl: organizationUrl,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_physician_note_type(id,code,description,groupCode,sortOrder,startDate,endDate,doNotGenerateWBtask,organizationUrl)

   check = ReferralSourcePhysicianNoteType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    doNotGenerateWBtask: doNotGenerateWBtask,
    organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end





def creating_referral_source_physician_source_type(code,description,groupCode,sortOrder,startDate,endDate,isIndividual,organizationUrl)

 
  ReferralSourcePhysicianSourceType.create(
    
    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate,  
    IsIndividual: isIndividual,
     organizationUrl: organizationUrl,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  get_update_referral_source_physician_source_type(id,code,description,groupCode,sortOrder,startDate,endDate,isIndividual,organizationUrl)

   check = ReferralSourcePhysicianSourceType.where(id: id).update(

    code: code,
    description: description,
    groupCode: groupCode,
    sortOrder: sortOrder,
    endDate: endDate,
    startDate: startDate, 
    IsIndividual: isIndividual,
     organizationUrl: organizationUrl,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



def creating_services_requested(service,service_description,payer,timeIn,timeOut,startDate,endDate,service_days,byWeekly)
 
  ServiceRequested.create(
    
    service: service,
    service_description: service_description,
    payer: payer,
    timeIn: timeIn,
    timeOut: timeOut,
    startDate: startDate,  
    endDate: endDate,
    service_days: service_days,
    byWeekly: byWeekly,
    created_at: Time.new.strftime('%F %R'),
  )
end


def  update_services_requested(id,service,service_description,payer,timeIn,timeOut,startDate,endDate,service_days,byWeekly)
 
   check = ServiceRequested.where(id: id).update(

   service: service,
   service_description: service_description,
   payer: payer,
   timeIn: timeIn,
   timeOut: timeOut,
   startDate: startDate,  
   endDate: endDate,
   service_days: service_days,
   byWeekly: byWeekly,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end



def creating_diagnosis_code(diagnosis_code,diagnosis_description,startDate)
  DiagnosisCode.create(
    
  diagnosis_code: diagnosis_code,
  diagnosis_description: diagnosis_description,
  startDate: startDate,
  created_at: Time.new.strftime('%F %R'),
  )
end


def update_diagnosis_code(id,diagnosis_code,diagnosis_description,startDate)
 
   check = DiagnosisCode.where(id: id).update(

   diagnosis_code: diagnosis_code,
   diagnosis_description: diagnosis_description,
   startDate: startDate,
    updated_at: Time.new.strftime('%F %R')
    )
    puts check.inspect
  
end


