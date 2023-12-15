Class Demo.REQ.HelloTest Extends (%Persistent, Ens.Request)
{

Storage Default
{
<Data name="HelloTestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^Demo.REQ.HelloTestD</DataLocation>
<DefaultData>HelloTestDefaultData</DefaultData>
<IdLocation>^Demo.REQ.HelloTestD</IdLocation>
<IndexLocation>^Demo.REQ.HelloTestI</IndexLocation>
<StreamLocation>^Demo.REQ.HelloTestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
