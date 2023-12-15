Class Demo.RES.PatientInformation Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Response)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

/// needs to be string as can start with 0 
Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property Observation As %String;

Property PatientClass As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="PatientInformationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DateOfBirth</Value>
</Value>
<Value name="5">
<Value>TeudatZehut</Value>
</Value>
<Value name="6">
<Value>Observation</Value>
</Value>
<Value name="7">
<Value>PatientClass</Value>
</Value>
<Value name="8">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Demo.RES.PatientInformationD</DataLocation>
<DefaultData>PatientInformationDefaultData</DefaultData>
<IdLocation>^Demo.RES.PatientInformationD</IdLocation>
<IndexLocation>^Demo.RES.PatientInformationI</IndexLocation>
<StreamLocation>^Demo.RES.PatientInformationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
