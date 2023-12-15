Class Demo.RES.PatientUpdateData Extends (%Persistent, Ens.Request, %JSON.Adaptor) [ ProcedureBlock ]
{

Property Success As %Boolean;

Property ErrorMessage As %VarString;

Storage Default
{
<Data name="PatientUpdateDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Success</Value>
</Value>
<Value name="3">
<Value>ErrorMessage</Value>
</Value>
</Data>
<DataLocation>^Demo.RES.PatientUpdateDataD</DataLocation>
<DefaultData>PatientUpdateDataDefaultData</DefaultData>
<IdLocation>^Demo.RES.PatientUpdateDataD</IdLocation>
<IndexLocation>^Demo.RES.PatientUpdateDataI</IndexLocation>
<StreamLocation>^Demo.RES.PatientUpdateDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
