Class Demo.Transformations.SubTransforms.OBXtoJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:OBX' targetDocType='2.3:OBX' create='existing' language='objectscript' >
<assign value='source.{ObservationIdentifier.text}_" = "_source.{ObservationValue()}_" "_source.{Units.identifier} ' property='target.Observation' action='set' />
</transform>
}

}
