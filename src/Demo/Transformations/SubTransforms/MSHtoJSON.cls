Class Demo.Transformations.SubTransforms.MSHtoJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:MSH' targetDocType='2.3:MSH' create='existing' language='objectscript' >
<assign value='source.{DateTimeofMessage}' property='target.TimeofMessage' action='set' />
</transform>
}

}
