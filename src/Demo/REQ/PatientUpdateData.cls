Class Demo.REQ.PatientUpdateData Extends (%Persistent, Ens.Request, %JSON.Adaptor) [ Inheritance = left, ProcedureBlock ]
{

Property PatientId As %VarString [ Required ];

Property PatientClass As %VarString;

Property PatientDOB As %VarString;

Property PatientFirstName As %VarString;

Property PatientLastName As %VarString;

Property StudyId As %VarString;

Property StudyData As %VarString;

Storage Default
{
<Data name="PatientUpdateDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientId</Value>
</Value>
<Value name="3">
<Value>PatientClass</Value>
</Value>
<Value name="4">
<Value>PatientDOB</Value>
</Value>
<Value name="5">
<Value>PatientFirstName</Value>
</Value>
<Value name="6">
<Value>PatientLastName</Value>
</Value>
<Value name="7">
<Value>StudyId</Value>
</Value>
<Value name="8">
<Value>StudyData</Value>
</Value>
</Data>
<DataLocation>^Demo.REQ.PatientUpdateDataD</DataLocation>
<DefaultData>PatientUpdateDataDefaultData</DefaultData>
<IdLocation>^Demo.REQ.PatientUpdateDataD</IdLocation>
<IndexLocation>^Demo.REQ.PatientUpdateDataI</IndexLocation>
<StreamLocation>^Demo.REQ.PatientUpdateDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
