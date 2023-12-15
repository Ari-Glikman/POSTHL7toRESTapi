Class Demo.BO.CheckTable Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method GetPatientFromTable(pRequest As Demo.REQ.PatientNewData, Output pResponse As Demo.RES.PatientInformation) As %Status
{

    set myquery = "SELECT FirstName, LastName, TeudatZehut, DateOfBirth, Observation, PatientClass, IDPatientVisit FROM Demo.PatientTable WHERE TeudatZehut Like ?"
    set tStatement = ##class(%SQL.Statement).%New()
    set qStatus = tStatement.%Prepare(myquery)
    set rset = tStatement.%Execute(pRequest.TeudatZehut) 


     set pResponse = ##class(Demo.RES.PatientInformation).%New()
    
    if rset.%Next(){
        set pResponse.FirstName = rset.%Get("FirstName")
        set pResponse.LastName = rset.%Get("LastName")
        set pResponse.TeudatZehut = rset.%Get("TeudatZehut")
        set pResponse.DateOfBirth = rset.%Get("DateOfBirth")
        set pResponse.Observation = rset.%Get("Observation")
        set pResponse.PatientClass = rset.%Get("PatientClass")
        set pResponse.IDPatientVisit = rset.%Get("IDPatientVisit")
    }

    set st = pResponse.%Save()

    return $$$OK
}

/// once post has returned successfully this is called
Method UpdatePatientInTable(pRequest As Demo.REQ.PatientUpdateTable, Output pResponse As Demo.RES.PatientInformation) As %Status
{
   set myquery = "Insert Or Update Demo.PatientTable"
                _" (TeudatZehut, FirstName, LastName, DateOfBirth, Observation, PatientClass, IDPatientVisit)" 
                _" VALUES (?, ? , ? , ?, ? , ?, ?)"
    set tStatement = ##class(%SQL.Statement).%New()
    set qStatus = tStatement.%Prepare(myquery)
    set rset = tStatement.%Execute(pRequest.TeudatZehut, pRequest.FirstName, pRequest.LastName, pRequest.DateOfBirth, pRequest.Observation, pRequest.PatientClass, pRequest.IDPatientVisit) 
  set pResponse = ##class(Demo.RES.PatientInformation).%New()
  set pResponse.FirstName = pRequest.FirstName
  set pResponse.LastName = pRequest.LastName
  set pResponse.DateOfBirth = pRequest.DateOfBirth
  set pResponse.IDPatientVisit = pRequest.IDPatientVisit
  set pResponse.Observation = pRequest.Observation
  set pResponse.PatientClass = pRequest.PatientClass
  set st = pResponse.%Save()

  return $$$OK
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Demo.REQ.PatientNewData">
    <Method>GetPatientFromTable</Method>
  </MapItem>
  <MapItem MessageType="Demo.REQ.PatientUpdateTable">
    <Method>UpdatePatientInTable</Method>
  </MapItem>
</MapItems>
}

}
