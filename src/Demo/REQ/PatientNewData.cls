Class Demo.REQ.PatientNewData Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Request)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

/// needs to be string as can start with 0 
Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property PatientClass As %String;

/// I(npatient), O(utpatient), E(mergency), P(readmit)
Property Observation As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="PatientNewDataDefaultData">
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
<Value>PatientClass</Value>
</Value>
<Value name="7">
<Value>Observation</Value>
</Value>
<Value name="8">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Demo.REQ.PatientNewDataD</DataLocation>
<DefaultData>PatientNewDataDefaultData</DefaultData>
<IdLocation>^Demo.REQ.PatientNewDataD</IdLocation>
<IndexLocation>^Demo.REQ.PatientNewDataI</IndexLocation>
<StreamLocation>^Demo.REQ.PatientNewDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
