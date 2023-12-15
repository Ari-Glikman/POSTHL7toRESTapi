Class Demo.Transformations.SubTransforms.PV1toJSON Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Segment, Demo.RES.TransformMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Segment' targetClass='Demo.RES.TransformMessage' sourceDocType='2.3:PV1' create='existing' language='objectscript' >
<assign value='source.{PatientClass}' property='target.PatientClass' action='set' />
<assign value='source.{SetIDPatientVisit}' property='target.IDPatientVisit' action='set' />
</transform>
}

}
