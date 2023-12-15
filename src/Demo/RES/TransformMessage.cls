Class Demo.RES.TransformMessage Extends (%Persistent, %JSON.Adaptor, %XML.Adaptor, Ens.Request)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %String;

Property TeudatZehut As %String;

Index TeudatZehutIndex On TeudatZehut;

Property TimeofMessage As %TimeStamp [ InitialExpression = {+$h} ];

Property PatientClass As %String;

/// I(npatient), O(utpatient), E(mergency), P(readmit)
/// should this be string?
Property Observation As %String;

Property IDPatientVisit As %String;

Storage Default
{
<Data name="TransformMessageDefaultData">
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
<Value>TimeofMessage</Value>
</Value>
<Value name="7">
<Value>PatientClass</Value>
</Value>
<Value name="8">
<Value>Observation</Value>
</Value>
<Value name="9">
<Value>IDPatientVisit</Value>
</Value>
</Data>
<DataLocation>^Demo.RES.TransformMessageD</DataLocation>
<DefaultData>TransformMessageDefaultData</DefaultData>
<IdLocation>^Demo.RES.TransformMessageD</IdLocation>
<IndexLocation>^Demo.RES.TransformMessageI</IndexLocation>
<StreamLocation>^Demo.RES.TransformMessageS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
