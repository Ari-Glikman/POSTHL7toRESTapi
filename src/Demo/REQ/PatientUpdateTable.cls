Class Demo.REQ.PatientUpdateTable Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Request)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property Observation As %String;

Property PatientClass As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="PatientUpdateTableDefaultData">
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
<DataLocation>^Demo.REQ.PatientUpdateTableD</DataLocation>
<DefaultData>PatientUpdateTableDefaultData</DefaultData>
<IdLocation>^Demo.REQ.PatientUpdateTableD</IdLocation>
<IndexLocation>^Demo.REQ.PatientUpdateTableI</IndexLocation>
<StreamLocation>^Demo.REQ.PatientUpdateTableS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
